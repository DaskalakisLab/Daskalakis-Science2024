source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/TempNoQSVs/VarPartY1Y2.R")
form_ancestry_est_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Tcell+Excit+Inhib+europe+africa+americas+cs_asia+e_asia+
  RIN+mitoRate+rRNA_rate+totalAssignedGene
vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y1Y2_mPFC.RDS")
info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/NewCovs/All_mPFC.RDS")
out_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_3/ancestry_estimates_all_mPFC.RDS"
varpart_Y1Y2(info=info, vall=vall, form=form_ancestry_est_all_split,out_file=out_file, multi_region=F)
