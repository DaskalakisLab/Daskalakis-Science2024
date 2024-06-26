library(SummarizedExperiment)
library(calibrate)
library(ggplot2)
library(limma)
#BiocManager::install("edgeR")
library(edgeR)
library(biomaRt)
library(gplots)
require(data.table)
library(readxl)

#################################################################################################################
# batch 1
#################################################################################################################
# Read DGE list created in /path/to/01_DGE.R
all <- readRDS("/path/to/batch1/DGE_mPFC.RDS")
dim(all)
# 58037   150

identical(colnames(all$counts), rownames(all$samples))

# Filter lowly expressed genes 
keep <- filterByExpr(all, group = all$samples$group)

filtered <- all[keep, , keep.lib.sizes=FALSE]
dim(filtered)
# 22124   150

# Calculate normalization factors using the weighted trimmed mean of M-values method
zall <- calcNormFactors(filtered, method = "TMM") #the default is TMM (weighted trimmed mean of M-values) alternatively: "RLE", "upperquartile",
dim(zall)
# 22124   150

mm <- model.matrix(~0 + all$samples$group)
# Transform count data to log2-counts per million
vall <- voom(zall, design = mm, plot = TRUE, save.plot = TRUE)

filename="/path/to/Genes/batch1/VoommPFC.RDS"

saveRDS(vall,file=filename)
rm(list=ls())

#################################################################################################################
# batch2
#################################################################################################################
# Read DGE list created in /path/to/01_DGE.R
all <- readRDS("/path/to/batch2/DGE_mPFC.RDS")
dim(all)
# 58037    79

identical(colnames(all$counts), rownames(all$samples))

# Filter lowly expressed genes 
keep <- filterByExpr(all, group = all$samples$group)

filtered <- all[keep, , keep.lib.sizes=FALSE]
dim(filtered)
# 22575    79

# Calculate normalization factors using the weighted trimmed mean of M-values method
zall <- calcNormFactors(filtered, method = "TMM") #the default is TMM (weighted trimmed mean of M-values) alternatively: "RLE", "upperquartile",
dim(zall)
# 22575    79

mm <- model.matrix(~0 + all$samples$group)
# Transform count data to log2-counts per million
vall <- voom(zall, design = mm, plot = TRUE, save.plot = TRUE)

filename="/path/to/VoommPFC.RDS"

saveRDS(vall,file=filename)



