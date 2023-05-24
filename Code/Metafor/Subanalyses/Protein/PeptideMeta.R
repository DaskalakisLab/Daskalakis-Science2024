source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/metafor.R")

# ChildTrauma
# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaMDD/results_MDD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaMDD/results_MDD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/MDD_CentralAmyg.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaMDD/results_MDD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaMDD/results_MDD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/MDD_DG.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaMDD/results_MDD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaMDD/results_MDD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/MDD_mPFC.RDS",
             type="peptide")
# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaPTSD/results_PTSD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaPTSD/results_PTSD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/PTSD_CentralAmyg.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaPTSD/results_PTSD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaPTSD/results_PTSD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/PTSD_DG.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaPTSD/results_PTSD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaPTSD/results_PTSD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/PTSD_mPFC.RDS",
             type="peptide")
# PTSD+MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_CentralAmyg_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_CentralAmyg_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/PTSD+MDD_CentralAmyg.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_DG_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_DG_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/PTSD+MDD_DG.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/ChildTraumaPTSD+MDD/results_PTSD+MDD_mPFC_ChildTrauma012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/ChildTraumaPTSD+MDD/results_PTSD+MDD_mPFC_ChildTrauma012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/PTSD+MDD_mPFC.RDS",
             type="peptide")




###############################################################################################################################################################
# Suicide
# MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicideMDD/results_MDD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicideMDD/results_MDD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/MDD_CentralAmyg.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicideMDD/results_MDD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicideMDD/results_MDD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/MDD_DG.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicideMDD/results_MDD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicideMDD/results_MDD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/MDD_mPFC.RDS",
             type="peptide")
# PTSD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicidePTSD/results_PTSD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicidePTSD/results_PTSD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/PTSD_CentralAmyg.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicidePTSD/results_PTSD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicidePTSD/results_PTSD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/PTSD_DG.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicidePTSD/results_PTSD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicidePTSD/results_PTSD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/PTSD_mPFC.RDS",
             type="peptide")
# PTSD+MDD
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_CentralAmyg_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicidePTSD+MDD/results_PTSD+MDD_CentralAmyg_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/PTSD+MDD_CentralAmyg.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_DG_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicidePTSD+MDD/results_PTSD+MDD_DG_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/PTSD+MDD_DG.RDS",
             type="peptide")
meta_analyze(y1y2_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y1Y2/SuicidePTSD+MDD/results_PTSD+MDD_mPFC_Suicide012.RDS",
             y3_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Peptides/Y3/SuicidePTSD+MDD/results_PTSD+MDD_mPFC_Suicide012.RDS",
             outfile="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/PTSD+MDD_mPFC.RDS",
             type="peptide")





