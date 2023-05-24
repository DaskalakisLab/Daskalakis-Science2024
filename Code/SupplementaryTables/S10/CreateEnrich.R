
CreateEnrich <- function(region){
  wd <- "/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/"
  
  e_files <- list.files(paste0(wd,region),pattern = ".RDS")
  
  first <- T
  for (ef in e_files){
    df <- readRDS(paste0(wd,region,"/",ef))
    df <- as.data.frame(df$results)
    df$z <- scale(df$sd_from_mean)[,1]
    df$z[df$z < 0] <- 0
    df <- df[c("CellType", "fold_change", "p", "q", "z")]
    names(df)[names(df)=="q"] <- "adj.p"
    df$Module <- gsub(".RDS", "", ef)
    if (first){
      df_return <- df
      first <- F
    }else{
      df_return <- rbind(df_return,df)
    }
  }
  return(df_return)
}

CeA <- CreateEnrich("CentralAmyg")
DG <- CreateEnrich("DG")
mPFC <- CreateEnrich("mPFC")

write.csv(CeA, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/CeA_enrich_RNA.csv",row.names = F,quote = F)
write.csv(DG, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/DG_enrich_RNA.csv",row.names = F,quote = F)
write.csv(mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/mPFC_enrich_RNA.csv",row.names = F,quote = F)


CreateEnrichProt <- function(region){
  wd <- "/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module_Protein/"
  
  e_files <- list.files(paste0(wd,region),pattern = ".RDS")
  
  first <- T
  for (ef in e_files){
    df <- readRDS(paste0(wd,region,"/",ef))
    df <- as.data.frame(df$results)
    df$z <- scale(df$sd_from_mean)[,1]
    df$z[df$z < 0] <- 0
    df <- df[c("CellType", "fold_change", "p", "q", "z")]
    names(df)[names(df)=="q"] <- "adj.p"
    df$Module <- gsub(".RDS", "", ef)
    if (first){
      df_return <- df
      first <- F
    }else{
      df_return <- rbind(df_return,df)
    }
  }
  return(df_return)
}

CeA_prot <- CreateEnrichProt("CentralAmyg")
DG_prot <- CreateEnrichProt("DG")
mPFC_prot <- CreateEnrichProt("mPFC")


write.csv(CeA_prot, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/CeA_enrich_PROT.csv",row.names = F,quote = F)
write.csv(DG_prot, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/DG_enrich_PROT.csv",row.names = F,quote = F)
write.csv(mPFC_prot, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/mPFC_enrich_PROT.csv",row.names = F,quote = F)