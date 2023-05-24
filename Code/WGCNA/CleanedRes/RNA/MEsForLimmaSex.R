library(bigreadr)

format_MEs <- function(me_file){
  me <- fread2(me_file)
  rownames(me) <- me$V1
  me <- me[,2:ncol(me)]
  me <- subset(me, select=-c(MEgrey))
  me <- as.data.frame(t(me))
  me <- me[order(rownames(me)),]
  return(me)
}

generate_male_female <- function(region){
  
  me_ptsd <- format_MEs(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/ME_PTSD.csv"))
  me_mdd <- format_MEs(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/ME_MDD.csv"))
  me_control <- format_MEs(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/",region,"/ME_control.csv"))
  
  anno12 <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_30_23/Y1Y2/PTSD_MDD/annotation_PTSD+MDD_",region,"_PTSD_MDD.RDS"))
  anno3 <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_30_23/Y3/PTSD_MDD/annotation_PTSD+MDD_",region,"_PTSD_MDD.RDS"))
  anno <- smartbind(anno12, anno3)
  rm(anno12, anno3)
  
  me_ptsd_male <- me_ptsd[,names(me_ptsd)[names(me_ptsd) %in% anno[anno$Sex=="M","SampleID"]]]
  me_ptsd_female <- me_ptsd[,names(me_ptsd)[names(me_ptsd) %in% anno[anno$Sex=="F","SampleID"]]]
  
  me_mdd_male <- me_mdd[,names(me_mdd)[names(me_mdd) %in% anno[anno$Sex=="M","SampleID"]]]
  me_mdd_female <- me_mdd[,names(me_mdd)[names(me_mdd) %in% anno[anno$Sex=="F","SampleID"]]]
  
  me_control_male <- me_control[,names(me_control)[names(me_control) %in% anno[anno$Sex=="M","SampleID"]]]
  me_control_female <- me_control[,names(me_control)[names(me_control) %in% anno[anno$Sex=="F","SampleID"]]]
  
  
  md_ptsd_male_analysis <- cbind(me_ptsd_male,me_control_male)
  md_ptsd_female_analysis <- cbind(me_ptsd_female,me_control_female)
  
  md_mdd_male_analysis <- cbind(me_mdd_male,me_control_male)
  md_mdd_female_analysis <- cbind(me_mdd_female,me_control_female)
  
  md_ptsd_mdd_male_analysis <- cbind(me_ptsd_male,me_mdd_male,me_control_male)
  md_ptsd_mdd_female_analysis <- cbind(me_ptsd_female,me_mdd_female,me_control_female)
  
  md_ptsd_vs_mdd_male_analysis <- cbind(me_ptsd_male,me_mdd_male)
  md_ptsd_vs_mdd_female_analysis <- cbind(me_ptsd_female,me_mdd_female)
  
  saveRDS(md_ptsd_male_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_Male.RDS"))
  saveRDS(md_ptsd_female_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_Female.RDS"))
  
  saveRDS(md_mdd_male_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_MDD_Male.RDS"))
  saveRDS(md_mdd_female_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_MDD_Female.RDS"))
  
  saveRDS(md_ptsd_mdd_male_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_MDD_Male.RDS"))
  saveRDS(md_ptsd_mdd_female_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_MDD_Female.RDS"))
  
  saveRDS(md_ptsd_vs_mdd_male_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_vs_MDD_Male.RDS"))
  saveRDS(md_ptsd_vs_mdd_female_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/",region,"/ME_PTSD_vs_MDD_Female.RDS"))
  
}

generate_male_female("CentralAmyg")
generate_male_female("DG")
generate_male_female("mPFC")


