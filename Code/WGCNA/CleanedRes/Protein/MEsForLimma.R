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

generate_MEs_for_limma <- function(region){
  me_ptsd <- format_MEs(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/",region,"/ME_PTSD.csv"))
  me_mdd <- format_MEs(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/",region,"/ME_MDD.csv"))
  me_control <- format_MEs(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/",region,"/ME_control.csv"))
  
  me_ptsd_analysis <- cbind(me_ptsd,me_control)
  print(identical(me_control$Br5945, me_ptsd_analysis$Br5945))
  print(identical(me_ptsd$Br5350, me_ptsd_analysis$Br5350))
  saveRDS(me_ptsd_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/MEsForLimma/",region,"/ME_PTSD.RDS"))
  
  me_mdd_analysis <- cbind(me_mdd,me_control)
  print(identical(me_control$Br8492, me_mdd_analysis$Br8492))
  print(identical(me_mdd$Br5069, me_mdd_analysis$Br5069))
  saveRDS(me_mdd_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/MEsForLimma/",region,"/ME_MDD.RDS"))
  
  me_ptsd_mdd_analysis <- cbind(me_ptsd,me_mdd,me_control)
  print(identical(me_control$Br2715, me_ptsd_mdd_analysis$Br2715))
  print(identical(me_ptsd$Br5672, me_ptsd_mdd_analysis$Br5672))
  print(identical(me_mdd$Br5069, me_ptsd_mdd_analysis$Br5069))
  saveRDS(me_ptsd_mdd_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/MEsForLimma/",region,"/ME_PTSD_MDD.RDS"))
  
  me_ptsd_vs_mdd_analysis <- cbind(me_ptsd,me_mdd)
  print(identical(me_ptsd$Br5672, me_ptsd_vs_mdd_analysis$Br5672))
  print(identical(me_mdd$Br5069, me_ptsd_vs_mdd_analysis$Br5069))
  saveRDS(me_ptsd_vs_mdd_analysis, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/MEsForLimma/",region,"/ME_PTSD_vs_MDD.RDS"))
}

generate_MEs_for_limma("CentralAmyg")
generate_MEs_for_limma("DG")
generate_MEs_for_limma("mPFC")
