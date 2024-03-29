library(limma)
library(vsn)
library(doParallel)
library(ggplot2)
library(ggpubr)

source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/TAMPOR/TAMPOR.R")
dat <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/batch1/Proteins/batch1.TMT_rawAbundances.NoCorrection.RDS")
dat <- as.matrix(dat)
traits <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Proteomics/batch_designs.RDS")
traits$Plate <- gsub("F", "", traits$Plate)
traits$Plate <- sprintf("%02d", as.numeric(traits$Plate))
rownames(traits) <- paste0("b",traits$Plate, ".", traits$Position)
names(traits)[names(traits)=="Plate"] <- "Batch"

dat<-apply(dat,2,function(x) {
  x[x<=0] <- NA
  x
})

tamp <- TAMPOR(dat, traits, noGIS = FALSE, useAllNonGIS = FALSE, batchPrefixInSampleNames = TRUE, GISchannels=c("126","131C"), iterations = 250,
       samplesToIgnore = FALSE, meanOrMedian = "median", removeGISafter = FALSE, minimumBatchSize = 5, parallelThreads=2, outputSuffix = "TAMPOR", 
       path="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized")
  
  
  
