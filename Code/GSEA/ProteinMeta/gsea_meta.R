source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GSEA/fgsea.R")
# Y1Y2
#################
# MDD
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/MDD_CentralAmyg.RDS", 
               dx = "MDD",
               region = "CentralAmyg", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/MDD/")
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/MDD_DG.RDS", 
               dx = "MDD",
               region = "DG", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/MDD/")
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/MDD_mPFC.RDS", 
               dx = "MDD",
               region = "mPFC", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/MDD/")
# PTSD
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_CentralAmyg.RDS", 
               dx = "PTSD",
               region = "CentralAmyg", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD/")
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_DG.RDS", 
               dx = "PTSD",
               region = "DG", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD/")
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_mPFC.RDS", 
               dx = "PTSD",
               region = "mPFC", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD/")
# PTSD + MDD
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_MDD_CentralAmyg.RDS", 
               dx = "PTSD_MDD",
               region = "CentralAmyg", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD_MDD/")
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_MDD_DG.RDS", 
               dx = "PTSD_MDD",
               region = "DG", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD_MDD/")
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_MDD_mPFC.RDS", 
               dx = "PTSD_MDD",
               region = "mPFC", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD_MDD/")
# PTSD vs MDD
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_vs_MDD_CentralAmyg.RDS", 
               dx = "PTSD_vs_MDD",
               region = "CentralAmyg", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD_vs_MDD/")
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_vs_MDD_DG.RDS", 
               dx = "PTSD_vs_MDD",
               region = "DG", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD_vs_MDD/")
run_fgsea_meta(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/PTSD_vs_MDD_mPFC.RDS", 
               dx = "PTSD_vs_MDD",
               region = "mPFC", 
               out = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GSEA/UPDATED_RANKING/ProteinMeta/PTSD_vs_MDD/")


