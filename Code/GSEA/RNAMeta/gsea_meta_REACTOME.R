source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GSEA/fgsea.R")
# Y1Y2
#################
# MDD
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/MDD_CentralAmyg.RDS", 
               dx = "MDD",
               region = "CentralAmyg", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/MDD/")
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/MDD_DG.RDS", 
               dx = "MDD",
               region = "DG", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/MDD/")
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/MDD_mPFC.RDS", 
               dx = "MDD",
               region = "mPFC", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/MDD/")
# PTSD
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_CentralAmyg.RDS", 
               dx = "PTSD",
               region = "CentralAmyg", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD/")
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_DG.RDS", 
               dx = "PTSD",
               region = "DG", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD/")
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_mPFC.RDS", 
               dx = "PTSD",
               region = "mPFC", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD/")
# PTSD + MDD
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_MDD_CentralAmyg.RDS", 
               dx = "PTSD_MDD",
               region = "CentralAmyg", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD_MDD/")
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_MDD_DG.RDS", 
               dx = "PTSD_MDD",
               region = "DG", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD_MDD/")
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_MDD_mPFC.RDS", 
               dx = "PTSD_MDD",
               region = "mPFC", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD_MDD/")
# PTSD vs MDD
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_vs_MDD_CentralAmyg.RDS", 
               dx = "PTSD_vs_MDD",
               region = "CentralAmyg", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD_vs_MDD/")
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_vs_MDD_DG.RDS", 
               dx = "PTSD_vs_MDD",
               region = "DG", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD_vs_MDD/")
run_fgsea_meta_reactome(limma_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_vs_MDD_mPFC.RDS", 
               dx = "PTSD_vs_MDD",
               region = "mPFC", 
               out = "/data/humgen/daskalakislab/aiatrou/Science/GSEA/UPDATED_RANKING/RNAMeta/PTSD_vs_MDD/")


