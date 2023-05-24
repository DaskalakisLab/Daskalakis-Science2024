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
# Years 1 and 2
#################################################################################################################
# Read DGE list created in /data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Exon/01_DGE.R
all <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Exon/Y1Y2/DGE_DG.RDS")
dim(all)
# 571623    150

identical(colnames(all$counts), rownames(all$samples))

# Filter lowly expressed genes 
keep <- filterByExpr(all, group = all$samples$group)

filtered <- all[keep, , keep.lib.sizes=FALSE]
dim(filtered)
# 355115    150

# Calculate normalization factors using the weighted trimmed mean of M-values method
zall <- calcNormFactors(filtered, method = "TMM") #the default is TMM (weighted trimmed mean of M-values) alternatively: "RLE", "upperquartile",
dim(zall)
# 355115    150

mm <- model.matrix(~0 + all$samples$group)
# Transform count data to log2-counts per million
vall <- voom(zall, design = mm, plot = TRUE, save.plot = TRUE)

filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoomDG.RDS"

saveRDS(vall,file=filename)

rm(list=ls())

#################################################################################################################
# Year 3
#################################################################################################################
# Read DGE list created in /data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Exon/01_DGE.R
all <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Exon/Y3/DGE_DG.RDS")
dim(all)
# 571623     80

identical(colnames(all$counts), rownames(all$samples))

# Filter lowly expressed genes 
keep <- filterByExpr(all, group = all$samples$group)

filtered <- all[keep, , keep.lib.sizes=FALSE]
dim(filtered)
# 372267     80

# Calculate normalization factors using the weighted trimmed mean of M-values method
zall <- calcNormFactors(filtered, method = "TMM") #the default is TMM (weighted trimmed mean of M-values) alternatively: "RLE", "upperquartile",
dim(zall)
# 372267     80

mm <- model.matrix(~0 + all$samples$group)
# Transform count data to log2-counts per million
vall <- voom(zall, design = mm, plot = TRUE, save.plot = TRUE)

filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/VoomDG.RDS"

saveRDS(vall,file=filename)
