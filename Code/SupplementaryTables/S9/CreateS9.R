library(dplyr)

wd <- "/data/humgen/daskalakislab/jajoo/SciencePaper/UKBBData/ToUpload/"
tab_files <- list.files(wd)

for (tf in tab_files){
  df <- fread2(paste0(wd,tf))
  df <- df[,names(df)[!(names(df) %in% c("baconp.adj","mean","sd"))]]
  names(df)[names(df)=="sddiff"] <- "beta_sd_from_mean"
  write.csv(df, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S9/Full/",tf),row.names = F,quote = F)
  
  df_trimmed <- df[df$p.adj < 0.05,]
  write.csv(df_trimmed, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S9/Trimmed/",tf),row.names = F,quote = F)
}