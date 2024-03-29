#BiocManager::install("qsvaR")
library(qsvaR)
library(limma)
library(BiocFileCache)

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_tx.y123_n688.Rdata")

rse_tx_y3 <- rse_tx[, rse_tx$Dataset=="PTSD_Year3"]

# To remove Y3 from level
rse_tx_y3$Dataset <- as.factor(as.character(rse_tx_y3$Dataset))

# To remove ED from level
# Br5393 should be MDD not ED
rse_tx_y3@colData[rse_tx_y3@colData$Dx=="ED", "Dx"] <- "MDD"
rse_tx_y3$Dx <- as.factor(as.character(rse_tx_y3$Dx))

# No As or HISP in Y3
rse_tx_y3$Race <- as.factor(as.character(rse_tx_y3$Race))

# obtain transcripts with degradation signature
DegTx <- getDegTx(rse_tx_y3, type = "cell_component")
dim(DegTx)
#> [1] 2976  238

pcTx <- getPCs(rse_tx = DegTx, assayname = "tpm")

mod <- model.matrix(~ Dx + Age + Sex + Race + Region,
                    data = colData(rse_tx_y3)
)
# use k qsvs function to return a integer of pcs needed
k <- k_qsvs(rse_tx = DegTx, mod = mod, assayname = "tpm")
print(k)
#> [1] 17

qsvs <- get_qsvs(qsvPCs = pcTx, k = k)
dim(qsvs)
qsvs <- as.data.frame(qsvs)
saveRDS(qsvs, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/qSVA/qSVs_Y3.RDS")
