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
# Years 1,2,and3
#################################################################################################################
# Read DGE list created in /data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Gene/01_DGE.R
all <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Gene/EU_Y1Y2Y3/DGE_CentralAmyg.RDS")
dim(all)

# 58037   229

identical(colnames(all$counts), rownames(all$samples))

# Filter lowly expressed genes 
keep <- filterByExpr(all, group = all$samples$group)

filtered <- all[keep, , keep.lib.sizes=FALSE]
dim(filtered)
# 22714   229
#Note: Should we ask Chris C about this?
# Calculate normalization factors using the weighted trimmed mean of M-values method
zall <- calcNormFactors(filtered, method = "TMM") #the default is TMM (weighted trimmed mean of M-values) alternatively: "RLE", "upperquartile",
dim(zall)
# 22714   229

mm <- model.matrix(~0 + all$samples$group)
# Transform count data to log2-counts per million
vall <- voom(zall, design = mm, plot = FALSE)



filename="/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Genes/Y123/EuropeanSamples/VoomCentralAmyg.RDS"

saveRDS(vall,file=filename)




Cairo::CairoPDF(file="/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Genes/Y123/EuropeanSamples/VoomCentralAmyg.pdf")
vall <- voom(zall, design = mm, plot = TRUE)
dev.off()
