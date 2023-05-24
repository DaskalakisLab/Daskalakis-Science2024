MDD_CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/MDD_CentralAmyg.RDS")
MDD_CentralAmyg_FDR <- MDD_CentralAmyg[MDD_CentralAmyg$FDR<0.05,"symbol"]
rm(MDD_CentralAmyg)

MDD_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/MDD_mPFC.RDS")
MDD_mPFC_FDR <- MDD_mPFC[MDD_mPFC$FDR<0.05,"symbol"]
rm(MDD_mPFC)

MDD_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/MDD_DG.RDS")
MDD_DG_FDR <- MDD_DG[MDD_DG$FDR<0.05,"symbol"]
#MDD_DG_FDR <- strsplit(MDD_DG_FDR, "; ")[[1]]
rm(MDD_DG)

PTSD_CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_CentralAmyg.RDS")
PTSD_CentralAmyg_FDR <- PTSD_CentralAmyg[PTSD_CentralAmyg$FDR<0.05,"symbol"]
rm(PTSD_CentralAmyg)

PTSD_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_mPFC.RDS")
PTSD_mPFC_FDR <- PTSD_mPFC[PTSD_mPFC$FDR<0.05,"symbol"]
rm(PTSD_mPFC)

PTSD_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_DG.RDS")
PTSD_DG_FDR <- PTSD_DG[PTSD_DG$FDR<0.05,"symbol"]
rm(PTSD_DG)

PTSD_MDD_CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_MDD_CentralAmyg.RDS")
PTSD_MDD_CentralAmyg_FDR <- PTSD_MDD_CentralAmyg[PTSD_MDD_CentralAmyg$FDR<0.05,"symbol"]
rm(PTSD_MDD_CentralAmyg)

PTSD_MDD_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_MDD_mPFC.RDS")
PTSD_MDD_mPFC_FDR <- PTSD_MDD_mPFC[PTSD_MDD_mPFC$FDR<0.05,"symbol"]
rm(PTSD_MDD_mPFC)

PTSD_MDD_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_MDD_DG.RDS")
PTSD_MDD_DG_FDR <- PTSD_MDD_DG[PTSD_MDD_DG$FDR<0.05,"symbol"]
rm(PTSD_MDD_DG)



