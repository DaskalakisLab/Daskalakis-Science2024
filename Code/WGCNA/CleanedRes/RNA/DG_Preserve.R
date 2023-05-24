source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/WGCNA_CleanedRes.R")

data_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/DG/Expression_Y123_residuals.RDS")


preservation(data = data_DG,
             region = "DG", 
             out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/", 
             power = 7)