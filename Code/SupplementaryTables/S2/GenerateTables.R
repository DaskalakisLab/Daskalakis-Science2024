res_dir <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline"
res_dirs <- list.dirs(res_dir,recursive = T)
res_dirs <- res_dirs[!(endsWith(res_dirs,"Baseline")) & !(endsWith(res_dirs,"Protein")) & !(endsWith(res_dirs,"RNA"))]

for (rd in res_dirs){
  res_files <- list.files(rd)
  res_files <- res_files[!startsWith(res_files, "PTSD_MDD")]
  res_files <- res_files[!startsWith(res_files, "PTSD_vs_MDD")]
  #print(res_files)
  for (rf in res_files){
    res <- readRDS(paste0(rd,"/",rf))
    if (endsWith(rd, "Methylation")){
      cpg_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/CPGMap/cpgMapFull.RDS")
      names(res)[names(res)=="symbol"] <- "symbolOld"
      print(nrow(res))
      res <- merge(res,cpg_map,by.x="meth",by.y="cpg",all.x=T)
      print(nrow(res))
      res <- res[,c("meth","symbol","beta","se","pval","FDR","sd_from_mean")]
    }else if (endsWith(rd, "Peptides")){
      res <- res[,c("peptide","symbol","beta","se","pval","FDR","sd_from_mean")]
    }else if (endsWith(rd, "Proteins")){
      res <- res[,c("protein","symbol","beta","se","pval","FDR","sd_from_mean")]
    }else if (endsWith(rd, "Genes")){
      res <- res[,c("gene","symbol","beta","se","pval","FDR","sd_from_mean")]
    }else if (endsWith(rd, "Exons")){
      exon_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/exon_map_with_index_updated.RDS")
      print(nrow(res))
      res <- merge(res, exon_map[,c("exon","exon_gencodeID")],by="exon",all.x = T)
      print(nrow(res))
      res <- res[,c("exon","exon_gencodeID","symbol","beta","se","pval","FDR","sd_from_mean")]
    }else if (endsWith(rd, "Jxs")){
      res <- res[,c("jx","symbol","beta","se","pval","FDR","sd_from_mean")]
    }else if (endsWith(rd, "Txs")){
      res <- res[,c("tx","symbol","beta","se","pval","FDR","sd_from_mean")]
    }

    out_dir_full <- gsub("Metafor/BetaSD/Baseline", "SupplementaryTables/S2/Full",rd)
    out_file <- gsub(".RDS", ".csv", rf)
    names(res)[names(res)=="FDR"] <- "adj.P.Val"
    names(res)[names(res)=="sd_from_mean"] <- "beta_sd_from_mean"
    if (!dir.exists(out_dir_full)){
      dir.create(out_dir_full,recursive = T)
    }
    write.csv(res,paste0(out_dir_full,"/",out_file),row.names = F,quote = F)


    res <- res[res$adj.P.Val < 0.05,]

    out_dir_trim <- gsub("Metafor/BetaSD/Baseline", "SupplementaryTables/S2/Trimmed",rd)
    if (!dir.exists(out_dir_trim)){
      dir.create(out_dir_trim,recursive = T)
    }

    write.csv(res,paste0(out_dir_trim,"/",out_file),row.names = F,quote = F)
  }
}


