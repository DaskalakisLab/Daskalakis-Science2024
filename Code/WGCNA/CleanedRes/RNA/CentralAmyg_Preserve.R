source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/WGCNA_CleanedRes.R")

data_CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/CentralAmyg/Expression_Y123_residuals.RDS")


preservation(data = data_CentralAmyg,
             region = "CentralAmyg", 
             out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/", 
             power = 12)