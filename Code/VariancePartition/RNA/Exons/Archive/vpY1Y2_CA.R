# To do on server use: module load R/testversions/4.2.0

library(variancePartition)
library(ggplot2)

varpart_Y1Y2 <- function(info, vall, form, out_file, multi_region=F){
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
  varPart <- fitExtractVarPartModel( mat, form, info, colinearityCutoff=1)
  vp <- sortCols(varPart)
  saveRDS(vp, out_file)
}

# Split Brain Regions
#############################
# Ancestry Estimates
form_ancestry_est_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Tcell+Excit+Inhib+europe+africa+americas+cs_asia+e_asia+
  RIN+mitoRate+rRNA_rate+totalAssignedGene

# Ancestry PCs
form_ancestry_pc_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Tcell+Excit+Inhib+ancestryPC1+
  ancestryPC2+ancestryPC3+ancestryPC4+ancestryPC5+RIN+mitoRate+rRNA_rate+totalAssignedGene

# Genetic PCs
form_genetic_pc_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Tcell+Excit+Inhib+PC1+
  PC2+PC3+PC4+PC5+RIN+mitoRate+rRNA_rate+totalAssignedGene

dir.create("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartFiles/Y1Y2/", recursive = T)

vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Voom_Y1Y2_CentralAmyg.RDS")
info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/InfoFiles/Y1Y2/NewCovs/All_CentralAmyg.RDS")
out_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartFiles/Y1Y2/ancestry_estimates_all_CentralAmyg.RDS"
varpart_Y1Y2(info=info, vall=vall, form=form_ancestry_est_all_split,out_file=out_file, multi_region=F)

vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Voom_Y1Y2_CentralAmyg.RDS")
info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/InfoFiles/Y1Y2/NewCovs/All_CentralAmyg.RDS")
out_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartFiles/Y1Y2/ancestry_pcs_all_CentralAmyg.RDS"
varpart_Y1Y2(info=info, vall=vall, form=form_ancestry_pc_all_split,out_file=out_file, multi_region=F)

vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Voom_Y1Y2_CentralAmyg.RDS")
info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/InfoFiles/Y1Y2/NewCovs/All_CentralAmyg.RDS")
out_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartFiles/Y1Y2/genetic_pcs_all_CentralAmyg.RDS"
varpart_Y1Y2(info=info, vall=vall, form=form_genetic_pc_all_split,out_file=out_file, multi_region=F)

