source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/WGCNA_CleanedRes.R")

data_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/mPFC/Expression_Y123_residuals.RDS")


preservation(data = data_mPFC,
             region = "mPFC", 
             out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/", 
             power = 12)