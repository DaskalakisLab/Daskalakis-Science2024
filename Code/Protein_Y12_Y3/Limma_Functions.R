library(dplyr)
library(limma)
library(ggplot2)
library(ggrepel)

inflation <- function(ps) {
  chisq <- qchisq(1 - ps, 1)
  lambda <- median(chisq) / qchisq(0.5, 1)
  lambda
}

# Step 1: Change prepare normalized data
# Function to change names in normalized data to sampleIDs
# Input:
#   norm_file = path to TAMPOR normalized protein/peptide file
#   anno = annotation object
prepare_norm <- function(norm_file,anno){
  norm <- readRDS(norm_file)
  norm <- as.data.frame(norm$cleanDat)
  
  batch_designs <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Proteomics/batch_designs.RDS")
  
  batch_designs <- as.data.frame(batch_designs)
  batch_designs$Plate <- gsub("F", "", batch_designs$Plate)
  batch_designs$Plate <- sprintf("%02d", as.numeric(batch_designs$Plate))
  batch_designs$ID <- paste0("b",batch_designs$Plate, ".", batch_designs$Position)
  
  batch_designs <- merge(batch_designs, anno[,c("BrNum","SampleID","Brain_Region_Protein")], by.x=c("BrNum", "Brain_Region"), by.y=c("BrNum", "Brain_Region_Protein"), all.x=T)
  batch_designs[batch_designs$BrNum=="GIS","SampleID"] <- batch_designs[batch_designs$BrNum=="GIS","ID"]
  
  for (id in names(norm)){
    print(id)
    names(norm)[names(norm)==id] <- batch_designs[batch_designs$ID == id,"SampleID"]
  }
  names(norm)
  norm <- norm[,startsWith(names(norm), "R")]
  return(norm)
}

# Step 2: Filter annotation file by Sex
# Input:
#   anno = annotation object
#   sex = M for Male, F for Female
# Output:
#   Filtered annotation file with only sample for the given brain region
filter_sex <- function(anno, sex){
  anno <- anno[anno$Sex==sex,]
  print(paste("Data filtered to only:", unique(anno$Sex)))  
  return(anno)
}

# Step 2: Filter annotation file to necessary brain region
# Input:
#   anno = annotation object
#   region = brain region to subset data to
# Output:
#   Filtered annotation file with only sample for the given brain region
filter_brain_region <- function(anno, region){
  anno <- anno[anno$Brain_Region==region,]
  print(paste("Data filtered to brain region:", unique(anno$Brain_Region)))  
  return(anno)
}


# Step 3: Filter annotation file to dx of interest
# Input:
#   anno = annotation object
#   dx = disease to subset to
#   ptsd_vs_mdd = TRUE if doing PTSD vs MDD subjects
#   ptsd_mdd = TRUE if doing PTSD+MDD vs Control
# Output:
#   Filtered annotation file 
filter_dx <- function(anno, dx=NULL, ptsd_vs_mdd=F, ptsd_mdd=F){
  if (ptsd_vs_mdd){
    anno <- anno[(anno$Dx=="PTSD") | (anno$Dx=="MDD"), ]
    dxs <- paste(unlist(unique(anno$Dx)),collapse = ", ")
    print(paste("Data filtered to Dx: ", dxs))
    print(paste0("Number of subjects with PTSD: ", length(unique(anno[anno$Dx=="PTSD", "BrNum"]))))
    print(paste0("Number of subjects with MDD: ", length(unique(anno[anno$Dx=="MDD", "BrNum"]))))
  }else if (ptsd_mdd){
    print(paste0("Number of subjects with PTSD or MDD: ", length(unique(anno[anno$PTSD_MDD==1, "BrNum"]))))
    print(paste0("Number of Control subjects: ", length(unique(anno[anno$Dx=="Control", "BrNum"]))))
  }else{
    anno <- anno[(anno$Dx==dx) | (anno$Dx=="Control"),]
    dxs <- paste(unlist(unique(anno$Dx)),collapse = ", ")
    print(paste("Data filtered to Dx: ", dxs))
    print(paste0("Number of subjects with ", dx,": ", length(unique(anno[anno$Dx==dx, "BrNum"]))))
    print(paste0("Number of Control subjects: ", length(unique(anno[anno$Dx=="Control", "BrNum"]))))
  }
  return(anno)
}


