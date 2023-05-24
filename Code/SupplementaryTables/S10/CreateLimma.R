
format_res <- function(fname, out){
  df <- readRDS(fname)
  df <- df[,c("Module", "logFC", "P.Value", "adj.P.Val")]
  
  write.csv(df, out, row.names = F, quote = F)
}

format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_CeA_RNA_PTSD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD/results_PTSD_DG_PTSD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_DG_RNA_PTSD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD/results_PTSD_mPFC_PTSD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_mPFC_RNA_PTSD.csv")

format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/MDD/results_MDD_CentralAmyg_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_CeA_RNA_MDD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/MDD/results_MDD_DG_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_DG_RNA_MDD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/MDD/results_MDD_mPFC_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_mPFC_RNA_MDD.csv")

format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_MDD/results_PTSD_MDD_CentralAmyg_PTSD_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_CeA_RNA_PTSD_MDD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_MDD/results_PTSD_MDD_DG_PTSD_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_DG_RNA_PTSD_MDD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_mPFC_RNA_PTSD_MDD.csv")


format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_CeA_Protein_PTSD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD/results_PTSD_DG_PTSD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_DG_Protein_PTSD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD/results_PTSD_mPFC_PTSD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_mPFC_Protein_PTSD.csv")

format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD/results_MDD_CentralAmyg_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_CeA_Protein_MDD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD/results_MDD_DG_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_DG_Protein_MDD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD/results_MDD_mPFC_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_mPFC_Protein_MDD.csv")

format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD/results_PTSD_MDD_CentralAmyg_PTSD_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_CeA_Protein_PTSD_MDD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD/results_PTSD_MDD_DG_PTSD_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_DG_Protein_PTSD_MDD.csv")
format_res("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS",
           "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/Limma_mPFC_Protein_PTSD_MDD.csv")

