source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/metafor.R")

# ChildTrauma
# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaMDD/results_MDD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaMDD/results_MDD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/MDD_CentralAmyg.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaMDD/results_MDD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaMDD/results_MDD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/MDD_DG.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaMDD/results_MDD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaMDD/results_MDD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/MDD_mPFC.RDS",
             type="jx")

# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaPTSD/results_PTSD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaPTSD/results_PTSD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/PTSD_CentralAmyg.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaPTSD/results_PTSD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaPTSD/results_PTSD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/PTSD_DG.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaPTSD/results_PTSD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaPTSD/results_PTSD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/PTSD_mPFC.RDS",
             type="jx")

# PTSD+MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/PTSD+MDD_CentralAmyg.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/PTSD+MDD_DG.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/PTSD+MDD_mPFC.RDS",
             type="jx")



###############################################################################################################################################################
# Suicide
# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicideMDD/results_MDD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicideMDD/results_MDD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/MDD_CentralAmyg.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicideMDD/results_MDD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicideMDD/results_MDD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/MDD_DG.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicideMDD/results_MDD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicideMDD/results_MDD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/MDD_mPFC.RDS",
             type="jx")

# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicidePTSD/results_PTSD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicidePTSD/results_PTSD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/PTSD_CentralAmyg.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicidePTSD/results_PTSD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicidePTSD/results_PTSD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/PTSD_DG.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicidePTSD/results_PTSD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicidePTSD/results_PTSD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/PTSD_mPFC.RDS",
             type="jx")

# PTSD+MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicidePTSD+MDD/results_PTSD+MDD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/PTSD+MDD_CentralAmyg.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicidePTSD+MDD/results_PTSD+MDD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/PTSD+MDD_DG.RDS",
             type="jx")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/SuicidePTSD+MDD/results_PTSD+MDD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/PTSD+MDD_mPFC.RDS",
             type="jx")



