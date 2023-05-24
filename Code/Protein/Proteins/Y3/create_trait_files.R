library(limma)
library(vsn)
library(doParallel)
library(ggplot2)
library(ggpubr)
library(readxl)

dat <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3.TMT_rawAbundances.NoCorrection.RDS")
dat <- as.matrix(dat)
traits <- as.data.frame(read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Bulk/Y3/Batch_Design.xlsx"))
traits$plate <- gsub("PLATE_", "", traits$plate)
traits$plate <- sprintf("%02d", as.numeric(traits$plate))
rownames(traits) <- paste0("b",traits$plate, ".", traits$Channel)
names(traits)[names(traits)=="plate"] <- "Batch"
names(traits)[names(traits)=="Channel"] <- "Position"
traits$Year <- 3
traits[traits$BATCH=="two", "Year"] <- 2 

traits <- traits[, c("BrNum", "Region", "PrimaryDx", "Position", "Year", "Batch")]
names(traits) <- c("BrNum", "Brain_Region", "Dx", "Position", "Year", "Batch")
traits[traits$Brain_Region=="CeA", "Brain_Region"] <- "Amygdala"
traits[traits$Brain_Region=="DG", "Brain_Region"] <- "Hippocampus"

traits_Amygdala <- traits[(traits$Brain_Region=="Amygdala") | (traits$Brain_Region=="GIS"),]
saveRDS(traits_Amygdala, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/Y3/traits_Amygdala.RDS")

traits_Hippocampus <- traits[(traits$Brain_Region=="Hippocampus") | (traits$Brain_Region=="GIS"),]
saveRDS(traits_Hippocampus, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/Y3/traits_Hippocampus.RDS")

traits_mPFC <- traits[(traits$Brain_Region=="mPFC") | (traits$Brain_Region=="GIS"),]
saveRDS(traits_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/Y3/traits_mPFC.RDS")

dat <- as.data.frame(dat)
dat_Amygdala <- dat[, names(dat) %in% rownames(traits_Amygdala),]
dat_Hippocampus <- dat[, names(dat) %in% rownames(traits_Hippocampus),]
dat_mPFC <- dat[, names(dat) %in% rownames(traits_mPFC),]

dat_Amygdala <- as.matrix(dat_Amygdala)
dat_Hippocampus <- as.matrix(dat_Hippocampus)
dat_mPFC <- as.matrix(dat_mPFC)

saveRDS(dat_Amygdala, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/Y3/Proteins/dat_Amygdala.RDS")
saveRDS(dat_Hippocampus, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/Y3/Proteins/dat_Hippocampus.RDS")
saveRDS(dat_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/Y3/Proteins/dat_mPFC.RDS")

