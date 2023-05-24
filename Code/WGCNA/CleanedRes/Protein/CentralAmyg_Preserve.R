source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/WGCNA_CleanedResProt.R")

data_CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/Protein/Proteins/CentralAmyg/Expression_Y123_residuals.RDS")


preservation(data = data_CentralAmyg,
             region = "CentralAmyg", 
             out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/CentralAmyg/", 
             power = 12)