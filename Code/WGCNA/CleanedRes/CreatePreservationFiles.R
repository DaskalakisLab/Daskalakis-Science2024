format_preservation <- function(region){
  print(region)
  load(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/modulePreservation_CtrlMDD.RData"))
  mdd <- as.data.frame(mp_mdd$preservation$Z$ref.Control$inColumnsAlsoPresentIn.MDD)
  mdd$Module <- paste0("ME",rownames(mdd))
  mdd$Preserved <- F
  mdd[mdd$Zsummary.pres <= 10,"Preserved"] <- T
  mdd_pres <- mdd[,c("Module", "moduleSize", "Preserved")]
  saveRDS(mdd_pres,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/PreservationMDD.RDS"))
  
  load(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/modulePreservation_CtrlPTSD.RData"))
  ptsd <- as.data.frame(mp_ptsd$preservation$Z$ref.Control$inColumnsAlsoPresentIn.PTSD)
  ptsd$Module <- paste0("ME",rownames(ptsd))
  ptsd$Preserved <- F
  ptsd[ptsd$Zsummary.pres <= 10,"Preserved"] <- T
  ptsd_pres <- ptsd[,c("Module", "moduleSize", "Preserved")]
  saveRDS(ptsd_pres,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/PreservationPTSD.RDS"))
  
  ptsd_pres[mdd$Zsummary.pres <= 10,"Preserved"] <- T
  saveRDS(ptsd_pres,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/PreservationPTSD+MDD.RDS"))
  
}

regions <- c("CentralAmyg","DG","mPFC")
for (region in regions){
  format_preservation(region)
}


format_preservation_prot <- function(region){
  print(region)
  load(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/",region,"/modulePreservation_CtrlMDD.RData"))
  mdd <- as.data.frame(mp_mdd$preservation$Z$ref.Control$inColumnsAlsoPresentIn.MDD)
  mdd$Module <- paste0("ME",rownames(mdd))
  mdd$Preserved <- F
  mdd[mdd$Zsummary.pres <= 10,"Preserved"] <- T
  mdd_pres <- mdd[,c("Module", "moduleSize", "Preserved")]
  saveRDS(mdd_pres,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/",region,"/PreservationMDD.RDS"))
  
  load(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/",region,"/modulePreservation_CtrlPTSD.RData"))
  ptsd <- as.data.frame(mp_ptsd$preservation$Z$ref.Control$inColumnsAlsoPresentIn.PTSD)
  ptsd$Module <- paste0("ME",rownames(ptsd))
  ptsd$Preserved <- F
  ptsd[ptsd$Zsummary.pres <= 10,"Preserved"] <- T
  ptsd_pres <- ptsd[,c("Module", "moduleSize", "Preserved")]
  saveRDS(ptsd_pres,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/",region,"/PreservationPTSD.RDS"))
  
  ptsd_pres[mdd$Zsummary.pres <= 10,"Preserved"] <- T
  saveRDS(ptsd_pres,paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/",region,"/PreservationPTSD+MDD.RDS"))
  
}

regions <- c("CentralAmyg","DG","mPFC")
for (region in regions){
  format_preservation_prot(region)
}
