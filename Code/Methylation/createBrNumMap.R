# https://www.bioconductor.org/packages/release/workflows/vignettes/methylationArrayAnalysis/inst/doc/methylationArrayAnalysis.html
# Code and comments by Aarti Jajoo
setwd('/path/to/working/dir/')
# adding path to packages 
#.libPaths(c(.libPaths(),"/home/ajajoo/R/x86_64-pc-linux-gnu-library/3.6/"))
####---Load Libraries----####
library(knitr)
library(limma)
library(minfi)
library(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)   #version R3.5.3 works better 
library(IlluminaHumanMethylationEPICmanifest)
library(RColorBrewer)
library(missMethyl)
library(minfiData)
library(Gviz)
library(DMRcate)
library(stringr)

####----Citation----####
#citation("IlluminaHumanMethylationEPICanno.ilm10b2.hg19")
#citation("IlluminaHumanMethylationEPICmanifest")

#citation("missMethyl")
#citation("DMRcate")
#citation("Gviz")


#BiocManager::install("minfiData")
#BiocManager::install("IlluminaHumanMethylationEPICmanifest")
#BiocManager::install("IlluminaHumanMethylationEPICanno.ilm10b4.hg19")
#BiocManager::install("missMethyl")
#BiocManager::install("DMRcate")
#BiocManager::install("Gviz")

####----EPIC Annotation----####
# Get EPIC annotation data 2 version avaialble b2 and b4, picked b4 just beucase 4 > 2
annEPIC <- getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)
# when multiple trasncript gene name is repeated so removing duplicate names by unique,
# but sometimes there are multiple gene assocaited with CpG site so collapsing with ;
temp <- lapply(strsplit(annEPIC$GencodeBasicV12_NAME,split=";"), function(a) paste0(unique(a),collapse = ";"))
# above result is a list but unlisting removes rows when no gene assocaited so intorducing NA to keep
# row dimension same as annEPIC
temp[sapply(temp,function(x) length(x)==0L)] <- NA
# introducing it as Symbol, volcano plot use Symbol as the column to annotate
annEPIC$Symbol <- unlist(temp)
head(annEPIC)

####----Uncomment below to see preprocessing of data and QC----####
####----Get idat files and sample sheet and correcting names and other features----####
baseDir <- "/path/to/ImageData/"
targets <- read.metharray.sheet('/path/to/metadata',pattern = "methylation_data_dictionary.csv")
Basename <- gsub("_.[Red,Grn].*","",list.files(baseDir,pattern = ".idat",recursive = TRUE))
colnames(targets)[c(6,5)] <- c("Sentrix.ID","Sentrix.Position")
targets$Basename <- paste0(baseDir,targets$Sentrix.ID,"/",targets$Sentrix.ID,"_",targets$Sentrix.Position)

names(targets)[1] <- "Sample_Group"

JoelPTDSY2 <- read.csv('/path/to/Joel_PTSD_R01_Y2_DNA_Packing_Slips_to_FC_12-17-2020.csv',stringsAsFactors = FALSE,header = TRUE,sep=",")
Jcolname <- JoelPTDSY2[1,]
JoelPTDSY2 <- JoelPTDSY2[-1,]
colnames(JoelPTDSY2)[c(1,8:12)] <- c("name",Jcolname[8:12]) 
JoelPTDSY2 <- JoelPTDSY2[,c(8,14,5,9,10,11,13)]

methDicDemo <- read.csv('/path/to//methylation_data_dictionary_with_some_demographic_data.csv',stringsAsFactors = FALSE,header = TRUE,sep=",")
methDicDemo <- methDicDemo[,c(1,2,8,9,10,14)]

metaDNA <- full_join(JoelPTDSY2,methDicDemo,by=c("X.11"="X"))








metaDNA$BrNumComplete <- metaDNA$BrNum.x
metaDNA[is.na(metaDNA$BrNumComplete), "BrNumComplete"] <- metaDNA[is.na(metaDNA$BrNumComplete), "BrNum.y"]
metaDNA[is.na(metaDNA$brainregion), "brainregion"] <- metaDNA[is.na(metaDNA$brainregion), "X.10"]

head(metaDNA)
methmap <- metaDNA[,c("BrNumComplete", "brainregion", "X.11")]
head(methmap)
names(methmap) <- c("BrNum", "Brain_Region", "MethID")
methmap[methmap$Brain_Region=="Amygdala", "Brain_Region"] <- "CentralAmyg"
methmap[methmap$Brain_Region=="Hippocampus", "Brain_Region"] <- "DG"
saveRDS(methmap, "/path/to/result/")
