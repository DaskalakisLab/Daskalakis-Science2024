dlpfc_dirs <- list.dirs("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFCCorrectedNames/Genes/DLPFC231")

dlpfc_dirs <- dlpfc_dirs[!endsWith(dlpfc_dirs, "DLPFC231")]




for (dd in dlpfc_dirs){
  
  res_files <- list.files(dd,pattern = ".RDS")
  
  
  for (rf in res_files){
    print(paste0(dd,"/",rf))
    out <- gsub(".RDS","_logFC_sd.RDS",rf)
    out_dir <- gsub("DLPFC231", "DLPFC231LogFCSD",dd)
    print(out_dir)
    
    if (!(dir.exists(out_dir))){
      dir.create(out_dir, recursive = T)
    }
    
    res <- readRDS(paste0(dd,"/",rf))
    #res <- res[,c(1,11,3:6,12)]
    #names(res)[names(res)=="FDR"] <- "adj.P.Val"
    
    mean_logFC <- mean(res$logFC)
    sd_logFC <- sd(res$logFC)
    
    res$logFC_mean <- mean_logFC
    res$logFC_sd <- sd_logFC
    res$dist_from_mean <- res$logFC - mean_logFC
    res$sd_from_mean <- res$dist_from_mean/sd_logFC
    
    print(paste0(out_dir,"/",out))
    saveRDS(res,paste0(out_dir,"/",out))
  }
}
