#library(remotes)
#remotes::install_github("RRHO2/RRHO2")
library(RRHO2)

# Input:
# df1 = limma top table results for one analysis
# df2 = limma top table results for second analysis to compare
# l1 = label to be used in plotting (i.e. what is the analysis in df1)
# l2 = label to be used in plotting (i.e. what is the analysis in df2)
# outfile = location to save plot

plot_heatmap_multi <- function(df1, df2, l1, l2, outfile){
  
  names(df1)[names(df1)=="protein"] <- "gene"
  names(df2)[names(df2)=="protein"] <- "gene"
  
  # Extract all genes which are common between the two analyses
  common_genes <- intersect(df1$gene, df2$gene)
  
  # Subset each data frame to common genes
  # ***Note: all genes must be the same but they do not need to be in the same order
  df1 <- df1[df1$gene %in% common_genes,]
  df2 <- df2[df2$gene %in% common_genes,]
  
  # Create new column -log10(P.Value)*sign(logFC)
  df1$DDE <- -log10(df1$P.Value)*sign(df1$logFC)
  df2$DDE <- -log10(df2$P.Value)*sign(df2$logFC)
  
  df1 <- df1[order(df1$gene),]
  df2 <- df2[order(df2$gene),]
  
  rho <- cor(df1$DDE, df2$DDE, method = "spearman")
  
  # Rename columns and convert to dataframe for RRHO2 code to work
  df1 <- df1[,c("gene", "DDE")]
  df1 <- as.data.frame(df1)
  names(df1) <- c("Genes", "DDE")
  
  # Rename columns and convert to dataframe for RRHO2 code to work
  df2 <- df2[,c("gene", "DDE")]
  names(df2) <- c("Genes", "DDE")
  df2 <- as.data.frame(df2)
  
  
  rho <- format(round(rho, 3), nsmall = 3)
  # Create RRHO2 object
  RRHO_obj <-  RRHO2_initialize(df1, df2, labels = c(paste0(l1, " (Rho: ",rho,")"), l2), log10.ind=TRUE)
  
  # Plot heatmap and save as a .pdf file
  l1 <- gsub(" ", "_", l1)
  filename <- paste0(outfile)
  pdf(filename, width = 7, height = 7)
  RRHO2_heatmap(RRHO_obj)
  dev.off()
  
}
# Adjust margin size to work properly
par(mar=c(2,2,2,2))
# 
# # RNA
# PTSD_CentralAmyg_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
# PTSD_DG_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
# PTSD_mPFC_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
# 
# plot_heatmap_multi(PTSD_CentralAmyg_RNA, PTSD_DG_RNA, "PTSD Central Amygdala", "PTSD DG", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD_CA_DG.pdf")
# plot_heatmap_multi(PTSD_CentralAmyg_RNA, PTSD_mPFC_RNA, "PTSD Central Amygdala", "PTSD mPFC", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD_CA_mPFC.pdf")
# plot_heatmap_multi(PTSD_DG_RNA, PTSD_mPFC_RNA, "PTSD DG", "PTSD mPFC", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD_DG_mPFC.pdf")
# 
# MDD_CentralAmyg_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
# MDD_DG_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
# MDD_mPFC_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
# 
# plot_heatmap_multi(MDD_CentralAmyg_RNA, MDD_DG_RNA, "MDD Central Amygdala", "MDD DG", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/MDD_CA_DG.pdf")
# plot_heatmap_multi(MDD_CentralAmyg_RNA, MDD_mPFC_RNA, "MDD Central Amygdala", "MDD mPFC", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/MDD_CA_mPFC.pdf")
# plot_heatmap_multi(MDD_DG_RNA, MDD_mPFC_RNA, "MDD DG", "MDD mPFC", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/MDD_DG_mPFC.pdf")
# 
# 
# 
# 
# 
# 
# 
# 
# PTSD_MDD_CentralAmyg_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
# PTSD_MDD_DG_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
# PTSD_MDD_mPFC_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")
# 
# plot_heatmap_multi(PTSD_MDD_CentralAmyg_RNA, PTSD_MDD_DG_RNA, "PTSD+MDD Central Amygdala", "PTSD+MDD DG", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD+MDD_CA_DG.pdf")
# plot_heatmap_multi(PTSD_MDD_CentralAmyg_RNA, PTSD_MDD_mPFC_RNA, "PTSD+MDD Central Amygdala", "PTSD+MDD mPFC", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD+MDD_CA_mPFC.pdf")
# plot_heatmap_multi(PTSD_MDD_DG_RNA, PTSD_MDD_mPFC_RNA, "PTSD+MDD DG", "PTSD+MDD mPFC", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD+MDD_DG_mPFC.pdf")
# 
# PTSD_vs_MDD_CentralAmyg_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
# PTSD_vs_MDD_DG_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")
# PTSD_vs_MDD_mPFC_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")
# 
# plot_heatmap_multi(PTSD_vs_MDD_CentralAmyg_RNA, PTSD_vs_MDD_DG_RNA, "PTSD vs MDD Central Amygdala", "PTSD vs MDD DG", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD_vs_MDD_CA_DG.pdf")
# plot_heatmap_multi(PTSD_vs_MDD_CentralAmyg_RNA, PTSD_vs_MDD_mPFC_RNA, "PTSD vs MDD Central Amygdala", "PTSD vs MDD mPFC", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD_vs_MDD_CA_mPFC.pdf")
# plot_heatmap_multi(PTSD_vs_MDD_DG_RNA, PTSD_vs_MDD_mPFC_RNA, "PTSD vs MDD DG", "PTSD vs MDD mPFC", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/Baseline/Y1Y2/PTSD_vs_MDD_DG_mPFC.pdf")
