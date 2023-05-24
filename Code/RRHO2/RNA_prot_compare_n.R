plot_heatmap_multi <- function(df1, df2, l1, l2, type){
  print(l1)
  
  names(df1)[names(df1)=="protein"] <- "gene"
  names(df2)[names(df2)=="protein"] <- "gene"
  
  df <- data.frame(analysis=l1, region=l2, type=type, 
                   n_nomy1y2=nrow(df1[df1$P.Value < 0.05,]),
                   n_nomy3=nrow(df2[df2$P.Value < 0.05,]),
                   n_fdry1y2=nrow(df1[df1$adj.P.Val < 0.05,]),
                   n_fdry3=nrow(df2[df2$adj.P.Val < 0.05,]))
  # print(nrow(df1[df1$P.Value < 0.05,]))
  # print(nrow(df1[df1$adj.P.Val < 0.05,]))
  # 
  # print(nrow(df2[df2$P.Value < 0.05,]))
  # print(nrow(df2[df2$adj.P.Val < 0.05,]))
  return(df)
}
#mPFC
RNA_PTSD_mPFC_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
RNA_PTSD_mPFC_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")
df <- plot_heatmap_multi(RNA_PTSD_mPFC_12, RNA_PTSD_mPFC_3, "PTSD", "mPFC", "RNA")


Protein_PTSD_mPFC_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
Protein_PTSD_mPFC_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")
df <- rbind(df, plot_heatmap_multi(Protein_PTSD_mPFC_12, Protein_PTSD_mPFC_3, "PTSD", "mPFC", "Protein"))


RNA_MDD_mPFC_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
RNA_MDD_mPFC_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/MDD/results_MDD_mPFC_MDD.RDS")
df <- rbind(df, plot_heatmap_multi(RNA_MDD_mPFC_12, RNA_MDD_mPFC_3, "MDD", "mPFC", "RNA"))


Protein_MDD_mPFC_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
Protein_MDD_mPFC_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/MDD/results_MDD_mPFC_MDD.RDS")
df <- rbind(df, plot_heatmap_multi(Protein_MDD_mPFC_12, Protein_MDD_mPFC_3, "MDD", "mPFC", "Protein"))


#DG
RNA_PTSD_DG_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
RNA_PTSD_DG_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/PTSD/results_PTSD_DG_PTSD.RDS")
df <- rbind(df, plot_heatmap_multi(RNA_PTSD_DG_12, RNA_PTSD_DG_3, "PTSD", "DG", "RNA"))


Protein_PTSD_DG_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
Protein_PTSD_DG_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/PTSD/results_PTSD_DG_PTSD.RDS")
df <- rbind(df, plot_heatmap_multi(Protein_PTSD_DG_12, Protein_PTSD_DG_3, "PTSD", "DG", "Protein"))


RNA_MDD_DG_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
RNA_MDD_DG_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/MDD/results_MDD_DG_MDD.RDS")
df <- rbind(df, plot_heatmap_multi(RNA_MDD_DG_12, RNA_MDD_DG_3, "MDD", "DG", "RNA"))


Protein_MDD_DG_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
Protein_MDD_DG_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/MDD/results_MDD_DG_MDD.RDS")
df <- rbind(df, plot_heatmap_multi(Protein_MDD_DG_12, Protein_MDD_DG_3, "MDD", "DG", "Protein"))

#CA
RNA_PTSD_CentralAmyg_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
RNA_PTSD_CentralAmyg_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
df <- rbind(df, plot_heatmap_multi(RNA_PTSD_CentralAmyg_12, RNA_PTSD_CentralAmyg_3, "PTSD", "CentralAmyg", "RNA"))


Protein_PTSD_CentralAmyg_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
Protein_PTSD_CentralAmyg_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
df <- rbind(df, plot_heatmap_multi(Protein_PTSD_CentralAmyg_12, Protein_PTSD_CentralAmyg_3, "PTSD", "CentralAmyg", "Protein"))


RNA_MDD_CentralAmyg_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
RNA_MDD_CentralAmyg_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")
df <- rbind(df, plot_heatmap_multi(RNA_MDD_CentralAmyg_12, RNA_MDD_CentralAmyg_3, "MDD", "CentralAmyg", "RNA"))


Protein_MDD_CentralAmyg_12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
Protein_MDD_CentralAmyg_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_01_05_23/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")
df <- rbind(df, plot_heatmap_multi(Protein_MDD_CentralAmyg_12, Protein_MDD_CentralAmyg_3, "MDD", "CentralAmyg", "Protein"))