Y1Y2_Amygdala <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Proteins/Y1Y2_Amygdala.RDS")
Y1Y2_Hippocampus <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Proteins/Y1Y2_Hippocampus.RDS")
Y1Y2_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Proteins/Y1Y2_mPFC.RDS")

pdf(file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Proteins/Y1Y2_Amygdala_meanSDplot.pdf",
     width = 15,height = 10)
replayPlot(Y1Y2_Amygdala$meanSDplots)
dev.off()

pdf(file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Proteins/Y1Y2_Hippocampus_meanSDplot.pdf",
    width = 15,height = 10)
replayPlot(Y1Y2_Hippocampus$meanSDplots)
dev.off()

pdf(file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Proteins/Y1Y2_mPFC_meanSDplot.pdf",
    width = 15,height = 10)
replayPlot(Y1Y2_mPFC$meanSDplots)
dev.off()