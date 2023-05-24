source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/WGCNA_CleanedRes.R")

data_CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/CentralAmyg/Expression_Y123_residuals.RDS")

power_CentralAmyg <- wgcna_control(data = data_CentralAmyg,
                                   region = "CentralAmyg",
                                   out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/")

wgcna_ptsd_mdd(data = data_CentralAmyg,
               region = "CentralAmyg", 
               out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/", 
               power = power_CentralAmyg, 
               nc = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/NetworkConstruction-auto_pwr", as.character(power_CentralAmyg), "_control.RData"))