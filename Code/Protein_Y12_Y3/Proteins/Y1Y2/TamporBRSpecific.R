library(limma)
library(vsn)
library(doParallel)
library(ggplot2)
library(ggpubr)

source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/TAMPOR/TAMPOR.R")

dat_Amygdala <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/dat_Amygdala.RDS")
dat_Hippocampus <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/dat_Hippocampus.RDS")
dat_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporDataFiles/dat_mPFC.RDS")

dat_Amygdala<-apply(dat_Amygdala,2,function(x) {
  x[x<=0] <- NA
  x
})
dat_Hippocampus<-apply(dat_Hippocampus,2,function(x) {
  x[x<=0] <- NA
  x
})
dat_mPFC<-apply(dat_mPFC,2,function(x) {
  x[x<=0] <- NA
  x
})

traits_Amygdala <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/traits_Amygdala.RDS")
traits_Hippocampus <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/traits_Hippocampus.RDS")
traits_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TraitFiles/traits_mPFC.RDS")

tamp_Amygdala <- TAMPOR(dat_Amygdala, traits_Amygdala, noGIS = FALSE, useAllNonGIS = FALSE, batchPrefixInSampleNames = TRUE, GISchannels=c("126","131C"), iterations = 250,
               samplesToIgnore = FALSE, meanOrMedian = "median", removeGISafter = FALSE, minimumBatchSize = 5, parallelThreads=2, outputSuffix = "Y1Y2_Amygdala", 
               path="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized")
saveRDS(tamp_Amygdala, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2_Amygdala.RDS")

tamp_Hippocampus <- TAMPOR(dat_Hippocampus, traits_Hippocampus, noGIS = FALSE, useAllNonGIS = FALSE, batchPrefixInSampleNames = TRUE, GISchannels=c("126","131C"), iterations = 250,
                        samplesToIgnore = FALSE, meanOrMedian = "median", removeGISafter = FALSE, minimumBatchSize = 5, parallelThreads=2, outputSuffix = "Y1Y2_Hippocampus", 
                        path="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized")
saveRDS(tamp_Hippocampus, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2_Hippocampus.RDS")

tamp_mPFC <- TAMPOR(dat_mPFC, traits_mPFC, noGIS = FALSE, useAllNonGIS = FALSE, batchPrefixInSampleNames = TRUE, GISchannels=c("126","131C"), iterations = 250,
                        samplesToIgnore = FALSE, meanOrMedian = "median", removeGISafter = FALSE, minimumBatchSize = 5, parallelThreads=2, outputSuffix = "Y1Y2_mPFC", 
                        path="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized")
saveRDS(tamp_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2_mPFC.RDS")






