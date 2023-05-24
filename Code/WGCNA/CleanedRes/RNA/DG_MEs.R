source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/WGCNA_CleanedRes.R")

data_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/DG/Expression_Y123_residuals.RDS")

power_DG <- wgcna_control(data = data_DG,
                          region = "DG",
                          out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/")

wgcna_ptsd_mdd(data = data_DG,
               region = "DG", 
               out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/", 
               power = power_DG, 
               nc = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/NetworkConstruction-auto_pwr", as.character(power_DG), "_control.RData"))