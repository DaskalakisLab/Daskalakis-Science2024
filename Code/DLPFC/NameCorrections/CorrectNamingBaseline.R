res_dirs <- list.dirs("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC", recursive = T)
res_dirs <- res_dirs[endsWith(res_dirs, "MDD") | endsWith(res_dirs, "PTSD") | endsWith(res_dirs, "PTSD_MDD") | endsWith(res_dirs, "PTSD_vs_MDD")]


for (rd in res_dirs){
  res_file <- list.files(rd, pattern = "results_.*")
  
  res <- readRDS(paste0(rd, "/", res_file))
  res <- res[names(res)[!(names(res) %in% c("z","p_bacon","p_bacon_adj","lambda","lambda_bacon","symbol","idx"))]]
  
  out_dir <- gsub("/DLPFC/", "/DLPFCCorrectedNames/", rd)
  print(paste0(out_dir, "/", res_file))
  print(paste("Rows pre-merge:", nrow(res)))
  
  if ("gene" %in% names(res)){
    name_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/NameMappings/GeneMap.RDS")
    res <- merge(res, name_map, by.x="gene", by.y="gencodeID", all.x=T)
  }
  if ("exon" %in% names(res)){
    name_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/NameMappings/ExonMap.RDS")
    res <- merge(res, name_map, by.x="exon", by.y="ensembleID", all.x=T)
  }
  if ("tx" %in% names(res)){
    name_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/NameMappings/TxMap.RDS")
    res <- merge(res, name_map, by.x="tx", by.y="transcript_id", all.x=T)
  }
  if ("jx" %in% names(res)){
    name_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/NameMappings/JxMap.RDS")
    res <- merge(res, name_map, by.x="jx", by.y="Jx", all.x=T)
  }
  print(paste("Rows post-merge:", nrow(res)))
  
  saveRDS(res,paste0(out_dir, "/", res_file))
  
  
}