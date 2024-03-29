library(SummarizedExperiment)

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_tx.y123_n688.Rdata")

dcount <- assays(rse_tx)[[1]]
dcount <- as.data.frame(dcount)

dcount2 <- dcount+1
dcount3 <- log2(dcount2)
rm(dcount,dcount2)


annoy123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS")



ca_y123 <- unique(annoy123[annoy123$Brain_Region=="CentralAmyg", "SampleID"])
ca_y123 <- na.omit(ca_y123)
dg_y123 <- unique(annoy123[annoy123$Brain_Region=="DG", "SampleID"])
dg_y123 <- na.omit(dg_y123)
mpfc_y123 <- unique(annoy123[annoy123$Brain_Region=="mPFC", "SampleID"])
mpfc_y123  <- na.omit(mpfc_y123 )



count_ca_y123 <- dcount3[,ca_y123]
count_dg_y123 <- dcount3[,dg_y123]
count_mpfc_y123 <- dcount3[,mpfc_y123]




dim(count_ca_y123)
# 198093    229
dim(count_dg_y123)
# 198093    230
dim(count_mpfc_y123)
# 198093    229



saveRDS(count_ca_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Txs/Y1Y2Y3/log2TMM1_CentralAmyg.RDS")
saveRDS(count_dg_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Txs/Y1Y2Y3/log2TMM1_DG.RDS")
saveRDS(count_mpfc_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Txs/Y1Y2Y3/log2TMM1_mPFC.RDS")

