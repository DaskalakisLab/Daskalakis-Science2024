library(stringr)

# FKBP5 Extraction

#### RNA 
# Gene
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_gene.y123_n688.Rdata")
meta <- as.data.frame(rowRanges(rse_gene))

fkbp5 <- meta[str_detect(meta$Symbol, "FKBP5"), ]
fkbp5_gene <- fkbp5[,c("gencodeID", "Symbol")]
names(fkbp5_gene) <- c("Gene", "Symbol")
saveRDS(fkbp5_gene, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_RNA_Gene.RDS")

rm(list=ls())

# Exon
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_exon.y123_n688.Rdata")
meta <- as.data.frame(rowRanges(rse_exon))
fkbp5 <- meta[str_detect(meta$Symbol, "FKBP5"), ]
exon_list <- c()
for (i in 1:nrow(fkbp5)){
  exons <- fkbp5$exon_libdID[i]
  exon_list <- append(exon_list, str_split(exons, ";")[[1]])
}
fkbp5_exon <- data.frame(Exon=exon_list, Symbol="FKBP5")
saveRDS(fkbp5_exon, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_RNA_Exon.RDS")

rm(list=ls())

# Jx
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_jx.y123_n688.Rdata")
meta <- as.data.frame(rowRanges(rse_jx))
meta <- meta[!is.na(meta$newGeneSymbol),]
fkbp5 <- meta[str_detect(meta$newGeneSymbol, "FKBP5"), ]
fkbp5_jx <- fkbp5[,c("newGeneID", "newGeneSymbol")]
fkbp5_jx$Jx <- row.names(fkbp5_jx)
names(fkbp5_jx) <- c("Gene", "Symbol", "Jx")
fkbp5_jx <- fkbp5_jx[,c("Jx", "Gene", "Symbol")]
rownames(fkbp5_jx) <- NULL
saveRDS(fkbp5_jx, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_RNA_Jx.RDS")

rm(list=ls())

# Tx
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_tx.y123_n688.Rdata")
meta <- as.data.frame(rowRanges(rse_tx))
fkbp5 <- meta[str_detect(meta$gene_name, "FKBP5"), ]
fkbp5_tx <- fkbp5[,c("transcript_id", "gene_name")]
names(fkbp5_tx) <- c("Tx", "Symbol")
rownames(fkbp5_tx) <- NULL
saveRDS(fkbp5_tx, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_RNA_Tx.RDS")

rm(list=ls())
