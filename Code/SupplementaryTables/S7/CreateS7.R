clean_leading_edge <- function(df){
  
  for(i in 1:nrow(df)){
    le <- df$leadingEdge[i]
    le <- paste(le[[1]],collapse = ":")
    df$leadingEdge[i] <- le
  }
  df$leadingEdge <- as.character(df$leadingEdge)
  
  return(df)
}

wd <- "/data/humgen/daskalakislab/aiatrou/Science/snGSEA_March/"

celltypes <- c("Astro","Endothelial","Ex","In","Microglia","Oligo","OPC","Pericytes")

for (ct in celltypes){
  
  if (ct == "Ex" | ct == "In"){
    ptsd <- readRDS(paste0(wd,ct,"/GSEA_tidy_PTSD_",ct,"_RE.RDS"))
    mdd <- readRDS(paste0(wd,ct,"/GSEA_tidy_MDD_",ct,"_RE.RDS"))
  }else{
    ptsd <- readRDS(paste0(wd,ct,"/GSEA_tidy_PTSD_",ct,".RDS"))
    mdd <- readRDS(paste0(wd,ct,"/GSEA_tidy_MDD_",ct,".RDS"))
  }
  
  ptsd <- clean_leading_edge(ptsd)
  mdd <- clean_leading_edge(mdd)
  
  write.csv(ptsd,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S7/Full/PTSD_",ct,".csv"),row.names = F,quote = F)
  write.csv(mdd,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S7/Full/MDD_",ct,".csv"),row.names = F,quote = F)
  
  ptsd_trimmed <- ptsd[ptsd$padj < 0.05,]
  mdd_trimmed <- mdd[mdd$padj < 0.05,]
  
  write.csv(ptsd_trimmed,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S7/Trimmed/PTSD_",ct,".csv"),row.names = F,quote = F)
  write.csv(mdd_trimmed,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S7/Trimmed/MDD_",ct,".csv"),row.names = F,quote = F)
  
  
}
