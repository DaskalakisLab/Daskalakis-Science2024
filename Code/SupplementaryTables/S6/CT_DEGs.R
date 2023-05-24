

create_ct_tables <- function(disease){
  wd <- "/data/humgen/daskalakislab/aiatrou/Science/Pseudobulk_MitoExon/"
  
  celltypes <- c("In_RE", "Ex_RE", "Oligo", "OPC", "Astro", "Micro", "Endothelial", "Pericytes")
  
  for (ct in celltypes){
    df <- readRDS(paste0(wd,disease,"/DEGs_",disease,"_",ct,".RDS"))
    df <- df[,c("genes","logFC","SE","P.Value","adj.P.Val")]
    write.csv(df,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Full/",disease,"_",ct,".csv"),row.names = F,quote = F)
    df_trimmed <- df[df$adj.P.Val < 0.05,]
    write.csv(df_trimmed,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Trimmed/",disease,"_",ct,".csv"),row.names = F,quote = F)
    
  }
  
}

create_ct_tables("PTSD")
create_ct_tables("MDD")
create_ct_tables("Combined")