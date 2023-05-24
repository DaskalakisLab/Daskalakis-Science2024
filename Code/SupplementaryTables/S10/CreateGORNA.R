
createGOfilesRNA <- function(region){
  wd <- "/data/humgen/daskalakislab/aiatrou/Science/WGCNA/GO/"
  
  go_files <- list.files(paste0(wd,region))
  go_files <- go_files[!grepl("protein_", go_files)]
  
  first<-T
  for (gf in go_files){
    module <- gsub("GO_", "", gf)
    module <- gsub(".csv", "", module)
    df <- read.csv(paste0(wd,region,"/",gf))
    df <- df[,names(df)!="X"]
    if (nrow(df) > 10){
      df <- df[order(df$p.adjust),]
      df <- df[1:10,]
    }
    if (nrow(df) > 0){
      df$Module <- module
      if (first){
        df_return <- df
        first <- F
      }else{
        df_return <- rbind(df_return,df)
      }
    }
  }
  return(df_return)
  
}

cea <- createGOfilesRNA("CentralAmyg")
dg <- createGOfilesRNA("DG")
mpfc <- createGOfilesRNA("mPFC")

write.csv(cea,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/CeA_GO_RNA.csv",row.names = F,quote = F)
write.csv(dg,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/DG_GO_RNA.csv",row.names = F,quote = F)
write.csv(mpfc,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/mPFC_GO_RNA.csv",row.names = F,quote = F)

