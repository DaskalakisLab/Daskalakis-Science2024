library(SummarizedExperiment)
library(edgeR)

# Load data file
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_jxnRSE.Rdata")

metadata <- as.data.frame(rse_jxn@colData@listData)
dlpfc_231_samples <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/DLPFC_Samples_231.RDS")
dlpfc_231_brnums <- dlpfc_231_samples$Br_id_opi
metadata <- metadata[metadata$BrNum %in% dlpfc_231_brnums,]
metadata <- metadata[metadata$Region=="DLPFC",]
names(metadata)[names(metadata)=="SAMPLE_ID"] <- "SampleID"



dcount=assays(rse_jxn)[[1]]
dcount <- as.data.frame(as.matrix(dcount))

dlpfc_231_sampleIDs <- metadata$SampleID

count_dlpfc_231 <- dcount[,dlpfc_231_sampleIDs]
rm(dcount)
gc()

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

dge_dlpfc_231 <- create_dge_list(count_dlpfc_231, metadata)

identical(colnames(dge_dlpfc_231$counts), rownames(dge_dlpfc_231$samples))

setdiff(rownames(dge_dlpfc_231$samples), dlpfc_231_sampleIDs)

saveRDS(dge_dlpfc_231, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Counts/Jxs/DGE_DLPFC_231.RDS")
