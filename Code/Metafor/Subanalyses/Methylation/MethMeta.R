source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/metafor.R")

# ChildTrauma
# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaMDD/results_MDD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaMDD/results_MDD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/MDD_CentralAmyg.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaMDD/results_MDD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaMDD/results_MDD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/MDD_DG.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaMDD/results_MDD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaMDD/results_MDD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/MDD_mPFC.RDS",
             type="meth")
# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaPTSD/results_PTSD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaPTSD/results_PTSD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/PTSD_CentralAmyg.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaPTSD/results_PTSD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaPTSD/results_PTSD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/PTSD_DG.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaPTSD/results_PTSD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaPTSD/results_PTSD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/PTSD_mPFC.RDS",
             type="meth")
# PTSD+MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/PTSD+MDD_CentralAmyg.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/PTSD+MDD_DG.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/PTSD+MDD_mPFC.RDS",
             type="meth")


###############################################################################################################################################################
# Suicide
# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicideMDD/results_MDD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicideMDD/results_MDD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/MDD_CentralAmyg.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicideMDD/results_MDD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicideMDD/results_MDD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/MDD_DG.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicideMDD/results_MDD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicideMDD/results_MDD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/MDD_mPFC.RDS",
             type="meth")
# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicidePTSD/results_PTSD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicidePTSD/results_PTSD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/PTSD_CentralAmyg.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicidePTSD/results_PTSD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicidePTSD/results_PTSD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/PTSD_DG.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicidePTSD/results_PTSD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicidePTSD/results_PTSD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/PTSD_mPFC.RDS",
             type="meth")
# PTSD+MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicidePTSD+MDD/results_PTSD+MDD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/PTSD+MDD_CentralAmyg.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicidePTSD+MDD/results_PTSD+MDD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/PTSD+MDD_DG.RDS",
             type="meth")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicidePTSD+MDD/results_PTSD+MDD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/PTSD+MDD_mPFC.RDS",
             type="meth")