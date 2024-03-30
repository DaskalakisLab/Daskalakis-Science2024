source("/path/to/metafor.R")

# MDD
meta_analyze(batch1_file="/path/to/Proteins/batch1/MDD/results_MDD_CentralAmyg_MDD.RDS",
             batch2_file="/path/to/Proteins/batch2/MDD/results_MDD_CentralAmyg_MDD.RDS",
             outfile="/path/to/Proteins/MDD_CentralAmyg.RDS",
             type="protein")

meta_analyze(batch1_file="/path/to/Proteins/batch1/MDD/results_MDD_DG_MDD.RDS",
             batch2_file="/path/to/Proteins/batch2/MDD/results_MDD_DG_MDD.RDS",
             outfile="/path/to/Proteins/MDD_DG.RDS",
             type="protein")

meta_analyze(batch1_file="/path/to/Proteins/batch1/MDD/results_MDD_mPFC_MDD.RDS",
             batch2_file="/path/to/Proteins/batch2/MDD/results_MDD_mPFC_MDD.RDS",
             outfile="/path/to/Proteins/MDD_mPFC.RDS",
             type="protein")

# PTSD
meta_analyze(batch1_file="/path/to/Proteins/batch1/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             batch2_file="/path/to/Proteins/batch2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             outfile="/path/to/Proteins/PTSD_CentralAmyg.RDS",
             type="protein")

meta_analyze(batch1_file="/path/to/Proteins/batch1/PTSD/results_PTSD_DG_PTSD.RDS",
             batch2_file="/path/to/Proteins/batch2/PTSD/results_PTSD_DG_PTSD.RDS",
             outfile="/path/to/Proteins/PTSD_DG.RDS",
             type="protein")

meta_analyze(batch1_file="/path/to/Proteins/batch1/PTSD/results_PTSD_mPFC_PTSD.RDS",
             batch2_file="/path/to/Proteins/batch2/PTSD/results_PTSD_mPFC_PTSD.RDS",
             outfile="/path/to/Proteins/PTSD_mPFC.RDS",
             type="protein")

# PTSD + MDD
meta_analyze(batch1_file="/path/to/Proteins/batch1/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             batch2_file="/path/to/Proteins/batch2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             outfile="/path/to/Proteins/PTSD_MDD_CentralAmyg.RDS",
             type="protein")

meta_analyze(batch1_file="/path/to/Proteins/batch1/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             batch2_file="/path/to/Proteins/batch2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             outfile="/path/to/Proteins/PTSD_MDD_DG.RDS",
             type="protein")

meta_analyze(batch1_file="/path/to/Proteins/batch1/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             batch2_file="/path/to/Proteins/batch2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             outfile="/path/to/Proteins/PTSD_MDD_mPFC.RDS",
             type="protein")
