load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_geneRSE.Rdata")

gene_map <- as.data.frame(rowRanges(rse_gene))
gene_map <- gene_map[,c("gencodeID","Symbol")]
saveRDS(gene_map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/NameMappings/GeneMap.RDS")
rm(list=ls())

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_exonRSE.Rdata")

dcount=assays(rse_exon)[[1]]
dcount <- as.data.frame(dcount)

exon_map <- rowRanges(rse_exon)
exon_map <- as.data.frame(exon_map,row.names = NULL)
exon_map <- exon_map[,c("gencodeID","exon_gencodeID","exon_libdID","Symbol")]
exon_map$ensembleID <- rownames(dcount)
exon_map$ensembleIDClean <- gsub("(\\.[^\\.]*)(\\..*)", "\\1", exon_map$ensembleID)
identical(exon_map$gencodeID, exon_map$ensembleIDClean)
exon_map <- exon_map[,1:5]
saveRDS(exon_map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/NameMappings/ExonMap.RDS")
rm(list=ls())

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_jxnRSE.Rdata")
jx_map <- as.data.frame(rowRanges(rse_jxn))
jx_map$Jx <- rownames(jx_map)
jx_map <- jx_map[c("Jx","Symbol")]
saveRDS(jx_map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/NameMappings/JxMap.RDS")
rm(list=ls())

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_txRSE.Rdata")
tx_map <- as.data.frame(rowRanges(rse_tx))
tx_map <- tx_map[,c("transcript_id","gene_name","transcript_name")]
saveRDS(tx_map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/NameMappings/TxMap.RDS")
rm(list=ls())

