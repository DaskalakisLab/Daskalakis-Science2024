#library(remotes)
#remotes::install_github("RRHO2/RRHO2")
library(RRHO2)

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
  
  print(identical(df1$gene, df2$gene))
  
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

# RNA Sex Specific
PTSD_CentralAmyg_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
PTSD_DG_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
PTSD_mPFC_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")

PTSD_CentralAmyg_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_Male/results_PTSD_CentralAmyg_PTSD.RDS")
PTSD_DG_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_Male/results_PTSD_DG_PTSD.RDS")
PTSD_mPFC_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_Male/results_PTSD_mPFC_PTSD.RDS")

PTSD_CentralAmyg_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_Female/results_PTSD_CentralAmyg_PTSD.RDS")
PTSD_DG_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_Female/results_PTSD_DG_PTSD.RDS")
PTSD_mPFC_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_Female/results_PTSD_mPFC_PTSD.RDS")


plot_heatmap_multi(PTSD_CentralAmyg_RNA, PTSD_CentralAmyg_RNA_male, "PTSD Central Amygdala Baseline", "PTSD Central Amygdala Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_CA_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_CentralAmyg_RNA, PTSD_CentralAmyg_RNA_female, "PTSD Central Amygdala Baseline", "PTSD Central Amygdala Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_CA_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_CentralAmyg_RNA_male, PTSD_CentralAmyg_RNA_female, "PTSD Central Amygdala Male", "PTSD Central Amygdala Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_CA_Male_vs_Female.pdf")

plot_heatmap_multi(PTSD_DG_RNA, PTSD_DG_RNA_male, "PTSD DG Baseline", "PTSD DG Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_DG_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_DG_RNA, PTSD_DG_RNA_female, "PTSD DG Baseline", "PTSD DG Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_DG_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_DG_RNA_male, PTSD_DG_RNA_female, "PTSD DG Male", "PTSD DG Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_DG_Male_vs_Female.pdf")

plot_heatmap_multi(PTSD_mPFC_RNA, PTSD_mPFC_RNA_male, "PTSD mPFC Baseline", "PTSD mPFC Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_mPFC_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_mPFC_RNA, PTSD_mPFC_RNA_female, "PTSD mPFC Baseline", "PTSD mPFC Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_mPFC_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_mPFC_RNA_male, PTSD_mPFC_RNA_female, "PTSD mPFC Male", "PTSD mPFC Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_mPFC_Male_vs_Female.pdf")








MDD_CentralAmyg_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
MDD_DG_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
MDD_mPFC_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")

MDD_CentralAmyg_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/MDD_Male/results_MDD_CentralAmyg_MDD.RDS")
MDD_DG_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/MDD_Male/results_MDD_DG_MDD.RDS")
MDD_mPFC_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/MDD_Male/results_MDD_mPFC_MDD.RDS")

MDD_CentralAmyg_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/MDD_Female/results_MDD_CentralAmyg_MDD.RDS")
MDD_DG_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/MDD_Female/results_MDD_DG_MDD.RDS")
MDD_mPFC_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/MDD_Female/results_MDD_mPFC_MDD.RDS")


plot_heatmap_multi(MDD_CentralAmyg_RNA, MDD_CentralAmyg_RNA_male, "MDD Central Amygdala Baseline", "MDD Central Amygdala Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_CA_Baseline_vs_Male.pdf")
plot_heatmap_multi(MDD_CentralAmyg_RNA, MDD_CentralAmyg_RNA_female, "MDD Central Amygdala Baseline", "MDD Central Amygdala Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_CA_Baseline_vs_Female.pdf")
plot_heatmap_multi(MDD_CentralAmyg_RNA_male, MDD_CentralAmyg_RNA_female, "MDD Central Amygdala Male", "MDD Central Amygdala Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_CA_Male_vs_Female.pdf")

plot_heatmap_multi(MDD_DG_RNA, MDD_DG_RNA_male, "MDD DG Baseline", "MDD DG Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_DG_Baseline_vs_Male.pdf")
plot_heatmap_multi(MDD_DG_RNA, MDD_DG_RNA_female, "MDD DG Baseline", "MDD DG Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_DG_Baseline_vs_Female.pdf")
plot_heatmap_multi(MDD_DG_RNA_male, MDD_DG_RNA_female, "MDD DG Male", "MDD DG Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_DG_Male_vs_Female.pdf")

plot_heatmap_multi(MDD_mPFC_RNA, MDD_mPFC_RNA_male, "MDD mPFC Baseline", "MDD mPFC Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_mPFC_Baseline_vs_Male.pdf")
plot_heatmap_multi(MDD_mPFC_RNA, MDD_mPFC_RNA_female, "MDD mPFC Baseline", "MDD mPFC Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_mPFC_Baseline_vs_Female.pdf")
plot_heatmap_multi(MDD_mPFC_RNA_male, MDD_mPFC_RNA_female, "MDD mPFC Male", "MDD mPFC Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/MDD_mPFC_Male_vs_Female.pdf")









PTSD_MDD_CentralAmyg_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
PTSD_MDD_DG_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
PTSD_MDD_mPFC_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")

PTSD_MDD_CentralAmyg_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_MDD_Male/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
PTSD_MDD_DG_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_MDD_Male/results_PTSD+MDD_DG_PTSD_MDD.RDS")
PTSD_MDD_mPFC_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_MDD_Male/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")

