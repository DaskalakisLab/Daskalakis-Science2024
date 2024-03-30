source("/path/to/metafor_cc.R")

# MDD
meta_analyze(batch1_file="/path/to/Peptides/batch1/MDD/results_MDD_CentralAmyg_MDD.RDS",
             batch2_file="/path/to/Peptides/batch2/MDD/results_MDD_CentralAmyg_MDD.RDS",
             outfile="/path/to/Peptides/MDD_CentralAmygcc.RDS",
             type="peptide")

meta_analyze(batch1_file="/path/to/Peptides/batch1/MDD/results_MDD_DG_MDD.RDS",
             batch2_file="/path/to/Peptides/batch2/MDD/results_MDD_DG_MDD.RDS",
             outfile="/path/to/Peptides/MDD_DGcc.RDS",
             type="peptide")

meta_analyze(batch1_file="/path/to/Peptides/batch1/MDD/results_MDD_mPFC_MDD.RDS",
             batch2_file="/path/to/Peptides/batch2/MDD/results_MDD_mPFC_MDD.RDS",
             outfile="/path/to/Peptides/MDD_mPFCcc.RDS",
             type="peptide")

# PTSD
meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             outfile="/path/to/Peptides/PTSD_CentralAmygcc.RDS",
             type="peptide")

meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD/results_PTSD_DG_PTSD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD/results_PTSD_DG_PTSD.RDS",
             outfile="/path/to/Peptides/PTSD_DGcc.RDS",
             type="peptide")

meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD/results_PTSD_mPFC_PTSD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD/results_PTSD_mPFC_PTSD.RDS",
             outfile="/path/to/Peptides/PTSD_mPFCcc.RDS",
             type="peptide")

# PTSD + MDD
meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             outfile="/path/to/Peptides/PTSD_MDD_CentralAmygcc.RDS",
             type="peptide")

meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             outfile="/path/to/Peptides/PTSD_MDD_DGcc.RDS",
             type="peptide")

meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             outfile="/path/to/Peptides/PTSD_MDD_mPFCcc.RDS",
             type="peptide")

# PTSD vs MDD
meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS",
             outfile="/path/to/Peptides/PTSD_vs_MDD_CentralAmygcc.RDS",
             type="peptide")

meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS",
             outfile="/path/to/Peptides/PTSD_vs_MDD_DGcc.RDS",
             type="peptide")

meta_analyze(batch1_file="/path/to/Peptides/batch1/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS",
             batch2_file="/path/to/Peptides/batch2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS",
             outfile="/path/to/Peptides/PTSD_vs_MDD_mPFCcc.RDS",
             type="peptide")

