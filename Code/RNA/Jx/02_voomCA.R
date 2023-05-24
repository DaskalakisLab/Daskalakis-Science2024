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
# Read DGE list created in /data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Jx/01_DGE.R
all <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/DGE_CentralAmyg.RDS")
dim(all)
# 5523949     150

identical(colnames(all$counts), rownames(all$samples))

# Filter lowly expressed genes 
keep <- filterByExpr(all, group = all$samples$group)

filtered <- all[keep, , keep.lib.sizes=FALSE]
dim(filtered)
# 143522    150

# Calculate normalization factors using the weighted trimmed mean of M-values method
zall <- calcNormFactors(filtered, method = "TMM") #the default is TMM (weighted trimmed mean of M-values) alternatively: "RLE", "upperquartile",
dim(zall)
# 143522    150

mm <- model.matrix(~0 + all$samples$group)
# Transform count data to log2-counts per million
vall <- voom(zall, design = mm, plot = TRUE, save.plot = TRUE)

filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y1Y2/VoomCentralAmyg.RDS"

saveRDS(vall,file=filename)

rm(list=ls())

#################################################################################################################
# Year 3
#################################################################################################################
# Read DGE list created in /data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Jx/01_DGE.R
all <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/DGE_CentralAmyg.RDS")
dim(all)
# 5523949      79

identical(colnames(all$counts), rownames(all$samples))

# Filter lowly expressed genes 
keep <- filterByExpr(all, group = all$samples$group)

filtered <- all[keep, , keep.lib.sizes=FALSE]
dim(filtered)
# 149951     79

# Calculate normalization factors using the weighted trimmed mean of M-values method
zall <- calcNormFactors(filtered, method = "TMM") #the default is TMM (weighted trimmed mean of M-values) alternatively: "RLE", "upperquartile",
dim(zall)
# 149951     79

mm <- model.matrix(~0 + all$samples$group)
# Transform count data to log2-counts per million
vall <- voom(zall, design = mm, plot = TRUE, save.plot = TRUE)

filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y3/VoomCentralAmyg.RDS"

saveRDS(vall,file=filename)
