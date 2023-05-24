# To do on server use: module load R/testversions/4.2.0

library(variancePartition)
library(ggplot2)

varpart_Y1Y2 <- function(info_file, vall_file, form, out_file, multi_region=F){
  info <- readRDS(info_file)
  vall <- readRDS(vall_file)
  mat <- vall$E
  mat <- as.data.frame(mat)
  if (multi_region){
    info$mPFC <- 0
    info[info$Brain_Region=="mPFC","mPFC"] <- 1
    info$CentralAmyg <- 0
    info[info$Brain_Region=="CentralAmyg","CentralAmyg"] <- 1
    info$DG <- 0
    info[info$Brain_Region=="DG","DG"] <- 1
  }
  mat <- mat[,names(mat) %in% info$SampleID]
  varPart <- fitExtractVarPartModel( mat, form, info)
  vp <- sortCols(varPart)
  saveRDS(vp, out_file)
}

# Split Brain Regions
#############################
# Ancestry Estimates
form_ancestry_est_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+Oligo+Inhib+europe+qSV1
form_ancestry_est_ptsd_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+Oligo+Inhib+europe+qSV1
form_ancestry_est_mdd_split <- ~ AgeDeath+(1|Sex)+PMI+MDD+Oligo+Inhib+europe+qSV1

info_dir <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/"
vall_dir <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/"
# Combined DX
varpart_Y1Y2(info_file = paste0(info_dir, "All_CentralAmyg.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_CentralAmyg.RDS"), 
             form = form_ancestry_est_all_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_All_CentralAmyg.RDS", 
             multi_region = F)
varpart_Y1Y2(info_file = paste0(info_dir, "All_DG.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_DG.RDS"),
             form = form_ancestry_est_all_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_All_DG.RDS", 
             multi_region = F)
varpart_Y1Y2(info_file = paste0(info_dir, "All_mPFC.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_mPFC.RDS"),
             form = form_ancestry_est_all_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_All_mPFC.RDS", 
             multi_region = F)

# MDD
varpart_Y1Y2(info_file = paste0(info_dir, "MDD_CentralAmyg.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_CentralAmyg.RDS"),
             form = form_ancestry_est_mdd_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_MDD_CentralAmyg.RDS", 
             multi_region = F)
varpart_Y1Y2(info_file = paste0(info_dir, "MDD_DG.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_DG.RDS"),
             form = form_ancestry_est_mdd_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_MDD_DG.RDS", 
             multi_region = F)
varpart_Y1Y2(info_file = paste0(info_dir, "MDD_mPFC.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_mPFC.RDS"), 
             form = form_ancestry_est_mdd_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_MDD_mPFC.RDS", 
             multi_region = F)


# PTSD
varpart_Y1Y2(info_file = paste0(info_dir, "PTSD_CentralAmyg.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_CentralAmyg.RDS"),
             form = form_ancestry_est_ptsd_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_PTSD_CentralAmyg.RDS", 
             multi_region = F)
varpart_Y1Y2(info_file = paste0(info_dir, "PTSD_DG.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_DG.RDS"),
             form = form_ancestry_est_ptsd_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_PTSD_DG.RDS", 
             multi_region = F)
varpart_Y1Y2(info_file = paste0(info_dir, "PTSD_mPFC.RDS"), 
             vall_file = paste0(vall_dir, "Voom_Y1Y2_mPFC.RDS"), 
             form = form_ancestry_est_ptsd_split, 
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_2/ancestry_est_PTSD_mPFC.RDS", 
             multi_region = F)
