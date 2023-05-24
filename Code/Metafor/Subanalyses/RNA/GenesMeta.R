source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/metafor.R")

# ChildTrauma
# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaMDD/results_MDD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaMDD/results_MDD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/MDD_CentralAmyg.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaMDD/results_MDD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaMDD/results_MDD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/MDD_DG.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaMDD/results_MDD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaMDD/results_MDD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/MDD_mPFC.RDS",
             type="gene")

# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaPTSD/results_PTSD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaPTSD/results_PTSD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/PTSD_CentralAmyg.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaPTSD/results_PTSD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaPTSD/results_PTSD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/PTSD_DG.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaPTSD/results_PTSD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaPTSD/results_PTSD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/PTSD_mPFC.RDS",
             type="gene")

# PTSD+MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/PTSD+MDD_CentralAmyg.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/PTSD+MDD_DG.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/PTSD+MDD_mPFC.RDS",
             type="gene")



###############################################################################################################################################################
# Suicide
# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicideMDD/results_MDD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicideMDD/results_MDD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/MDD_CentralAmyg.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicideMDD/results_MDD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicideMDD/results_MDD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/MDD_DG.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicideMDD/results_MDD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicideMDD/results_MDD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/MDD_mPFC.RDS",
             type="gene")

# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicidePTSD/results_PTSD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicidePTSD/results_PTSD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/PTSD_CentralAmyg.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicidePTSD/results_PTSD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicidePTSD/results_PTSD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/PTSD_DG.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicidePTSD/results_PTSD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicidePTSD/results_PTSD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/PTSD_mPFC.RDS",
             type="gene")

# PTSD+MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicidePTSD+MDD/results_PTSD+MDD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/PTSD+MDD_CentralAmyg.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicidePTSD+MDD/results_PTSD+MDD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/PTSD+MDD_DG.RDS",
             type="gene")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Genes/Y3/SuicidePTSD+MDD/results_PTSD+MDD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/PTSD+MDD_mPFC.RDS",
             type="gene")



