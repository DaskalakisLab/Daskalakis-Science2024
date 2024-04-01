library(ggplot2)
library(bigreadr)
library(ggsignif)
library(readxl)
library(data.table)
library(calibrate)
library(ggrepel)
library(ggpubr)
library(dplyr)
 
 
library(methylGSA)
library(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
methylGSA::runExample()
 
 
######################## methylGSA
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
 
BiocManager::install("methylGSA")
library(methylGSA)
 
library(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
 
## load .txt file and label columns
# df <- read.table("/path/to/Methylation/LimmaResults/rep/MDD_CentralAmyg.txt", sep = "\t")
# colnames(df) <- c("cpgs", "pval")
# 
# #create a vector with the named pvals if your probes
# 
# cpg.pval <- df$pval
# names(cpg.pval) <- df$cpgs
 
cpg.pval <- results_PTSD_vmPFC_BU$P.Value
names(cpg.pval) <- results_PTSD_vmPFC_BU$meth
 
#methylRRA
res_go = methylRRA(cpg.pval = cpg.pval, method = "GSEA", array.type = "EPIC", GS.type = "GO",
                   minsize = 20, maxsize = 500)
 
res_R = methylRRA(cpg.pval = cpg.pval, method = "GSEA", array.type = "EPIC", GS.type = "Reactome",
                  minsize = 20, maxsize = 500)
 
#methylgometh - this adjusts for the number of probes per gene
#here you need to provide either a pval cut off or the number of most sigificant cpgs as topDE
res_adj_go = methylRRA(cpg.pval = cpg.pval, sig.cut = 0.001, array.type = "EPIC", GS.type = "GO",
                       minsize = 20, maxsize = 500)
 
res_adj_R = methylRRA(cpg.pval = cpg.pval,sig.cut = 0.001, array.type = "EPIC", GS.type = "Reactome",
                      minsize = 20, maxsize = 500)
 
## save results
write.csv(res_go, file= "/path/to/Methylation/LimmaResults/rep/BU_not_repVer01_methylGSEA/GO/PTSD_vmPFC_RRA_GO.csv", quote = F)
 
write.csv(res_R, file= "/path/to/Methylation/LimmaResults/rep/BU_not_repVer01_methylGSEA/REACTOME/PTSD_vmPFC_RRA_R.csv", quote = F)
 
 
############## Artemis SynGO
syngo_ontologies <- read_excel("/path/to/syngo_ontologies.xlsx")
list <- list(NA)
for(i in 1:length(syngo_ontologies$id)){
  try <- syngo_ontologies$hgnc_symbol[i]
  list[[i]] <- unlist(strsplit(try,", "))
}
names(list) <- syngo_ontologies$name
#paths <- list(synGO = list)
 
cpg.pval <- results_PTSD_vmPFC_BU$P.Value
names(cpg.pval) <- results_PTSD_vmPFC_BU$meth
res_syngo = methylRRA(cpg.pval = cpg.pval, method = "GSEA", array.type = "EPIC", GS.list = list, GS.idtype = "SYMBOL",
                   minsize = 20, maxsize = 500)
write.csv(res_syngo, file= "/path/to/Methylation/LimmaResults/rep/BU_not_repVer01_methylGSEA/synGO/PTSD_vmPFC_RRA_synGO.csv", quote = F)
 
############## ALL C5 pathways
c5_ontologies <- read_excel("/path/to/c5_all_2023_Hs_symbols.xlsx")
list2 <- list(NA)
for(i in 1:length(c5_ontologies$id)){
  try <- c5_ontologies$hgnc_symbol[i]
  list2[[i]] <- unlist(strsplit(try," "))
}
names(list2) <- c5_ontologies$id
#paths <- list(synGO = list)
 
cpg.pval <- results_MDD_vmPFC_MDD$P.Value
names(cpg.pval) <- results_MDD_vmPFC_MDD$meth
 
res_go = methylRRA(cpg.pval = cpg.pval, method = "GSEA", array.type = "EPIC", GS.list = list2, GS.idtype = "SYMBOL",
                      minsize = 20, maxsize = 500)
