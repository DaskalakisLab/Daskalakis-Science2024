library(limma)
library(vsn)
library(doParallel)
library(ggplot2)
library(ggpubr)

source("/path/to/Code/TAMPOR/TAMPOR.R")

dat_Amygdala <- readRDS("/path/to/Data/Protein/TamporDataFiles/batch1/Peptides/dat_Amygdala_peptides.RDS")
dat_Hippocampus <- readRDS("/path/to/Data/Protein/TamporDataFiles/batch1/Peptides/dat_Hippocampus_peptides.RDS")
dat_mPFC <- readRDS("/path/to/Data/Protein/TamporDataFiles/batch1/Peptides/dat_mPFC_peptides.RDS")

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

traits_Amygdala <- readRDS("/path/to/Data/Protein/TraitFiles/batch1/traits_Amygdala.RDS")
traits_Hippocampus <- readRDS("/path/to/Data/Protein/TraitFiles/batch1/traits_Hippocampus.RDS")
traits_mPFC <- readRDS("/path/to/Data/Protein/TraitFiles/batch1/traits_mPFC.RDS")

tamp_Amygdala <- TAMPOR(dat_Amygdala, traits_Amygdala, noGIS = FALSE, useAllNonGIS = FALSE, batchPrefixInSampleNames = TRUE, GISchannels=c("126","131C"), iterations = 250,
                        samplesToIgnore = FALSE, meanOrMedian = "median", removeGISafter = FALSE, minimumBatchSize = 5, parallelThreads=2, outputSuffix = "batch1_Amygdala",
                        path="/path/to/Data/Protein/TamporNormalized/batch1/Peptides")
saveRDS(tamp_Amygdala, "/path/to/Data/Protein/TamporNormalized/batch1/Peptides/batch1_Amygdala.RDS")

tamp_Hippocampus <- TAMPOR(dat_Hippocampus, traits_Hippocampus, noGIS = FALSE, useAllNonGIS = FALSE, batchPrefixInSampleNames = TRUE, GISchannels=c("126","131C"), iterations = 250,
                           samplesToIgnore = FALSE, meanOrMedian = "median", removeGISafter = FALSE, minimumBatchSize = 5, parallelThreads=2, outputSuffix = "batch1_Hippocampus",
                           path="/path/to/Data/Protein/TamporNormalized/batch1/Peptides")
saveRDS(tamp_Hippocampus, "/path/to/Data/Protein/TamporNormalized/batch1/Peptides/batch1_Hippocampus.RDS")

tamp_mPFC <- TAMPOR(dat_mPFC, traits_mPFC, noGIS = FALSE, useAllNonGIS = FALSE, batchPrefixInSampleNames = TRUE, GISchannels=c("126","131C"), iterations = 250,
                    samplesToIgnore = FALSE, meanOrMedian = "median", removeGISafter = FALSE, minimumBatchSize = 5, parallelThreads=2, outputSuffix = "batch1_mPFC", 
                    path="/path/to/Data/Protein/TamporNormalized/batch1/Peptides")
saveRDS(tamp_mPFC, "/path/to/Data/Protein/TamporNormalized/batch1/Peptides/batch1_mPFC.RDS")






