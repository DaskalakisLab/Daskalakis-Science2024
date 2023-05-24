# To do on server use: module load R/testversions/4.2.0

library(variancePartition)
library(ggplot2)
# form <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+Hippocampus+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Tcell+Excit+Inhib+europe+africa+americas+cs_asia+e_asia+
#   RIN+mitoRate+rRNA_rate+totalAssignedGene

varpart_Y1Y2 <- function(info, vall, form, out_file, multi_region=F){
  mat <- vall$E
  mat <- as.data.frame(mat)
  if (multi_region){
    info$mPFC <- 0
    info[info$Brain_Region_Protein=="mPFC","mPFC"] <- 1
    info$Amygdala <- 0
    info[info$Brain_Region_Protein=="Amygdala","Amygdala"] <- 1
    info$Hippocampus <- 0
    info[info$Brain_Region_Protein=="Hippocampus","Hippocampus"] <- 1
  }
  mat <- mat[,names(mat) %in% info$SampleID]
  varPart <- fitExtractVarPartModel( mat, form, info, colinearityCutoff=1)
  vp <- sortCols(varPart)
  saveRDS(vp, out_file)
}
