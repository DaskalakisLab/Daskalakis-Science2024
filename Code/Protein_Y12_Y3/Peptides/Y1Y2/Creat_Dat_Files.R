### RUN /data/humgen/daskalakislab/dipietro/SciencePaper/Code/PDabundanceLoader/Loader script before creating trait files


library(limma)
library(vsn)
library(doParallel)
library(ggplot2)
library(ggpubr)

dat <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/1b.PD.TMT_Peptides_batch11.NoCorrection.RDS")
dat <- as.matrix(dat)
traits <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Proteomics/batch_designs.RDS")
traits$Plate <- gsub("F", "", traits$Plate)
traits$Plate <- sprintf("%02d", as.numeric(traits$Plate))
rownames(traits) <- paste0("b",traits$Plate, ".", traits$Position)
names(traits)[names(traits)=="Plate"] <- "batch1"


traits_Amygdala <- traits[(traits$Brain_Region=="Amygdala") | (traits$Brain_Region=="GIS"),]
#saveRDS(traits_Amygdala, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/traits_Amygdala_peptides.RDS")

traits_Hippocampus <- traits[(traits$Brain_Region=="Hippocampus") | (traits$Brain_Region=="GIS"),]
#saveRDS(traits_Hippocampus, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/traits_Hippocampus_peptides.RDS")

traits_mPFC <- traits[(traits$Brain_Region=="mPFC") | (traits$Brain_Region=="GIS"),]
#saveRDS(traits_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/traits_mPFC_peptides.RDS")

dat <- as.data.frame(dat)
dat_Amygdala <- dat[, names(dat) %in% rownames(traits_Amygdala),]
dat_Hippocampus <- dat[, names(dat) %in% rownames(traits_Hippocampus),]
dat_mPFC <- dat[, names(dat) %in% rownames(traits_mPFC),]

dat_Amygdala <- as.matrix(dat_Amygdala)
dat_Hippocampus <- as.matrix(dat_Hippocampus)
dat_mPFC <- as.matrix(dat_mPFC)

saveRDS(dat_Amygdala, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/dat_Amygdala_peptides.RDS")
saveRDS(dat_Hippocampus, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/dat_Hippocampus_peptides.RDS")
saveRDS(dat_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/dat_mPFC_peptides.RDS")

