Y3_Amygdala <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_Amygdala.RDS")
Y3_Hippocampus <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_Hippocampus.RDS")
Y3_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_mPFC.RDS")

pdf(file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_Amygdala_meanSDplot.pdf",
    width = 15,height = 10)
replayPlot(Y3_Amygdala$meanSDplots)
dev.off()

pdf(file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_Hippocampus_meanSDplot.pdf",
    width = 15,height = 10)
replayPlot(Y3_Hippocampus$meanSDplots)
dev.off()

pdf(file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_mPFC_meanSDplot.pdf",
    width = 15,height = 10)
replayPlot(Y3_mPFC$meanSDplots)
dev.off()