PTSD_MDD_CentralAmyg_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_MDD_Female/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
PTSD_MDD_DG_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_MDD_Female/results_PTSD+MDD_DG_PTSD_MDD.RDS")
PTSD_MDD_mPFC_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_MDD_Female/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")


plot_heatmap_multi(PTSD_MDD_CentralAmyg_RNA, PTSD_MDD_CentralAmyg_RNA_male, "PTSD+MDD Central Amygdala Baseline", "PTSD+MDD Central Amygdala Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_CA_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_MDD_CentralAmyg_RNA, PTSD_MDD_CentralAmyg_RNA_female, "PTSD+MDD Central Amygdala Baseline", "PTSD+MDD Central Amygdala Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_CA_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_MDD_CentralAmyg_RNA_male, PTSD_MDD_CentralAmyg_RNA_female, "PTSD+MDD Central Amygdala Male", "PTSD+MDD Central Amygdala Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_CA_Male_vs_Female.pdf")

plot_heatmap_multi(PTSD_MDD_DG_RNA, PTSD_MDD_DG_RNA_male, "PTSD+MDD DG Baseline", "PTSD+MDD DG Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_DG_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_MDD_DG_RNA, PTSD_MDD_DG_RNA_female, "PTSD+MDD DG Baseline", "PTSD+MDD DG Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_DG_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_MDD_DG_RNA_male, PTSD_MDD_DG_RNA_female, "PTSD+MDD DG Male", "PTSD+MDD DG Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_DG_Male_vs_Female.pdf")

plot_heatmap_multi(PTSD_MDD_mPFC_RNA, PTSD_MDD_mPFC_RNA_male, "PTSD+MDD mPFC Baseline", "PTSD+MDD mPFC Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_mPFC_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_MDD_mPFC_RNA, PTSD_MDD_mPFC_RNA_female, "PTSD+MDD mPFC Baseline", "PTSD+MDD mPFC Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_mPFC_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_MDD_mPFC_RNA_male, PTSD_MDD_mPFC_RNA_female, "PTSD+MDD mPFC Male", "PTSD+MDD mPFC Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD+MDD_mPFC_Male_vs_Female.pdf")








PTSD_vs_MDD_CentralAmyg_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
PTSD_vs_MDD_DG_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")
PTSD_vs_MDD_mPFC_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")

PTSD_vs_MDD_CentralAmyg_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_vs_MDD_Male/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
PTSD_vs_MDD_DG_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_vs_MDD_Male/results_PTSD_vs_MDD_DG_PTSD.RDS")
PTSD_vs_MDD_mPFC_RNA_male <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_vs_MDD_Male/results_PTSD_vs_MDD_mPFC_PTSD.RDS")

PTSD_vs_MDD_CentralAmyg_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_vs_MDD_Female/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
PTSD_vs_MDD_DG_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_vs_MDD_Female/results_PTSD_vs_MDD_DG_PTSD.RDS")
PTSD_vs_MDD_mPFC_RNA_female <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/SexSpecific/Y1Y2/PTSD_vs_MDD_Female/results_PTSD_vs_MDD_mPFC_PTSD.RDS")


plot_heatmap_multi(PTSD_vs_MDD_CentralAmyg_RNA, PTSD_vs_MDD_CentralAmyg_RNA_male, "PTSD vs MDD Central Amygdala Baseline", "PTSD vs MDD Central Amygdala Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_CA_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_vs_MDD_CentralAmyg_RNA, PTSD_vs_MDD_CentralAmyg_RNA_female, "PTSD vs MDD Central Amygdala Baseline", "PTSD vs MDD Central Amygdala Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_CA_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_vs_MDD_CentralAmyg_RNA_male, PTSD_vs_MDD_CentralAmyg_RNA_female, "PTSD vs MDD Central Amygdala Male", "PTSD vs MDD Central Amygdala Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_CA_Male_vs_Female.pdf")

plot_heatmap_multi(PTSD_vs_MDD_DG_RNA, PTSD_vs_MDD_DG_RNA_male, "PTSD vs MDD DG Baseline", "PTSD vs MDD DG Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_DG_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_vs_MDD_DG_RNA, PTSD_vs_MDD_DG_RNA_female, "PTSD vs MDD DG Baseline", "PTSD vs MDD DG Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_DG_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_vs_MDD_DG_RNA_male, PTSD_vs_MDD_DG_RNA_female, "PTSD vs MDD DG Male", "PTSD vs MDD DG Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_DG_Male_vs_Female.pdf")

plot_heatmap_multi(PTSD_vs_MDD_mPFC_RNA, PTSD_vs_MDD_mPFC_RNA_male, "PTSD vs MDD mPFC Baseline", "PTSD vs MDD mPFC Male", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_mPFC_Baseline_vs_Male.pdf")
plot_heatmap_multi(PTSD_vs_MDD_mPFC_RNA, PTSD_vs_MDD_mPFC_RNA_female, "PTSD vs MDD mPFC Baseline", "PTSD vs MDD mPFC Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_mPFC_Baseline_vs_Female.pdf")
plot_heatmap_multi(PTSD_vs_MDD_mPFC_RNA_male, PTSD_vs_MDD_mPFC_RNA_female, "PTSD vs MDD mPFC Male", "PTSD vs MDD mPFC Female", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/SexSpecific/Y1Y2/PTSD_vs_MDD_mPFC_Male_vs_Female.pdf")




