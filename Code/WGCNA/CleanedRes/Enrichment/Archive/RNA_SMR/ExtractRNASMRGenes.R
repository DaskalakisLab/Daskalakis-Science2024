library(bigreadr)

SMR <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/Categories/SMRBreakdownRNA.csv")

SMR_MDD_CentralAmyg_Genes <- SMR[SMR$MDD_AMY_RNA_SCORE >= 1, "Genes"]
SMR_MDD_DG_Genes <- SMR[SMR$MDD_HIP_RNA_SCORE >= 1, "Genes"]
SMR_MDD_mPFC_Genes <- SMR[SMR$MDD_PFC_RNA_SCORE >= 1, "Genes"]

SMR_PTSD_CentralAmyg_Genes <- SMR[SMR$PTSD_AMY_RNA_SCORE >= 1, "Genes"]
SMR_PTSD_DG_Genes <- SMR[SMR$PTSD_HIP_RNA_SCORE >= 1, "Genes"]
SMR_PTSD_mPFC_Genes <- SMR[SMR$PTSD_PFC_RNA_SCORE >= 1, "Genes"]


SMR_PTSD_MDD_CentralAmyg_Genes <- intersect(SMR_PTSD_CentralAmyg_Genes, SMR_MDD_CentralAmyg_Genes)
SMR_PTSD_MDD_DG_Genes <- intersect(SMR_PTSD_DG_Genes, SMR_MDD_DG_Genes)
SMR_PTSD_MDD_mPFC_Genes <- intersect(SMR_PTSD_mPFC_Genes, SMR_MDD_mPFC_Genes)

rm(SMR)