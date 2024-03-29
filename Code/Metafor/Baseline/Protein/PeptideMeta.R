source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/metafor_cc.R")

# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/MDD_CentralAmygcc.RDS",
             type="peptide")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/MDD/results_MDD_DG_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/MDD/results_MDD_DG_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/MDD_DGcc.RDS",
             type="peptide")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/MDD/results_MDD_mPFC_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/MDD_mPFCcc.RDS",
             type="peptide")

# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_CentralAmygcc.RDS",
             type="peptide")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD/results_PTSD_DG_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_DGcc.RDS",
             type="peptide")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_mPFCcc.RDS",
             type="peptide")

# PTSD + MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_MDD_CentralAmygcc.RDS",
             type="peptide")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_MDD_DGcc.RDS",
             type="peptide")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_MDD_mPFCcc.RDS",
             type="peptide")

# PTSD vs MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_vs_MDD_CentralAmygcc.RDS",
             type="peptide")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_vs_MDD_DGcc.RDS",
             type="peptide")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/PTSD_vs_MDD_mPFCcc.RDS",
             type="peptide")

