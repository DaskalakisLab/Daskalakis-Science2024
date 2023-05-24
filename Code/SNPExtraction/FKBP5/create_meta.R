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
library(writexl)


# FKBP5 Extraction

#### Methylation 
# CPGs
annEPIC <- getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
meta <- as.data.frame(annEPIC)

fkbp5 <- meta[str_detect(meta$UCSC_RefGene_Name, "FKBP5"), ]

#write_xlsx(fkbp5, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_meta_full.xlsx")
names(fkbp5)[names(fkbp5)=="Name"] <- "CPG"
names(fkbp5)[names(fkbp5)=="UCSC_RefGene_Name"] <- "Symbol"
fkbp5 <- fkbp5[,c("CPG", "Symbol", "chr", "pos", "strand", "AddressA", "AddressB","ProbeSeqA","ProbeSeqB","Type","NextBase","Color","Probe_rs","Probe_maf","CpG_rs","CpG_maf")]
FKBP5_withGeno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withGeno.RDS")
cpgs <- names(FKBP5_withGeno)
cpgs <- cpgs[startsWith(cpgs, "Methylation")]
cpgs <- gsub("Methylation_", "", cpgs)
fkbp5 <- fkbp5[fkbp5$CPG %in% cpgs,]

write_xlsx(fkbp5, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_meta.xlsx")