# Step 4: Filter expression matrix to the same samples as are in the annotation file
# Input:
#   expr = expression object
#   anno = annotation object
# Output:
#   Expression object filtered to the same samples as in the annotation file
filter_expr <- function(expr, anno){
  sample_ids <- unique(anno$BrNum)
  expr <- expr[,sample_ids]
  if (setequal(names(expr),sample_ids)){
    print("Expression Data Filtered Succesfully!")
  }else{
    stop("Voom object missing sample IDs! Please check your data.")
  }
  return(expr)
}

# Step 5: Run limma code
# Input: 
#   covariates = list of covariates
# Output:
#   Formula of covariates to be used in the limma analysis
create_formula <- function(covariates){
  form <- formula(paste0("~", paste(covariates, collapse = "+")))
  return(form)
}

# Input:
#   anno = annotation object
#   expr = expression object
#   covariates = list of covariates
#   contrast_var = variable of interest
#   type = type of analysis (used to name column in results)
# Output:
#   Results of limma analysis
run_limma <- function(anno, expr, covariates, contrast_var, type=NULL){
  
  # Create model matrix
  # General Analysis
  print(paste("Number of subjects in annotation:",nrow(anno)))
  print(paste("Number of subjects in expression matrix:",ncol(expr)))
  print(paste("Number of subjects in contrast column:",nrow(anno[anno[[contrast_var]]==1,])))
  form <- create_formula(covariates)
  print(form)
  design<-model.matrix(form, data=anno)
  
  colnames(design) <- gsub(":", "_", colnames(design))
  colnames(design)
  dim(design)
  
  # Runs linear models
  fit<-lmFit(expr, design)
  
  # Make contrast matrix
  myargs <- list(contrast_var, levels=design)
  contrast.matrix<-do.call(makeContrasts, myargs)
  
  # Have to rename the contrast matrix
  rownames(contrast.matrix)[1]<-"(Intercept)"
  
  fit2<-contrasts.fit(fit, contrast.matrix)
  
  
  # Run empirical bayes
  fit2.ebayes<-eBayes(fit2)
  SE_table <- data.frame(s2.post=fit2.ebayes$s2.post, stdev.unscaled=fit2.ebayes$stdev.unscaled)
  names(SE_table) <- c("s2.post","stdev.unscaled")
  SE_table$SE <- sqrt(SE_table$s2.post)*SE_table$stdev.unscaled
  
  
  # Run limma
  results <-limma::topTable(fit2.ebayes,number=nrow(fit2.ebayes),coef=1, adjust="BH")
  results[[type]] <- rownames(results)
  results$symbol <- gsub("\\|.*", "", results[[type]])
  
  results <- merge(results, SE_table, by="row.names", all.x=T)
  rownames(results) <- results$Row.names
  results <- results[,2:ncol(results)]
  
  
  
  z = abs(qnorm(results$P.Value))*sign(results$logFC)
  results$z=z
  results[is.na(results$z),"z"] <- 0
  
  bc<-bacon(results$z)
  #bc<-bacon(z,na.exclude = T)
  p_new=as.numeric(pval(bc))
  results$p_bacon=p_new
  results$p_bacon_adj=p.adjust(results$p_bacon, method = "fdr", n = nrow(results))
  
  lambda <- inflation(results$P.Value)
  lambda_bacon <- inflation(results$p_bacon)
  
  results$lambda <- lambda
  results$lambda_bacon <- lambda_bacon
  
  return(results)
}

