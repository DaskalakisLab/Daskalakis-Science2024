create_formula <- function(covariates){
  form <- formula(paste0("~", paste(covariates, collapse = "+")))
  return(form)
}


plot_volcano <- function(results, analysis, contrast_var, region, dx, pres=NULL){
  
  title <- paste0("Analysis: ", analysis, ", Contrast: ", contrast_var, ", Region: ", region)
  
  if (!is.null(pres)){
    results <- merge(results,pres,by="Module",all.x=T)
  }
  
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
  results$labels <- F
  results$labels[1:30] <- T
  
  if (!is.null(pres)){
    p<-ggplot(results) +
      geom_point(aes(x = logFC, y = lp, colour = factor(Color), size=moduleSize, shape=Preserved)) +
      #geom_point(aes(x = logFC, y = lp, colour = factor(Color))) +
      geom_text_repel(aes(x = logFC, y = lp, label = ifelse(labels == T, Module,"")),fontface="italic",size=3,max.overlaps=1000) +
      scale_color_manual(values=col_df$Colors)+
      scale_shape_manual(values=c(1,16))+
      xlab("log2(FC)") +
      ylab("-log10(pvalue)") +
      ggtitle(title)+
      theme(legend.position = "none",
            plot.title = element_text(hjust = 0.5),
            text = element_text(size = 20,face="bold")
      )
  }else{
    p<-ggplot(results) +
      #geom_point(aes(x = logFC, y = lp, colour = factor(Color), size=moduleSize, shape=Preserved)) +
      geom_point(aes(x = logFC, y = lp, colour = factor(Color))) +
      geom_text_repel(aes(x = logFC, y = lp, label = ifelse(labels == T, Module,"")),fontface="italic",size=3,max.overlaps=1000) +
      scale_color_manual(values=col_df$Colors)+
      scale_shape_manual(values=c(1,16))+
      xlab("log2(FC)") +
      ylab("-log10(pvalue)") +
      ggtitle(title)+
      theme(legend.position = "none",
            plot.title = element_text(hjust = 0.5),
            text = element_text(size = 20,face="bold")
      )
  }
  
  
  return(p)
}

save_volcano <- function(p, out_folder, analysis, contrast_var, region){
  
  ggsave(filename=paste0(out_folder, "/Volcano_", analysis, "_", contrast_var, "_", region, ".pdf"),
         plot = p,
         device = "pdf",
         units = "in",
         width = 9,
         height = 12)
}


limma_wrapper <- function(anno_file,expr_file,covariates,contrast_var,analysis,region,out_folder,pres=NULL){
  anno <- readRDS(anno_file)
  expr <- readRDS(expr_file)
  
  anno <- anno[anno$SampleID %in% colnames(expr),]
  expr <- expr[,anno$SampleID]
  
  if (identical(anno$SampleID,colnames(expr))){
    print("ORDER ALL GOOD")
  }else{
    print("FATAL ERROR")
    return(0)
  }
  
  # Create model matrix
  # General Analysis
  print(paste("Number of subjects in annotation:",nrow(anno)))
  print(paste("Number of subjects in expression matrix:",ncol(expr)))
  print(paste("Number of subjects in contrast column:",nrow(anno[anno[[contrast_var]]==1,])))
  
  form <- create_formula(covariates)
  print(form)
  
  #design<-model.matrix(formula(paste0("~",contrast_var)), data=anno)
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
  
  # Run limma
  results <-limma::topTable(fit2.ebayes,number=nrow(fit2.ebayes),coef=1, adjust="BH")
  results$Module <- rownames(results)
  
  # load(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/modulePreservation_CtrlMDD.RData"))
  # mp_mdd$preservation
  # ptsd_pres <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/modulePreservation_CtrlPTSD.RDS"))
  # ptsdmdd_pres <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/PreservationMDD.RDS"))
  
  
  if (!dir.exists(out_folder)){
    dir.create(out_folder, recursive = T)
  }
  saveRDS(anno, paste0(out_folder,"/annotation_", analysis, "_", region, "_", contrast_var, ".RDS"))
  saveRDS(expr, paste0(out_folder,"/expression_", analysis, "_", region, "_", contrast_var, ".RDS"))
  saveRDS(results, paste0(out_folder,"/results_", analysis, "_", region, "_", contrast_var, ".RDS"))
  
  if(analysis=="PTSD"){
    pres <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/PreservationPTSD.RDS"))
  }else if(analysis=="MDD"){
    pres <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/PreservationMDD.RDS"))
  }else if (analysis=="PTSD_MDD"){
    pres <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/PreservationPTSD+MDD.RDS"))
  }#else if (analysis=="PTSD_vs_MDD"){
  #   pres <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/PreservationMDD.RDS"))
  # }
  
  volcano <- plot_volcano(results = results, analysis = analysis, contrast_var = contrast_var, region = region, pres = pres)
  save_volcano(p = volcano, out_folder = out_folder, analysis = analysis, contrast_var = contrast_var, region = region)
}

regions <- c("CentralAmyg", "DG", "mPFC")
for (region in regions){
  limma_wrapper(
    anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
    expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_Male.RDS"),
    covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
    contrast_var = "PTSD",
    analysis = "PTSD",
    region = region,
    out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_Male/"
  )
  limma_wrapper(
    anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
    expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_MDD_Male.RDS"),
    covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
    contrast_var = "MDD",
    analysis = "MDD",
    region = region,
    out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/MDD_Male/"
  )
  limma_wrapper(
    anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
    expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_MDD_Male.RDS"),
    covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
    contrast_var = "PTSD_MDD",
    analysis = "PTSD_MDD",
    region = region,
    out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_MDD_Male/"
  )
  limma_wrapper(
    anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
    expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_vs_MDD_Male.RDS"),
    covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
    contrast_var = "PTSD",
    analysis = "PTSD_vs_MDD",
    region = region,
    out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_vs_MDD_Male/"
  )
  limma_wrapper(
    anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
    expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_Female.RDS"),
    covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
    contrast_var = "PTSD",
    analysis = "PTSD",
    region = region,
    out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_Female/"
  )
  limma_wrapper(
    anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
    expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_MDD_Female.RDS"),
    covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
    contrast_var = "MDD",
    analysis = "MDD",
    region = region,
    out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/MDD_Female/"
  )
  limma_wrapper(
    anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
    expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_MDD_Female.RDS"),
    covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
    contrast_var = "PTSD_MDD",
    analysis = "PTSD_MDD",
    region = region,
    out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_MDD_Female/"
  )
  limma_wrapper(
    anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
    expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_vs_MDD_Female.RDS"),
    covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
    contrast_var = "PTSD",
    analysis = "PTSD_vs_MDD",
    region = region,
    out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_vs_MDD_Female/"
  )
}