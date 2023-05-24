# MDD
RNA_CentralAmyg_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/MDD_CentralAmyg_beta_sd.RDS")
RNA_CentralAmyg_MDD <- RNA_CentralAmyg_MDD[(RNA_CentralAmyg_MDD$FDR < 0.05) & (abs(RNA_CentralAmyg_MDD$sd_from_mean)) > 3,]
RNA_CentralAmyg_MDD_Genes <- unique(RNA_CentralAmyg_MDD$symbol)
RNA_CentralAmyg_MDD_Genes <- c("MDD_CentralAmyg_FDR_BETA_GENES", RNA_CentralAmyg_MDD_Genes)
lapply(RNA_CentralAmyg_MDD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/CentralAmyg/MDD_CentralAmyg_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

RNA_DG_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/MDD_DG_beta_sd.RDS")
RNA_DG_MDD <- RNA_DG_MDD[(RNA_DG_MDD$FDR < 0.05) & (abs(RNA_DG_MDD$sd_from_mean)) > 3,]
RNA_DG_MDD_Genes <- unique(RNA_DG_MDD$symbol)
RNA_DG_MDD_Genes <- c("MDD_DG_FDR_BETA_GENES", RNA_DG_MDD_Genes)
lapply(RNA_DG_MDD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/DG/MDD_DG_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

RNA_mPFC_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/MDD_mPFC_beta_sd.RDS")
RNA_mPFC_MDD <- RNA_mPFC_MDD[(RNA_mPFC_MDD$FDR < 0.05) & (abs(RNA_mPFC_MDD$sd_from_mean)) > 3,]
RNA_mPFC_MDD_Genes <- unique(RNA_mPFC_MDD$symbol)
RNA_mPFC_MDD_Genes <- c("MDD_mPFC_FDR_BETA_GENES", RNA_mPFC_MDD_Genes)
lapply(RNA_mPFC_MDD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/mPFC/MDD_mPFC_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

# PTSD
RNA_CentralAmyg_PTSD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_CentralAmyg_beta_sd.RDS")
RNA_CentralAmyg_PTSD <- RNA_CentralAmyg_PTSD[(RNA_CentralAmyg_PTSD$FDR < 0.05) & (abs(RNA_CentralAmyg_PTSD$sd_from_mean)) > 3,]
RNA_CentralAmyg_PTSD_Genes <- unique(RNA_CentralAmyg_PTSD$symbol)
RNA_CentralAmyg_PTSD_Genes <- c("PTSD_CentralAmyg_FDR_BETA_GENES", RNA_CentralAmyg_PTSD_Genes)
lapply(RNA_CentralAmyg_PTSD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/CentralAmyg/PTSD_CentralAmyg_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

RNA_DG_PTSD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_DG_beta_sd.RDS")
RNA_DG_PTSD <- RNA_DG_PTSD[(RNA_DG_PTSD$FDR < 0.05) & (abs(RNA_DG_PTSD$sd_from_mean)) > 3,]
RNA_DG_PTSD_Genes <- unique(RNA_DG_PTSD$symbol)
RNA_DG_PTSD_Genes <- c("PTSD_DG_FDR_BETA_GENES", RNA_DG_PTSD_Genes)
lapply(RNA_DG_PTSD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/DG/PTSD_DG_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

RNA_mPFC_PTSD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_mPFC_beta_sd.RDS")
RNA_mPFC_PTSD <- RNA_mPFC_PTSD[(RNA_mPFC_PTSD$FDR < 0.05) & (abs(RNA_mPFC_PTSD$sd_from_mean)) > 3,]
RNA_mPFC_PTSD_Genes <- unique(RNA_mPFC_PTSD$symbol)
RNA_mPFC_PTSD_Genes <- c("PTSD_mPFC_FDR_BETA_GENES", RNA_mPFC_PTSD_Genes)
lapply(RNA_mPFC_PTSD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/mPFC/PTSD_mPFC_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

# PTSD_MDD
RNA_CentralAmyg_PTSD_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_MDD_CentralAmyg_beta_sd.RDS")
RNA_CentralAmyg_PTSD_MDD <- RNA_CentralAmyg_PTSD_MDD[(RNA_CentralAmyg_PTSD_MDD$FDR < 0.05) & (abs(RNA_CentralAmyg_PTSD_MDD$sd_from_mean)) > 3,]
RNA_CentralAmyg_PTSD_MDD_Genes <- unique(RNA_CentralAmyg_PTSD_MDD$symbol)
RNA_CentralAmyg_PTSD_MDD_Genes <- c("PTSD_MDD_CentralAmyg_FDR_BETA_GENES", RNA_CentralAmyg_PTSD_MDD_Genes)
lapply(RNA_CentralAmyg_PTSD_MDD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/CentralAmyg/PTSD_MDD_CentralAmyg_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

RNA_DG_PTSD_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_MDD_DG_beta_sd.RDS")
RNA_DG_PTSD_MDD <- RNA_DG_PTSD_MDD[(RNA_DG_PTSD_MDD$FDR < 0.05) & (abs(RNA_DG_PTSD_MDD$sd_from_mean)) > 3,]
RNA_DG_PTSD_MDD_Genes <- unique(RNA_DG_PTSD_MDD$symbol)
RNA_DG_PTSD_MDD_Genes <- c("PTSD_MDD_DG_FDR_BETA_GENES", RNA_DG_PTSD_MDD_Genes)
lapply(RNA_DG_PTSD_MDD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/DG/PTSD_MDD_DG_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

RNA_mPFC_PTSD_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_MDD_mPFC_beta_sd.RDS")
RNA_mPFC_PTSD_MDD <- RNA_mPFC_PTSD_MDD[(RNA_mPFC_PTSD_MDD$FDR < 0.05) & (abs(RNA_mPFC_PTSD_MDD$sd_from_mean)) > 3,]
RNA_mPFC_PTSD_MDD_Genes <- unique(RNA_mPFC_PTSD_MDD$symbol)
RNA_mPFC_PTSD_MDD_Genes <- c("PTSD_MDD_mPFC_FDR_BETA_GENES", RNA_mPFC_PTSD_MDD_Genes)
lapply(RNA_mPFC_PTSD_MDD_Genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/mPFC/PTSD_MDD_mPFC_FDR_BETA_GENES.txt", append=TRUE, ncolumns=1000)

#################
# MDD
Protein_CentralAmyg_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/MDD_CentralAmyg_beta_sd.RDS")
Protein_CentralAmyg_MDD <- Protein_CentralAmyg_MDD[(Protein_CentralAmyg_MDD$FDR < 0.05) & (abs(Protein_CentralAmyg_MDD$sd_from_mean)) > 3,]
Protein_CentralAmyg_MDD_Proteins <- unique(Protein_CentralAmyg_MDD$symbol)
Protein_CentralAmyg_MDD_Proteins <- c("MDD_CentralAmyg_FDR_BETA_PROTEINS", Protein_CentralAmyg_MDD_Proteins)
lapply(Protein_CentralAmyg_MDD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/CentralAmyg/MDD_CentralAmyg_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)

Protein_DG_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/MDD_DG_beta_sd.RDS")
Protein_DG_MDD <- Protein_DG_MDD[(Protein_DG_MDD$FDR < 0.05) & (abs(Protein_DG_MDD$sd_from_mean)) > 3,]
Protein_DG_MDD_Proteins <- unique(Protein_DG_MDD$symbol)
Protein_DG_MDD_Proteins <- c("MDD_DG_FDR_BETA_PROTEINS", Protein_DG_MDD_Proteins)
lapply(Protein_DG_MDD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/DG/MDD_DG_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)

Protein_mPFC_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/MDD_mPFC_beta_sd.RDS")
Protein_mPFC_MDD <- Protein_mPFC_MDD[(Protein_mPFC_MDD$FDR < 0.05) & (abs(Protein_mPFC_MDD$sd_from_mean)) > 3,]
Protein_mPFC_MDD_Proteins <- unique(Protein_mPFC_MDD$symbol)
Protein_mPFC_MDD_Proteins <- c("MDD_mPFC_FDR_BETA_PROTEINS", Protein_mPFC_MDD_Proteins)
lapply(Protein_mPFC_MDD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/mPFC/MDD_mPFC_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)

# PTSD
Protein_CentralAmyg_PTSD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_CentralAmyg_beta_sd.RDS")
Protein_CentralAmyg_PTSD <- Protein_CentralAmyg_PTSD[(Protein_CentralAmyg_PTSD$FDR < 0.05) & (abs(Protein_CentralAmyg_PTSD$sd_from_mean)) > 3,]
Protein_CentralAmyg_PTSD_Proteins <- unique(Protein_CentralAmyg_PTSD$symbol)
Protein_CentralAmyg_PTSD_Proteins <- c("PTSD_CentralAmyg_FDR_BETA_PROTEINS", Protein_CentralAmyg_PTSD_Proteins)
lapply(Protein_CentralAmyg_PTSD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/CentralAmyg/PTSD_CentralAmyg_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)

# Nothing passes threshold
# Protein_DG_PTSD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_DG_beta_sd.RDS")
# Protein_DG_PTSD <- Protein_DG_PTSD[(Protein_DG_PTSD$FDR < 0.05) & (abs(Protein_DG_PTSD$sd_from_mean)) > 3,]
# Protein_DG_PTSD_Proteins <- unique(Protein_DG_PTSD$symbol)
# Protein_DG_PTSD_Proteins <- c("PTSD_DG_FDR_BETA_PROTEINS", Protein_DG_PTSD_Proteins)
# lapply(Protein_DG_PTSD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/DG/PTSD_DG_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)

Protein_mPFC_PTSD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_mPFC_beta_sd.RDS")
Protein_mPFC_PTSD <- Protein_mPFC_PTSD[(Protein_mPFC_PTSD$FDR < 0.05) & (abs(Protein_mPFC_PTSD$sd_from_mean)) > 3,]
Protein_mPFC_PTSD_Proteins <- unique(Protein_mPFC_PTSD$symbol)
Protein_mPFC_PTSD_Proteins <- c("PTSD_mPFC_FDR_BETA_PROTEINS", Protein_mPFC_PTSD_Proteins)
lapply(Protein_mPFC_PTSD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/mPFC/PTSD_mPFC_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)

# PTSD_MDD
Protein_CentralAmyg_PTSD_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_MDD_CentralAmyg_beta_sd.RDS")
Protein_CentralAmyg_PTSD_MDD <- Protein_CentralAmyg_PTSD_MDD[(Protein_CentralAmyg_PTSD_MDD$FDR < 0.05) & (abs(Protein_CentralAmyg_PTSD_MDD$sd_from_mean)) > 3,]
Protein_CentralAmyg_PTSD_MDD_Proteins <- unique(Protein_CentralAmyg_PTSD_MDD$symbol)
Protein_CentralAmyg_PTSD_MDD_Proteins <- c("PTSD_MDD_CentralAmyg_FDR_BETA_PROTEINS", Protein_CentralAmyg_PTSD_MDD_Proteins)
lapply(Protein_CentralAmyg_PTSD_MDD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/CentralAmyg/PTSD_MDD_CentralAmyg_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)

# Nothing passes threshold
# Protein_DG_PTSD_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_MDD_DG_beta_sd.RDS")
# Protein_DG_PTSD_MDD <- Protein_DG_PTSD_MDD[(Protein_DG_PTSD_MDD$FDR < 0.05) & (abs(Protein_DG_PTSD_MDD$sd_from_mean)) > 3,]
# Protein_DG_PTSD_MDD_Proteins <- unique(Protein_DG_PTSD_MDD$symbol)
# Protein_DG_PTSD_MDD_Proteins <- c("PTSD_MDD_DG_FDR_BETA_PROTEINS", Protein_DG_PTSD_MDD_Proteins)
# lapply(Protein_DG_PTSD_MDD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/DG/PTSD_MDD_DG_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)

Protein_mPFC_PTSD_MDD <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_MDD_mPFC_beta_sd.RDS")
Protein_mPFC_PTSD_MDD <- Protein_mPFC_PTSD_MDD[(Protein_mPFC_PTSD_MDD$FDR < 0.05) & (abs(Protein_mPFC_PTSD_MDD$sd_from_mean)) > 3,]
Protein_mPFC_PTSD_MDD_Proteins <- unique(Protein_mPFC_PTSD_MDD$symbol)
Protein_mPFC_PTSD_MDD_Proteins <- c("PTSD_MDD_mPFC_FDR_BETA_PROTEINS", Protein_mPFC_PTSD_MDD_Proteins)
lapply(Protein_mPFC_PTSD_MDD_Proteins, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/mPFC/PTSD_MDD_mPFC_FDR_BETA_PROTEINS.txt", append=TRUE, ncolumns=1000)


