bulk_dirs <- list.dirs("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor")
bulk_dirs <- bulk_dirs[endsWith(bulk_dirs,"Methylation") | endsWith(bulk_dirs,"Protein/Proteins") | endsWith(bulk_dirs,"Peptides") |
                         endsWith(bulk_dirs,"Genes") | endsWith(bulk_dirs,"Exons") | endsWith(bulk_dirs,"Jxs") | endsWith(bulk_dirs,"Txs")]






for (bd in bulk_dirs){
  
  if (endsWith(bd, "Peptides")){
    res_files <- list.files(bd,pattern = "cc.RDS")
  }else{
    res_files <- list.files(bd,pattern = ".RDS")
  }
  
  
  for (rf in res_files){
    print(paste0(bd,"/",rf))
    out <- gsub(".RDS","_beta_sd.RDS",rf)
    out_dir <- gsub("Metafor", "Metafor/BetaSD",bd)

    if (!(dir.exists(out_dir))){
      dir.create(out_dir, recursive = T)
    }

    res <- readRDS(paste0(bd,"/",rf))
    #res <- res[,c(1,11,3:6,12)]
    #names(res)[names(res)=="FDR"] <- "adj.P.Val"

    mean_beta <- mean(res$beta)
    sd_beta <- sd(res$beta)

    res$beta_mean <- mean_beta
    res$beta_sd <- sd_beta
    res$dist_from_mean <- res$beta - mean_beta
    res$sd_from_mean <- res$dist_from_mean/sd_beta

    print(paste0(out_dir,"/",out))
    saveRDS(res,paste0(out_dir,"/",out))
  }
}
