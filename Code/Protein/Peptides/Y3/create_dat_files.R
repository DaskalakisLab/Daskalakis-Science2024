library(limma)
library(vsn)
library(doParallel)
library(ggplot2)
library(ggpubr)
library(readxl)

dat <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/1b.PD.TMT_Peptides_Y3.NoCorrection.RDS")
dat <- as.matrix(dat)

traits_Amygdala <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/Y3/traits_Amygdala.RDS")

traits_Hippocampus <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/Y3/traits_Hippocampus.RDS")

traits_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/Y3/traits_mPFC.RDS")

dat <- as.data.frame(dat)
dat_Amygdala <- dat[, names(dat) %in% rownames(traits_Amygdala),]
dat_Hippocampus <- dat[, names(dat) %in% rownames(traits_Hippocampus),]
dat_mPFC <- dat[, names(dat) %in% rownames(traits_mPFC),]

dat_Amygdala <- as.matrix(dat_Amygdala)
dat_Hippocampus <- as.matrix(dat_Hippocampus)
dat_mPFC <- as.matrix(dat_mPFC)

saveRDS(dat_Amygdala, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/Y3/Peptides/dat_Amygdala.RDS")
saveRDS(dat_Hippocampus, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/Y3/Peptides/dat_Hippocampus.RDS")
saveRDS(dat_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/Y3/Peptides/dat_mPFC.RDS")

