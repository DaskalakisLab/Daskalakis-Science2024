library(SummarizedExperiment)

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_txRSE.Rdata")

dcount <- assays(rse_tx)[[1]]
dcount <- as.data.frame(dcount)

dcount2 <- dcount+1
dcount3 <- log2(dcount2)
rm(dcount,dcount2)

metadata <- as.data.frame(rse_tx@colData@listData)
sc48_samples <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/DLPFC_Samples_48.RDS")
sc48_brnums <- sc48_samples$Br_id_opi
metadata <- metadata[metadata$BrNum %in% sc48_brnums,]
metadata <- metadata[metadata$Region=="DLPFC",]
names(metadata)[names(metadata)=="SAMPLE_ID"] <- "SampleID"

sc48_sampleIDs <- metadata$SampleID
count_sc48 <- dcount3[,sc48_sampleIDs]


saveRDS(count_sc48, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_sc48.RDS")
