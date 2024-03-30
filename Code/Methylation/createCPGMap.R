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
library(stringr)


annEPIC <- getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
df <- as.data.frame(annEPIC)
df <- df[,c("Name", "UCSC_RefGene_Name")]
#saveRDS(df, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/CPGMap/cpgMapFull.RDS")
df$UCSC_RefGene_Name <- gsub(";.*", "", df$UCSC_RefGene_Name)
df[df$UCSC_RefGene_Name=="", "UCSC_RefGene_Name"] <- df[df$UCSC_RefGene_Name=="", "Name"]
names(df) <- c("cpg", "symbol")

saveRDS(df, "/path/to/result")
