library(SummarizedExperiment)

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_txRSE.Rdata")

dcount <- assays(rse_tx)[[1]]
dcount <- as.data.frame(dcount)

dcount2 <- dcount+1
dcount3 <- log2(dcount2)
rm(dcount,dcount2)

metadata <- as.data.frame(rse_tx@colData@listData)
dlpfc_231_samples <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/DLPFC_Samples_231.RDS")
dlpfc_231_brnums <- dlpfc_231_samples$Br_id_opi
metadata <- metadata[metadata$BrNum %in% dlpfc_231_brnums,]
metadata <- metadata[metadata$Region=="DLPFC",]
names(metadata)[names(metadata)=="SAMPLE_ID"] <- "SampleID"

dlpfc_231_sampleIDs <- metadata$SampleID
count_dlpfc_231 <- dcount3[,dlpfc_231_sampleIDs]


saveRDS(count_dlpfc_231, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_231.RDS")
