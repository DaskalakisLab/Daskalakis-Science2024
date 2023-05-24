source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/TempNoQSVs/VarPartY1Y2.R")

form_ancestry_est_all_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Tcell+Excit+Inhib+europe+africa+americas+cs_asia+e_asia+
  RIN+mitoRate+rRNA_rate+totalAssignedGene

vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y1Y2_all_regions.RDS")
info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/NewCovs/All_All.RDS")
out_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y1Y2_analysis_3/ancestry_estimates_all_all.RDS"
varpart_Y1Y2(info=info, vall=vall, form=form_ancestry_est_all_all,out_file=out_file, multi_region=T)
