source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/metafor.R")

# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/MDD_CentralAmyg.RDS",
             type="meth")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/MDD/results_MDD_DG_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/MDD/results_MDD_DG_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/MDD_DG.RDS",
             type="meth")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/MDD/results_MDD_mPFC_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/MDD_mPFC.RDS",
             type="meth")

# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_CentralAmyg.RDS",
             type="meth")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD/results_PTSD_DG_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_DG.RDS",
             type="meth")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_mPFC.RDS",
             type="meth")

# PTSD + MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_MDD_CentralAmyg.RDS",
             type="meth")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_MDD_DG.RDS",
             type="meth")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_MDD_mPFC.RDS",
             type="meth")

# PTSD vs MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_vs_MDD_CentralAmyg.RDS",
             type="meth")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_vs_MDD_DG.RDS",
             type="meth")

meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/PTSD_vs_MDD_mPFC.RDS",
             type="meth")

