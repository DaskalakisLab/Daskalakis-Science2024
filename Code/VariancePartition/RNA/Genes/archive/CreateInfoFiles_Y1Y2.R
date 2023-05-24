split_brain_region <- function(anno){
  df_list <- c()
  mPFC <- anno[(anno$Brain_Region=="mPFC"),]
  CentralAmyg <- anno[(anno$Brain_Region=="CentralAmyg"),]
  DG <- anno[(anno$Brain_Region=="DG"),]
  
  df_list[["mPFC"]] <- mPFC
  df_list[["CentralAmyg"]] <- CentralAmyg
  df_list[["DG"]] <- DG
  return(df_list)
}

split_ptsd_mdd <- function(anno){
  df_list <- c()
  ptsd <- anno[(anno$Dx=="PTSD") | (anno$Dx)=="Control",]
  mdd <- anno[(anno$Dx=="MDD") | (anno$Dx)=="Control",]
  df_list[["PTSD"]] <- ptsd
  df_list[["MDD"]] <- mdd
  return(df_list)
}

# Read in annotation file
anno_y1y2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
saveRDS(anno_y1y2, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/NewCovs/All_All.RDS")

# Split by brain region
#################################
anno_y1y2_brains <- split_brain_region(anno_y1y2)

# mPFC
anno_y1y2_mPFC <- anno_y1y2_brains$mPFC
unique(anno_y1y2_mPFC$Brain_Region)=="mPFC"
saveRDS(anno_y1y2_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/NewCovs/All_mPFC.RDS")

# CentralAmyg
anno_y1y2_CentralAmyg <- anno_y1y2_brains$CentralAmyg
unique(anno_y1y2_CentralAmyg$Brain_Region)=="CentralAmyg"
saveRDS(anno_y1y2_CentralAmyg, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/NewCovs/All_CentralAmyg.RDS")

# DG
anno_y1y2_DG <- anno_y1y2_brains$DG
unique(anno_y1y2_DG$Brain_Region)=="DG"
saveRDS(anno_y1y2_DG, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/NewCovs/All_DG.RDS")



# Split by PTSD/MDD
#################################
anno_y1y2_dx <- split_ptsd_mdd(anno_y1y2)

# PTSD
anno_y1y2_ptsd <- anno_y1y2_dx$PTSD
unique(anno_y1y2_ptsd$Dx) == c("Control", "PTSD")
saveRDS(anno_y1y2_ptsd, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/PTSD_All.RDS")

# MDD
anno_y1y2_mdd <- anno_y1y2_dx$MDD
unique(anno_y1y2_mdd$Dx) == c("Control", "MDD")
saveRDS(anno_y1y2_mdd, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/MDD_All.RDS")


# Split by PTSD/MDD and Brain Region
#################################

# PTSD
anno_y1y2_brains_ptsd <- split_brain_region(anno_y1y2_ptsd)

# PTSD mPFC
anno_y1y2_ptsd_mPFC <- anno_y1y2_brains_ptsd$mPFC
unique(anno_y1y2_ptsd_mPFC$Brain_Region)=="mPFC"
unique(anno_y1y2_ptsd_mPFC$Dx) == c("Control", "PTSD")
saveRDS(anno_y1y2_ptsd_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/PTSD_mPFC.RDS")

# PTSD CentralAmyg
anno_y1y2_ptsd_CentralAmyg <- anno_y1y2_brains_ptsd$CentralAmyg
unique(anno_y1y2_ptsd_CentralAmyg$Brain_Region)=="CentralAmyg"
unique(anno_y1y2_ptsd_CentralAmyg$Dx) == c("Control", "PTSD")
saveRDS(anno_y1y2_ptsd_CentralAmyg, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/PTSD_CentralAmyg.RDS")

# PTSD DG
anno_y1y2_ptsd_DG <- anno_y1y2_brains_ptsd$DG
unique(anno_y1y2_ptsd_DG$Brain_Region)=="DG"
unique(anno_y1y2_ptsd_DG$Dx) == c("Control", "PTSD")
saveRDS(anno_y1y2_ptsd_DG, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/PTSD_DG.RDS")





# MDD
anno_y1y2_brains_mdd <- split_brain_region(anno_y1y2_mdd)

# MDD mPFC
anno_y1y2_mdd_mPFC <- anno_y1y2_brains_mdd$mPFC
unique(anno_y1y2_mdd_mPFC$Brain_Region)=="mPFC"
unique(anno_y1y2_mdd_mPFC$Dx) == c("Control", "MDD")
saveRDS(anno_y1y2_mdd_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/NewCovs/MDD_mPFC.RDS")

# MDD CentralAmyg
anno_y1y2_mdd_CentralAmyg <- anno_y1y2_brains_mdd$CentralAmyg
unique(anno_y1y2_mdd_CentralAmyg$Brain_Region)=="CentralAmyg"
unique(anno_y1y2_mdd_CentralAmyg$Dx) == c("Control", "MDD")
saveRDS(anno_y1y2_mdd_CentralAmyg, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/NewCovs/MDD_CentralAmyg.RDS")

# MDD DG
anno_y1y2_mdd_DG <- anno_y1y2_brains_mdd$DG
unique(anno_y1y2_mdd_DG$Brain_Region)=="DG"
unique(anno_y1y2_mdd_DG$Dx) == c("Control", "MDD")
saveRDS(anno_y1y2_mdd_DG, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/MDD_DG.RDS")

