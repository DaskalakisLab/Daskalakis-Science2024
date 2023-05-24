source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/WGCNA_CleanedResProt.R")

data_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/Protein/Proteins/DG/Expression_Y123_residuals.RDS")

power_DG <- wgcna_control(data = data_DG,
                          region = "DG",
                          out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/")

wgcna_ptsd_mdd(data = data_DG,
               region = "DG", 
               out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/", 
               power = power_DG, 
               nc = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/NetworkConstruction-auto_pwr", as.character(power_DG), "_control.RData"))
