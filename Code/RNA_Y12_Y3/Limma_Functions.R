library(dplyr)
library(limma)
library(ggplot2)
library(ggrepel)
library(bacon)

# Step 1 extract expression matrix from voom object
# Input: 
#   voom_file = path to voom_file
# Output:
#   returns expression matrix from voom file as a data frame
extract_expr <- function(voom_file){
  voom <- readRDS(voom_file)
  expr <- voom$E
  expr <- as.data.frame(expr)
  return(expr)
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
  sample_ids <- unique(anno$SampleID)
  sample_ids <- sample_ids[sample_ids %in% names(expr)]
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


# Step 6: Map ensembleIDs to gene names
# Input:
#   results = results of run_limma code
# Output:
#   Results with gene symbols
map_gene_names <- function(results){
  
  gene_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/RNA_Gene_Map.RDS")
  results <- merge(results, gene_map, by.x="gene", by.y="genes", all.x=T)
  
  return(results)
}

# Input:
#   results = results of run_limma code
# Output:
#   Results with gene symbols
map_exon_names <- function(results){
  
  exon_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/exon_map_with_index.RDS")
  results <- merge(results, exon_map, by="exon", all.x=T)
  
  return(results)
}

# Input:
#   results = results of run_limma code
# Output:
#   Results with gene symbols
map_jx_names <- function(results){
  
  jx_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/jx_map.RDS")
  results <- merge(results, jx_map, by="jx", all.x=T)
  
  return(results)
}

# Input:
#   results = results of run_limma code
# Output:
#   Results with gene symbols
map_tx_names <- function(results){
  
  tx_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/tx_map.RDS")
  results <- merge(results, tx_map, by="tx", all.x=T)
  
  return(results)
}

# Function to produce volcano plots from output of run_limma
# Input:
#   results: limma results
#   out_folder: location to save .tiff files
#   dx: Dx of interest
#   contrast: contrast variable from analysis
#   region: brain region of analysis
plot_volcano <- function(results, dx, contrast, region, ptsd_vs_mdd=F, ptsd_mdd=F, type){
  
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
  if(type=="gene"){
    results[results$symbol=="FKBP5", "genelabels"] <- T
    results[results$symbol=="NR3C1", "genelabels"] <- T
    results[results$symbol=="NR3C2", "genelabels"] <- T
    results[results$symbol=="CRH", "genelabels"] <- T
    results[results$symbol=="CRHR1", "genelabels"] <- T
    results[results$symbol=="CRHR2", "genelabels"] <- T
  }
  
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

inflation <- function(ps) {
  chisq <- qchisq(1 - ps, 1)
  lambda <- median(chisq) / qchisq(0.5, 1)
  lambda
}

# Wrapper function to run all code
limma_wrapper <- function(anno_file, voom_file, region, dx=NULL, ptsd_vs_mdd = F, ptsd_mdd = F, sex=NULL, type,
                          covariates, contrast_var, out_folder){
  
  # Step 1: Load annotation file and expression matrix
  anno <- readRDS(anno_file)
  if (!(type=="tx")){
    expr <- extract_expr(voom_file)
  }else{
    expr <- readRDS(voom_file)
  }
  
  if(!is.null(sex)){
    anno <- filter_sex(anno = anno, sex = sex)
  }
  
  # Step 2: Filter annotation file to necessary brain region
  anno_br <- filter_brain_region(anno = anno, region = region)
  rm(anno)
  
  # Step 3: Filter annotation file to dx of interest
  anno_br_dx <- filter_dx(anno = anno_br, dx = dx, ptsd_vs_mdd = ptsd_vs_mdd, ptsd_mdd = ptsd_mdd)
  rm(anno_br)
  
  # Step 4: Filter expression matrix to the same samples as are in the annotation file
  expr_br_dx <- filter_expr(expr = expr, anno = anno_br_dx)
  rm(expr)

  anno_br_dx <- anno_br_dx[anno_br_dx$SampleID %in% names(expr_br_dx),]

  
  if (!(identical(names(expr_br_dx),anno_br_dx$SampleID))){
    print("FATAL ERROR: orders do not match")
  }else{
    print("ORDER ALL GOOD")
  }
  # Step 5: Run limma code
  results <- run_limma(anno = anno_br_dx, expr = expr_br_dx, covariates = covariates, contrast_var = contrast_var, type=type)
  
  # Step 6: Map ensembleIDs to gene names
  if (type == "gene"){
    results <- map_gene_names(results = results)
  }else if (type == "exon"){
    results <- map_exon_names(results = results)
  }else if (type == "jx"){
    results <- map_jx_names(results = results)
  }else if (type == "tx"){
    results <- map_tx_names(results = results)
  }
  
  if (!dir.exists(out_folder)){
    dir.create(out_folder, recursive = T)
  }
  # Step 7: Plot volcano
  volc <- plot_volcano(results=results, dx=dx, contrast=contrast_var, region=region, ptsd_vs_mdd=ptsd_vs_mdd, ptsd_mdd=ptsd_mdd, type=type)
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


# region <- "mPFC"
# anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_batch1.RDS"
# voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/batch1/log2TMM1_",region,".RDS")
# region = region
# dx="PTSD"
# ptsd_vs_mdd = F
# ptsd_mdd = F
# sex = NULL
# type = "tx"
# covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped")
# contrast_var = "PTSD"
# out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Txs/FinalizedCovs_01_30_23/batch1/PTSD/"

