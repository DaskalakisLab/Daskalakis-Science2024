library(SummarizedExperiment)

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_tx.y123_n688.Rdata")

dcount <- assays(rse_tx)[[1]]
dcount <- as.data.frame(dcount)

dcount2 <- dcount+1
dcount3 <- log2(dcount2)
rm(dcount,dcount2)

annoy12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
annoy3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

ca_y12 <- unique(annoy12[annoy12$Brain_Region=="CentralAmyg", "SampleID"])
dg_y12 <- unique(annoy12[annoy12$Brain_Region=="DG", "SampleID"])
mpfc_y12 <- unique(annoy12[annoy12$Brain_Region=="mPFC", "SampleID"])

ca_y3 <- unique(annoy3[annoy3$Brain_Region=="CentralAmyg", "SampleID"])
dg_y3 <- unique(annoy3[annoy3$Brain_Region=="DG", "SampleID"])
mpfc_y3 <- unique(annoy3[annoy3$Brain_Region=="mPFC", "SampleID"])

count_ca_y12 <- dcount3[,ca_y12]
count_dg_y12 <- dcount3[,dg_y12]
count_mpfc_y12 <- dcount3[,mpfc_y12]

count_ca_y3 <- dcount3[,ca_y3]
count_dg_y3 <- dcount3[,dg_y3]
count_mpfc_y3 <- dcount3[,mpfc_y3]

dim(count_ca_y12)
dim(count_dg_y12)
dim(count_mpfc_y12)

dim(count_ca_y3)
dim(count_dg_y3)
dim(count_mpfc_y3)

saveRDS(count_ca_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_CentralAmyg.RDS")
saveRDS(count_dg_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_DG.RDS")
saveRDS(count_mpfc_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_mPFC.RDS")

saveRDS(count_ca_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_CentralAmyg.RDS")
saveRDS(count_dg_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_DG.RDS")
saveRDS(count_mpfc_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_mPFC.RDS")
