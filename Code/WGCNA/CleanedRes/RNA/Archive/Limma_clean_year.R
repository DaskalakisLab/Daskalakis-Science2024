region <- "mPFC"

limma_wrapper(
  anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
  expr_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/mPFC_clean_year/ME_PTSD.RDS",
  covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
  contrast_var = "PTSD",
  analysis = "PTSD",
  region = region,
  out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/clean_year/PTSD/"
)
limma_wrapper(
  anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
  expr_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/mPFC_clean_year/ME_MDD.RDS",
  covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
  contrast_var = "MDD",
  analysis = "MDD",
  region = region,
  out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/clean_year/MDD/"
)
limma_wrapper(
  anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
  expr_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/mPFC_clean_year/ME_PTSD_MDD.RDS",
  covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
  contrast_var = "PTSD_MDD",
  analysis = "PTSD_MDD",
  region = region,
  out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/clean_year/PTSD_MDD/"
)
limma_wrapper(
  anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS",
  expr_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/MEsForLimma/mPFC_clean_year/ME_PTSD_vs_MDD.RDS",
  covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
  contrast_var = "PTSD",
  analysis = "PTSD_vs_MDD",
  region = region,
  out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/clean_year/PTSD_vs_MDD/"
)