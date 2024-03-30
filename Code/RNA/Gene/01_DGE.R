library(SummarizedExperiment)
library(edgeR)

# Load data file
load("/path/to/Data/RNA/Bulk/rse_gene.batch13_n688.Rdata")

dcount=assays(rse_gene)[[1]]
dcount <- as.data.frame(dcount)

annobatch1 <- readRDS("/path/to/Data/Annotation/Annotation_batch1.RDS")
annobatch2 <- readRDS("/path/to/Data/Annotation/Annotation_batch2.RDS")

ca_batch1 <- unique(annobatch1[annobatch1$Brain_Region=="CentralAmyg", "SampleID"])
dg_batch1 <- unique(annobatch1[annobatch1$Brain_Region=="DG", "SampleID"])
mpfc_batch1 <- unique(annobatch1[annobatch1$Brain_Region=="mPFC", "SampleID"])

ca_batch2 <- unique(annobatch2[annobatch2$Brain_Region=="CentralAmyg", "SampleID"])
dg_batch2 <- unique(annobatch2[annobatch2$Brain_Region=="DG", "SampleID"])
mpfc_batch2 <- unique(annobatch2[annobatch2$Brain_Region=="mPFC", "SampleID"])

count_ca_batch1 <- dcount[,ca_batch1]
count_dg_batch1 <- dcount[,dg_batch1]
count_mpfc_batch1 <- dcount[,mpfc_batch1]

count_ca_batch2 <- dcount[,ca_batch2]
count_dg_batch2 <- dcount[,dg_batch2]
count_mpfc_batch2 <- dcount[,mpfc_batch2]



create_dge_list <- function(counts, anno){
  dge <- DGEList(counts)
  dge$samples$SampleID <- rownames(dge$samples)
  dge$samples <- merge(dge$samples, anno[,c("SampleID", "Dx")], by="SampleID", all.x=T)
  dge$samples$group <- dge$samples$Dx
  rownames(dge$samples) <- dge$samples$SampleID
  dge$samples <- dge$samples[,c("group", "lib.size", "norm.factors")]
  dge$group <- as.factor(dge$samples$group)
  dge$samples <- dge$samples[colnames(dge$counts),]
  return(dge)
}

dge_ca_batch1 <- create_dge_list(count_ca_batch1, annobatch1)
dge_dg_batch1 <- create_dge_list(count_dg_batch1, annobatch1)
dge_mpfc_batch1 <- create_dge_list(count_mpfc_batch1, annobatch1)

dge_ca_batch2 <- create_dge_list(count_ca_batch2, annobatch2)
dge_dg_batch2 <- create_dge_list(count_dg_batch2, annobatch2)
dge_mpfc_batch2 <- create_dge_list(count_mpfc_batch2, annobatch2)

identical(colnames(dge_ca_batch1$counts), rownames(dge_ca_batch1$samples))
identical(colnames(dge_dg_batch1$counts), rownames(dge_dg_batch1$samples))
identical(colnames(dge_mpfc_batch1$counts), rownames(dge_mpfc_batch1$samples))

identical(colnames(dge_ca_batch2$counts), rownames(dge_ca_batch2$samples))
identical(colnames(dge_dg_batch2$counts), rownames(dge_dg_batch2$samples))
identical(colnames(dge_mpfc_batch2$counts), rownames(dge_mpfc_batch2$samples))


setdiff(rownames(dge_ca_batch1$samples), ca_batch1)
setdiff(rownames(dge_dg_batch1$samples), dg_batch1)
setdiff(rownames(dge_mpfc_batch1$samples), mpfc_batch1)

setdiff(rownames(dge_ca_batch2$samples), ca_batch2)
setdiff(rownames(dge_dg_batch2$samples), dg_batch2)
setdiff(rownames(dge_mpfc_batch2$samples), mpfc_batch2)


saveRDS(dge_ca_batch1, "/path/to/Data/RNA/Counts/Gene/batch1/DGE_CentralAmyg.RDS")
saveRDS(dge_dg_batch1, "/path/to/Data/RNA/Counts/Gene/batch1/DGE_DG.RDS")
saveRDS(dge_mpfc_batch1, "/path/to/Data/RNA/Counts/Gene/batch1/DGE_mPFC.RDS")

saveRDS(dge_ca_batch2, "/path/to/Data/RNA/Counts/Gene/batch2/DGE_CentralAmyg.RDS")
saveRDS(dge_dg_batch2, "/path/to/Data/RNA/Counts/Gene/batch2/DGE_DG.RDS")
saveRDS(dge_mpfc_batch2, "/path/to/Data/RNA/Counts/Gene/batch2/DGE_mPFC.RDS")

