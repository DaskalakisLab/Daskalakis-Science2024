#BiocManager::install("qsvaR")
library(qsvaR)
library(limma)
library(BiocFileCache)

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_tx.y123_n688.Rdata")

rse_tx_y1y2 <- rse_tx[, (rse_tx$Dataset=="PTSD_Year1") | (rse_tx$Dataset=="PTSD_Year2")]

# To remove Y3 from level
rse_tx_y1y2$Dataset <- as.factor(as.character(rse_tx_y1y2$Dataset))
# To remove ED from level
rse_tx_y1y2$Dx <- as.factor(as.character(rse_tx_y1y2$Dx))

# obtain transcripts with degradation signature
DegTx <- getDegTx(rse_tx_y1y2, type = "cell_component")
dim(DegTx)
#> [1] 2976  450
#> 
pcTx <- getPCs(rse_tx = DegTx, assayname = "tpm")

mod <- model.matrix(~ Dx + Age + Sex + Race + Region,
                    data = colData(rse_tx_y1y2)
)
# use k qsvs function to return a integer of pcs needed
k <- k_qsvs(rse_tx = DegTx, mod = mod, assayname = "tpm")
print(k)
#> [1] 19

qsvs <- get_qsvs(qsvPCs = pcTx, k = k)
dim(qsvs)
qsvs <- as.data.frame(qsvs)
saveRDS(qsvs, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/qSVA/qSVs_Y1Y2.RDS")
