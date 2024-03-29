source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GSEA/fgsea.R")

# batch1
#################
# MDD
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/MDD/results_MDD_CentralAmyg_MDD.RDS", 
          dx = "MDD",
          region = "CentralAmyg", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/MDD/")
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/MDD/results_MDD_DG_MDD.RDS", 
          dx = "MDD",
          region = "DG", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/MDD/")
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/MDD/results_MDD_mPFC_MDD.RDS", 
          dx = "MDD",
          region = "mPFC", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/MDD/")
# PTSD
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD/results_PTSD_CentralAmyg_PTSD.RDS", 
          dx = "PTSD",
          region = "CentralAmyg", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD/")
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD/results_PTSD_DG_PTSD.RDS", 
          dx = "PTSD",
          region = "DG", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD/")
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD/results_PTSD_mPFC_PTSD.RDS", 
          dx = "PTSD",
          region = "mPFC", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD/")
# PTSD + MDD
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS", 
          dx = "PTSD_MDD",
          region = "CentralAmyg", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD_MDD/")
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS", 
          dx = "PTSD_MDD",
          region = "DG", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD_MDD/")
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS", 
          dx = "PTSD_MDD",
          region = "mPFC", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD_MDD/")
# PTSD vs MDD
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS", 
          dx = "PTSD_vs_MDD",
          region = "CentralAmyg", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD_vs_MDD/")
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS", 
          dx = "PTSD_vs_MDD",
          region = "DG", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD_vs_MDD/")
run_fgsea(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_01_19_23/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS", 
          dx = "PTSD_vs_MDD",
          region = "mPFC", 
          out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/RNA/batch1/PTSD_vs_MDD/")


