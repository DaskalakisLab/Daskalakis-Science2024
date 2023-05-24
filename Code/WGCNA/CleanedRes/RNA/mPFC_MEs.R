source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/WGCNA_CleanedRes.R")

data_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/mPFC/Expression_Y123_residuals.RDS")

power_mPFC <- wgcna_control(data = data_mPFC,
                       region = "mPFC",
                       out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/")

wgcna_ptsd_mdd(data = data_mPFC,
               region = "mPFC", 
               out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/", 
               power = power_mPFC, 
               nc = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/NetworkConstruction-auto_pwr", as.character(power_mPFC), "_control.RData"))