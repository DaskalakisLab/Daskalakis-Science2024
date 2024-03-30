source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/metafor.R")

# MDD
meta_analyze(batch1_file="/path/to/batch1/MDD/results_MDD_CentralAmyg_MDD.RDS",
             batch2_file="/path/to/batch2/MDD/results_MDD_CentralAmyg_MDD.RDS",
             outfile="/path/to/MDD_CentralAmyg.RDS",
             type="meth")

meta_analyze(batch1_file="/path/to/batch1/MDD/results_MDD_DG_MDD.RDS",
             batch2_file="/path/to/batch2/MDD/results_MDD_DG_MDD.RDS",
             outfile="/path/to/MDD_DG.RDS",
             type="meth")

meta_analyze(batch1_file="/path/to/batch1/MDD/results_MDD_mPFC_MDD.RDS",
             batch2_file="/path/to/batch2/MDD/results_MDD_mPFC_MDD.RDS",
             outfile="/path/to/MDD_mPFC.RDS",
             type="meth")

# PTSD
meta_analyze(batch1_file="/path/to/batch1/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             batch2_file="/path/to/batch2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             outfile="/path/to/PTSD_CentralAmyg.RDS",
             type="meth")

meta_analyze(batch1_file="/path/to/batch1/PTSD/results_PTSD_DG_PTSD.RDS",
             batch2_file="/path/to/batch2/PTSD/results_PTSD_DG_PTSD.RDS",
             outfile="/path/to/PTSD_DG.RDS",
             type="meth")

meta_analyze(batch1_file="/path/to/batch1/PTSD/results_PTSD_mPFC_PTSD.RDS",
             batch2_file="/path/to/batch2/PTSD/results_PTSD_mPFC_PTSD.RDS",
             outfile="/path/to/PTSD_mPFC.RDS",
             type="meth")

# PTSD + MDD
meta_analyze(batch1_file="/path/to/batch1/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             batch2_file="/path/to/batch2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             outfile="/path/to/PTSD_MDD_CentralAmyg.RDS",
             type="meth")

meta_analyze(batch1_file="/path/to/batch1/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             batch2_file="/path/to/batch2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             outfile="/path/to/PTSD_MDD_DG.RDS",
             type="meth")

meta_analyze(batch1_file="/path/to/batch1/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             batch2_file="/path/to/batch2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             outfile="/path/to/PTSD_MDD_mPFC.RDS",
             type="meth")

# PTSD vs MDD
meta_analyze(batch1_file="/path/to/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS",
             batch2_file="/path/to/batch2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS",
             outfile="/path/to/PTSD_vs_MDD_CentralAmyg.RDS",
             type="meth")

meta_analyze(batch1_file="/path/to/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS",
             batch2_file="/path/to/batch2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS",
             outfile="/path/to/PTSD_vs_MDD_DG.RDS",
             type="meth")

meta_analyze(batch1_file="/path/to/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS",
             batch2_file="/path/to/batch2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS",
             outfile="/path/to/PTSD_vs_MDD_mPFC.RDS",
             type="meth")

