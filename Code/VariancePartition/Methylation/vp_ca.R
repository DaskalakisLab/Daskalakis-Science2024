# To do on server use: module load R/testversions/4.2.0
library(variancePartition)

scale_cont <- function(info){
  info$AgeDeath <- scale(info$AgeDeath)[,1]
  info$PMI <- scale(info$PMI)[,1]
  info$BMI <- scale(info$BMI)[,1]
  info$Astro <- scale(info$Astro)[,1]
  info$Endo <- scale(info$Endo)[,1]
  info$ex <- scale(info$ex)[,1]
  info$inhib <- scale(info$inhib)[,1]
  info$Micro <- scale(info$Micro)[,1]
  info$Mural <- scale(info$Mural)[,1]
  info$Oligo <- scale(info$Oligo)[,1]
  info$OPC <- scale(info$OPC)[,1]
  info$Tcell <- scale(info$Tcell)[,1]
  info$Macrophage <- scale(info$Macrophage)[,1]
  info$europe <- scale(info$europe)[,1]
  info$oceania <- scale(info$oceania)[,1]
  info$africa <- scale(info$africa)[,1]
  info$americas <- scale(info$americas)[,1]
  info$cs_asia <- scale(info$cs_asia)[,1]
  info$e_asia <- scale(info$e_asia)[,1]
  info$RIN <- scale(info$RIN)[,1]
  info$numReads <- scale(info$numReads)[,1]
  info$numMapped <- scale(info$numMapped)[,1]
  info$numUnmapped <- scale(info$numUnmapped)[,1]
  info$overallMapRate <- scale(info$overallMapRate)[,1]
  info$concordMapRate <- scale(info$concordMapRate)[,1]
  info$totalMapped <- scale(info$totalMapped)[,1]
  info$mitoMapped <- scale(info$mitoMapped)[,1]
  info$mitoRate <- scale(info$mitoRate)[,1]
  info$totalAssignedGene <- scale(info$totalAssignedGene)[,1]
  info$rRNA_rate <- scale(info$rRNA_rate)[,1]
  info$ancestryPC1 <- scale(info$ancestryPC1)[,1]
  info$ancestryPC2 <- scale(info$ancestryPC2)[,1]
  info$ancestryPC3 <- scale(info$ancestryPC3)[,1]
  info$ancestryPC4 <- scale(info$ancestryPC4)[,1]
  info$ancestryPC5 <- scale(info$ancestryPC5)[,1]
  info$Meth_PC1 <- scale(info$Meth_PC1)[,1]
  info$Meth_PC2 <- scale(info$Meth_PC2)[,1]
  info$Meth_PC3 <- scale(info$Meth_PC3)[,1]
  info$Meth_PC4 <- scale(info$Meth_PC4)[,1]
  info$Meth_PC5 <- scale(info$Meth_PC5)[,1]
  info$NeuN_neg <- scale(info$NeuN_neg)[,1]
  info$NeuN_pos <- scale(info$NeuN_pos)[,1]
  
  return(info)
}

# form <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
#   `ancestryPC1`+`ancestryPC2`+`ancestryPC3`+
#   `Meth_PC1`+`Meth_PC2`+`Meth_PC3`+`Meth_PC4`+`Meth_PC5`+
#   `ex`+`inhib`+`Astro`+`Micro`+`Oligo`+`OPC`+`Tcell`+`Smoking`
form <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `ancestryPC1`+`ancestryPC2`+`ancestryPC3`+
  `Meth_PC1`+`Meth_PC2`+`Meth_PC3`+`Meth_PC4`+`Meth_PC5`+
  `NeuN_neg`+`NeuN_pos`+`Smoking`

info_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_CentralAmyg.RDS")
info_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_DG.RDS")
info_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_mPFC.RDS")

info_ca <- info_ca[order(info_ca$SampleID),]
info_dg <- info_dg[order(info_dg$SampleID),]
info_mpfc <- info_mpfc[order(info_mpfc$SampleID),]

rownames(info_ca) <- info_ca$SampleID
rownames(info_dg) <- info_dg$SampleID
rownames(info_mpfc) <- info_mpfc$SampleID

info_ca <- scale_cont(info_ca)
info_dg <- scale_cont(info_dg)
info_mpfc <- scale_cont(info_mpfc)

expr_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/CentralAmygMfunnorm.RDS")
expr_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/DGMfunnorm.RDS")
expr_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/mPFCMfunnorm.RDS")


expr_ca <- as.data.frame(expr_ca)
info_ca <- info_ca[info_ca$SampleID %in% names(expr_ca),]
expr_ca <- expr_ca[,rownames(info_ca)]
expr_ca <- as.matrix(expr_ca)


expr_dg <- as.data.frame(expr_dg)
info_dg <- info_dg[info_dg$SampleID %in% names(expr_dg),]
expr_dg <- expr_dg[,rownames(info_dg)]
expr_dg <- as.matrix(expr_dg)


expr_mpfc <- as.data.frame(expr_mpfc)
info_mpfc <- info_mpfc[info_mpfc$SampleID %in% names(expr_mpfc),]
expr_mpfc <- expr_mpfc[,rownames(info_mpfc)]
expr_mpfc <- as.matrix(expr_mpfc)


varPart_ca <- fitExtractVarPartModel(expr_ca, form, info_ca)
saveRDS(varPart_ca, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/VariancePartition/VarPartFiles/Y1Y2/CentralAmyg_neuron.RDS")

