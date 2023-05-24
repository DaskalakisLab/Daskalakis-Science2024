library(stringr)
library(knitr)
library(limma)
library(minfi)
library(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)
library(IlluminaHumanMethylationEPICmanifest)
library(RColorBrewer)
library(missMethyl)
library(minfiData)
library(Gviz)
library(DMRcate)


# FKBP5 Extraction

#### Methylation 
# CPGs
annEPIC <- getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
meta <- as.data.frame(annEPIC)
meta <- meta[,c("Name", "UCSC_RefGene_Name")]
meta[meta$UCSC_RefGene_Name=="", "UCSC_RefGene_Name"] <- meta[meta$UCSC_RefGene_Name=="", "Name"]
names(meta) <- c("CPG", "Symbol")
rownames(meta) <- NULL

fkbp5 <- meta[str_detect(meta$Symbol, "FKBP5"), ]
saveRDS(fkbp5, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_Methylation.RDS")
