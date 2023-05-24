wd <- "/data/humgen/daskalakislab/aiatrou/Science/Metaanalysis_March/baseline/"
ct_files <- list.files(wd)

for (ctf in ct_files){
  out <- gsub(".RDS",".csv",ctf)
  df <- readRDS(paste0(wd,ctf))
  df$genes <- rownames(df)
  names(df)[names(df)=="FDR"] <- "adj.P.Val"
  df <- df[,c("genes", "beta", "se", "pval", "adj.P.Val")]
  write.csv(df,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Full/",out),row.names = F,quote = F)
  df_trimmed <- df[df$adj.P.Val < 0.05,]
  write.csv(df,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Trimmed/",out),row.names = F,quote = F)
  
}

