library(SummarizedExperiment)
library(edgeR)

# Load data file
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_geneRSE.Rdata")

metadata <- as.data.frame(rse_gene@colData@listData)
sc48_samples <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/DLPFC_Samples_48.RDS")
sc48_brnums <- sc48_samples$Br_id_opi
metadata <- metadata[metadata$BrNum %in% sc48_brnums,]
metadata <- metadata[metadata$Region=="DLPFC",]
names(metadata)[names(metadata)=="SAMPLE_ID"] <- "SampleID"



dcount=assays(rse_gene)[[1]]
dcount <- as.data.frame(dcount)

sc48_sampleIDs <- metadata$SampleID

count_sc48 <- dcount[,sc48_sampleIDs]


create_dge_list <- function(counts, anno){
  dge <- DGEList(counts)
  dge$samples$SampleID <- rownames(dge$samples)
  anno$Dx <- factor(anno$Dx)
  dge$samples <- merge(dge$samples, anno[,c("SampleID", "Dx")], by="SampleID", all.x=T)
  dge$samples$group <- dge$samples$Dx
  rownames(dge$samples) <- dge$samples$SampleID
  dge$samples <- dge$samples[,c("group", "lib.size", "norm.factors")]
  dge$group <- as.factor(dge$samples$group)
  dge$samples <- dge$samples[colnames(dge$counts),]
  return(dge)
}

dge_sc48 <- create_dge_list(count_sc48, metadata)

identical(colnames(dge_sc48$counts), rownames(dge_sc48$samples))

setdiff(rownames(dge_sc48$samples), sc48_sampleIDs)

saveRDS(dge_sc48, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Counts/Genes/DGE_DLPFC_48.RDS")
