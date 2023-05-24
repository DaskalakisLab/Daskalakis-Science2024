source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/Enrichment/RNA/ExtractFDRGenes.R")

MDD_CentralAmyg_FDR <- c("MDD_CentralAmyg_FDR_Genes", MDD_CentralAmyg_FDR)
lapply(MDD_CentralAmyg_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/MDD_CentralAmyg_fnIn.txt", append=TRUE, ncolumns=1000)

MDD_mPFC_FDR <- c("MDD_mPFC_FDR_Genes", MDD_mPFC_FDR)
lapply(MDD_mPFC_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/MDD_mPFC_fnIn.txt", append=TRUE, ncolumns=1000)

MDD_DG_FDR <- c("MDD_DG_FDR_Genes", MDD_DG_FDR)
lapply(MDD_DG_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/MDD_DG_fnIn.txt", append=TRUE, ncolumns=1000)

PTSD_CentralAmyg_FDR <- c("PTSD_CentralAmyg_FDR_Genes", PTSD_CentralAmyg_FDR)
lapply(PTSD_CentralAmyg_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/PTSD_CentralAmyg_fnIn.txt", append=TRUE, ncolumns=1000)

PTSD_mPFC_FDR <- c("PTSD_mPFC_FDR_Genes", PTSD_mPFC_FDR)
lapply(PTSD_mPFC_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/PTSD_mPFC_fnIn.txt", append=TRUE, ncolumns=1000)

PTSD_DG_FDR <- c("PTSD_DG_FDR_Genes", PTSD_DG_FDR)
lapply(PTSD_DG_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/PTSD_DG_fnIn.txt", append=TRUE, ncolumns=1000)

PTSD_MDD_CentralAmyg_FDR <- c("PTSD_MDD_CentralAmyg_FDR_Genes", PTSD_MDD_CentralAmyg_FDR)
lapply(PTSD_MDD_CentralAmyg_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/PTSD_MDD_CentralAmyg_fnIn.txt", append=TRUE, ncolumns=1000)

PTSD_MDD_mPFC_FDR <- c("PTSD_MDD_mPFC_FDR_Genes", PTSD_MDD_mPFC_FDR)
lapply(PTSD_MDD_mPFC_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/PTSD_MDD_mPFC_fnIn.txt", append=TRUE, ncolumns=1000)

PTSD_MDD_DG_FDR <- c("PTSD_MDD_DG_FDR_Genes", PTSD_MDD_DG_FDR)
lapply(PTSD_MDD_DG_FDR, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/PTSD_MDD_DG_fnIn.txt", append=TRUE, ncolumns=1000)