# Function to produce volcano plots from output of run_limma
# Input:
#   results: limma results
#   out_folder: location to save .tiff files
#   dx: Dx of interest
#   contrast: contrast variable from analysis
#   region: brain region of analysis
plot_volcano <- function(results, dx, contrast, region, ptsd_vs_mdd=F, ptsd_mdd=F){
  results <- results[!(is.na(results$P.Value)),]
  
  if (ptsd_vs_mdd){
    dx <- "PTSD vs MDD"
  }else if (ptsd_mdd){
    dx <- "PTSD+MDD"
  }
  title <- paste0("Dx: ", dx, ", Contrast: ", contrast, ", Region: ", region)
  results$lp <- -log10(results$P.Value)
  results$Color <- 1
  
  results[(results$P.Value < 0.05) & (results$logFC < 0), "Color"] <- 2
  results[(results$P.Value < 0.05) & (results$logFC > 0), "Color"] <- 3
  results[(results$adj.P.Val < 0.05) & (results$logFC < 0), "Color"] <- 4
  results[(results$adj.P.Val < 0.05) & (results$logFC > 0), "Color"] <- 5
  
  col_df <- data.frame(Vals=c(1,2,3,4,5), 
                       Colors=c("grey","lightblue","pink","blue","red"))
  
  cols <- unique(results$Color)
  col_df <- col_df[col_df$Vals %in% cols,]
  
  results <- results[order(results$P.Value),]
  results$genelabels <- F
  results$genelabels[1:30] <- T
  
  p<-ggplot(results) +
    geom_point(aes(x = logFC, y = lp, colour = factor(Color))) +
    geom_text_repel(aes(x = logFC, y = lp, label = ifelse(genelabels == T, symbol,"")),fontface="italic",size=3,max.overlaps=1000) +
    scale_color_manual(values=col_df$Colors)+
    xlab("log2(FC)") +
    ylab("-log10(pvalue)") +
    ggtitle(title)+
    theme(legend.position = "none",
          plot.title = element_text(hjust = 0.5),
          text = element_text(size = 20,face="bold")
    )
  
  return(p)
}
# Function to save volcano plots
save_volcano <- function(p, out_folder, dx, contrast, region, ptsd_vs_mdd=F, ptsd_mdd=F){
  if (ptsd_vs_mdd){
    dx <- "PTSD vs MDD"
  }else if (ptsd_mdd){
    dx <- "PTSD+MDD"
  }
  ggsave(filename=paste0(out_folder, "/Volcano_", dx, "_", contrast, "_", region, ".pdf"),
         plot = p,
         device = "pdf",
         units = "in",
         width = 9,
         height = 12)
}


# Wrapper function to run all code
limma_wrapper <- function(anno_file, tamp_file, region, dx=NULL, ptsd_vs_mdd = F, ptsd_mdd = F, sex=NULL, type,
                          covariates, contrast_var, out_folder){
  
  # Step 1: Load annotation file and expression matrix
  anno <- readRDS(anno_file)
  expr <- readRDS(tamp_file)
  
  # Step 2: Filter annotation file by sex
  if(!is.null(sex)){
    anno <- filter_sex(anno = anno, sex = sex)
  }
 
  # Step 2: Filter annotation file to necessary brain region
  anno_br <- filter_brain_region(anno = anno, region = region)
  rm(anno)
  
  # Step 3: Filter annotation file to dx of interest
  anno_br_dx <- filter_dx(anno = anno_br, dx = dx, ptsd_vs_mdd = ptsd_vs_mdd, ptsd_mdd = ptsd_mdd)
  rm(anno_br)
  
  anno_br_dx <- anno_br_dx[!is.na(anno_br_dx$SampleID),]
  
  # Step 4: Filter expression matrix to the same samples as are in the annotation file
  expr_br_dx <- filter_expr(expr = expr, anno = anno_br_dx)
  rm(expr)
  if (!(identical(names(expr_br_dx),anno_br_dx$BrNum))){
    print("FATAL ERROR: orders do not match")
  }else{
    print("ORDER ALL GOOD")
  }
  # Step 5: Run limma code
  results <- run_limma(anno = anno_br_dx, expr = expr_br_dx, covariates = covariates, contrast_var = contrast_var, type=type)
  
  if (!dir.exists(out_folder)){
    dir.create(out_folder, recursive = T)
  }
  # Step 6: Plot volcano
  volc <- plot_volcano(results=results, dx=dx, contrast=contrast_var, region=region, ptsd_vs_mdd=ptsd_vs_mdd, ptsd_mdd=ptsd_mdd)
  save_volcano(p=volc, out_folder=out_folder, dx=dx, contrast=contrast_var, region=region, ptsd_vs_mdd=ptsd_vs_mdd, ptsd_mdd=ptsd_mdd)
  
  if (ptsd_vs_mdd){
    dx = "PTSD_vs_MDD"
  }else if (ptsd_mdd){
    dx = "PTSD+MDD"
  }
  saveRDS(anno_br_dx, paste0(out_folder,"/annotation_", dx, "_", region, "_", contrast_var, ".RDS"))
  saveRDS(expr_br_dx, paste0(out_folder,"/expression_", dx, "_", region, "_", contrast_var, ".RDS"))
  saveRDS(results, paste0(out_folder,"/results_", dx, "_", region, "_", contrast_var, ".RDS"))
}

# anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_batch1.RDS"
# tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/batch1/Proteins/CleanedWithSampleIDs/batch1_",region,"_clean_no_GIS.RDS")
# region = "CentralAmyg"
# dx="PTSD"
# ptsd_vs_mdd = F
# ptsd_mdd = F
# type = "protein"
# sex = "M"
# covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped")
# contrast_var = "PTSD"
# out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/SexSpecific/batch1/PTSD_Male/"
# 
