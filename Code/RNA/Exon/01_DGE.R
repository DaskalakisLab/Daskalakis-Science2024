library(SummarizedExperiment)
library(edgeR)

# Load data file
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_exon.y123_n688.Rdata")

dcount=assays(rse_exon)[[1]]
dcount <- as.data.frame(dcount)

annoy12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
annoy3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

ca_y12 <- unique(annoy12[annoy12$Brain_Region=="CentralAmyg", "SampleID"])
dg_y12 <- unique(annoy12[annoy12$Brain_Region=="DG", "SampleID"])
mpfc_y12 <- unique(annoy12[annoy12$Brain_Region=="mPFC", "SampleID"])

ca_y3 <- unique(annoy3[annoy3$Brain_Region=="CentralAmyg", "SampleID"])
dg_y3 <- unique(annoy3[annoy3$Brain_Region=="DG", "SampleID"])
mpfc_y3 <- unique(annoy3[annoy3$Brain_Region=="mPFC", "SampleID"])

count_ca_y12 <- dcount[,ca_y12]
count_dg_y12 <- dcount[,dg_y12]
count_mpfc_y12 <- dcount[,mpfc_y12]

count_ca_y3 <- dcount[,ca_y3]
count_dg_y3 <- dcount[,dg_y3]
count_mpfc_y3 <- dcount[,mpfc_y3]



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

dge_ca_y12 <- create_dge_list(count_ca_y12, annoy12)
dge_dg_y12 <- create_dge_list(count_dg_y12, annoy12)
dge_mpfc_y12 <- create_dge_list(count_mpfc_y12, annoy12)

dge_ca_y3 <- create_dge_list(count_ca_y3, annoy3)
dge_dg_y3 <- create_dge_list(count_dg_y3, annoy3)
dge_mpfc_y3 <- create_dge_list(count_mpfc_y3, annoy3)

identical(colnames(dge_ca_y12$counts), rownames(dge_ca_y12$samples))
identical(colnames(dge_dg_y12$counts), rownames(dge_dg_y12$samples))
identical(colnames(dge_mpfc_y12$counts), rownames(dge_mpfc_y12$samples))

identical(colnames(dge_ca_y3$counts), rownames(dge_ca_y3$samples))
identical(colnames(dge_dg_y3$counts), rownames(dge_dg_y3$samples))
identical(colnames(dge_mpfc_y3$counts), rownames(dge_mpfc_y3$samples))


setdiff(rownames(dge_ca_y12$samples), ca_y12)
setdiff(rownames(dge_dg_y12$samples), dg_y12)
setdiff(rownames(dge_mpfc_y12$samples), mpfc_y12)

setdiff(rownames(dge_ca_y3$samples), ca_y3)
setdiff(rownames(dge_dg_y3$samples), dg_y3)
setdiff(rownames(dge_mpfc_y3$samples), mpfc_y3)


saveRDS(dge_ca_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Exon/Y1Y2/DGE_CentralAmyg.RDS")
saveRDS(dge_dg_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Exon/Y1Y2/DGE_DG.RDS")
saveRDS(dge_mpfc_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Exon/Y1Y2/DGE_mPFC.RDS")

saveRDS(dge_ca_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Exon/Y3/DGE_CentralAmyg.RDS")
saveRDS(dge_dg_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Exon/Y3/DGE_DG.RDS")
saveRDS(dge_mpfc_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Exon/Y3/DGE_mPFC.RDS")

