#library(remotes)
#remotes::install_github("RRHO2/RRHO2")
library(RRHO2)

plot_heatmap_multi <- function(df1, df2, l1, l2, outfile){
  
  names(df1)[names(df1)=="protein"] <- "gene"
  names(df2)[names(df2)=="protein"] <- "gene"
  print(nrow(df1))
  print(nrow(df2))
  # Extract all genes which are common between the two analyses
  common_genes <- intersect(df1$gene, df2$gene)
  print(length(common_genes))

  
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


#mPFC
RNA_PTSD_mPFC_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
RNA_PTSD_mPFC_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")

plot_heatmap_multi(RNA_PTSD_mPFC_12, RNA_PTSD_mPFC_3, "PTSD mPFC 12", "PTSD mPFC 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/PTSD_mPFC_Y1Y2_vs_Y3.pdf")


Protein_PTSD_mPFC_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
Protein_PTSD_mPFC_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")

plot_heatmap_multi(Protein_PTSD_mPFC_12, Protein_PTSD_mPFC_3, "Prot PTSD mPFC 12", "Prot PTSD mPFC 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")



RNA_MDD_mPFC_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
RNA_MDD_mPFC_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/MDD/results_MDD_mPFC_MDD.RDS")

plot_heatmap_multi(RNA_MDD_mPFC_12, RNA_MDD_mPFC_3, "MDD mPFC 12", "MDD mPFC 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")


Protein_MDD_mPFC_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
Protein_MDD_mPFC_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/MDD/results_MDD_mPFC_MDD.RDS")

plot_heatmap_multi(Protein_MDD_mPFC_12, Protein_MDD_mPFC_3, "Prot MDD mPFC 12", "Prot MDD mPFC 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")


#CentralAmyg
RNA_PTSD_CentralAmyg_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
RNA_PTSD_CentralAmyg_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")

plot_heatmap_multi(RNA_PTSD_CentralAmyg_12, RNA_PTSD_CentralAmyg_3, "PTSD CentralAmyg 12", "PTSD CentralAmyg 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")


Protein_PTSD_CentralAmyg_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
Protein_PTSD_CentralAmyg_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")

plot_heatmap_multi(Protein_PTSD_CentralAmyg_12, Protein_PTSD_CentralAmyg_3, "Prot PTSD CentralAmyg 12", "Prot PTSD CentralAmyg 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")







RNA_MDD_CentralAmyg_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
RNA_MDD_CentralAmyg_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")

plot_heatmap_multi(RNA_MDD_CentralAmyg_12, RNA_MDD_CentralAmyg_3, "MDD CentralAmyg 12", "MDD CentralAmyg 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")


Protein_MDD_CentralAmyg_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
Protein_MDD_CentralAmyg_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")

plot_heatmap_multi(Protein_MDD_CentralAmyg_12, Protein_MDD_CentralAmyg_3, "Prot MDD CentralAmyg 12", "Prot MDD CentralAmyg 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")


#DG
RNA_PTSD_DG_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
RNA_PTSD_DG_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/PTSD/results_PTSD_DG_PTSD.RDS")

plot_heatmap_multi(RNA_PTSD_DG_12, RNA_PTSD_DG_3, "PTSD DG 12", "PTSD DG 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")


Protein_PTSD_DG_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
Protein_PTSD_DG_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/PTSD/results_PTSD_DG_PTSD.RDS")

plot_heatmap_multi(Protein_PTSD_DG_12, Protein_PTSD_DG_3, "Prot PTSD DG 12", "Prot PTSD DG 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")



RNA_MDD_DG_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
RNA_MDD_DG_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/MDD/results_MDD_DG_MDD.RDS")

plot_heatmap_multi(RNA_MDD_DG_12, RNA_MDD_DG_3, "MDD DG 12", "MDD DG 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")


Protein_MDD_DG_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
Protein_MDD_DG_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/MDD/results_MDD_DG_MDD.RDS")

plot_heatmap_multi(Protein_MDD_DG_12, Protein_MDD_DG_3, "Prot MDD DG 12", "Prot MDD DG 3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Tests/temp/")




