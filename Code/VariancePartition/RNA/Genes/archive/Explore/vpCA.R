source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/Genes/TempNoQSVs/VarPartY1Y2.R")

form_ancestry_est_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Tcell+Excit+Inhib+europe+africa+americas+cs_asia+e_asia+
  RIN+mitoRate+rRNA_rate+totalAssignedGene+Psychosis+Smoking+Delusions+Hallucinations+`Past Self Mutilation`+Flashbacks+`Intrusive thoughts`+(1|`Manner Of Death`)+
  `Lifetime Anticonvulsant`+`Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`

vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Voom_Y1Y2_CentralAmyg.RDS")
info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/NewCovs/InfoFiles/Y1Y2/All_CentralAmyg.RDS")
out_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/NewCovs/VarPartFiles/Y1Y2/ae_all_CentralAmyg.RDS"
varpart_Y1Y2(info=info, vall=vall, form=form_ancestry_est_all_split,out_file=out_file, multi_region=F)
