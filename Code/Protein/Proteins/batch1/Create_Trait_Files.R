### RUN /path/to//Code/PDabundanceLoader/Loader script before creating trait files

library(limma)
library(vsn)
library(doParallel)
library(ggplot2)
library(ggpubr)

dat <- readRDS("/path/to//Data/Protein/TamporNormalized/batch1.TMT_rawAbundances.NoCorrection.RDS")
dat <- as.matrix(dat)
traits <- readRDS("/path/to//Data/Protein/Proteomics/batch_designs.RDS")
traits$Plate <- gsub("F", "", traits$Plate)
traits$Plate <- sprintf("%02d", as.numeric(traits$Plate))
rownames(traits) <- paste0("b",traits$Plate, ".", traits$Position)
names(traits)[names(traits)=="Plate"] <- "Batch"


traits_Amygdala <- traits[(traits$Brain_Region=="Amygdala") | (traits$Brain_Region=="GIS"),]
saveRDS(traits_Amygdala, "/path/to//Data/Protein/TraitFiles/traits_Amygdala.RDS")

traits_Hippocampus <- traits[(traits$Brain_Region=="Hippocampus") | (traits$Brain_Region=="GIS"),]
saveRDS(traits_Hippocampus, "/path/to//Data/Protein/TraitFiles/traits_Hippocampus.RDS")

traits_mPFC <- traits[(traits$Brain_Region=="mPFC") | (traits$Brain_Region=="GIS"),]
saveRDS(traits_mPFC, "/path/to//Data/Protein/TraitFiles/traits_mPFC.RDS")

dat <- as.data.frame(dat)
dat_Amygdala <- dat[, names(dat) %in% rownames(traits_Amygdala),]
dat_Hippocampus <- dat[, names(dat) %in% rownames(traits_Hippocampus),]
dat_mPFC <- dat[, names(dat) %in% rownames(traits_mPFC),]

dat_Amygdala <- as.matrix(dat_Amygdala)
dat_Hippocampus <- as.matrix(dat_Hippocampus)
dat_mPFC <- as.matrix(dat_mPFC)

saveRDS(dat_Amygdala, "/path/to//Data/Protein/TamporDataFiles/dat_Amygdala.RDS")
saveRDS(dat_Hippocampus, "/path/to//Data/Protein/TamporDataFiles/dat_Hippocampus.RDS")
saveRDS(dat_mPFC, "/path/to//Data/Protein/TamporDataFiles/dat_mPFC.RDS")

