library(dplyr)
library(reshape2)

voomCA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoomCentralAmyg.RDS")
mat <- as.data.frame(voomCA$E)

meta_data <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS") 
meta_data <- meta_data[meta_data$Brain_Region=="CentralAmyg",]
meta_data <- meta_data[c("SampleID","BrNum","PTSD","MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","ancestryPC3","inhib","ex","Oligo","Astro","Micro","OPC","Tcell","mitoMapped","overallMapRate")]

mat <- mat[,meta_data$SampleID]


pc <- prcomp(t(mat))
source("/data/humgen/daskalakislab/aiatrou/AJP/anovaDF.R")
source("/data/humgen/daskalakislab/aiatrou/AJP/eigenVariable.R")
pcTECH <- eigenVariable(pc$x[,1:5], meta_data)
p <- plot(pcTECH$plot)
ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/PCA/plots/rnaCAY1Y2_ctp7.pdf",
       plot=p,
       device="pdf",
       height=10,
       width=5)
#pdf(paste0("~/Dropbox (Partners HealthCare)/Galen_SleepDeprivation/GSEAResults/GO/", outfile, "_gsea_go.pdf"), width = 12, height = 10)
#p2
#dev.off()
rm(list=ls())

voomDG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoomDG.RDS")
mat <- as.data.frame(voomDG$E)

meta_data <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS") 
meta_data <- meta_data[meta_data$Brain_Region=="DG",]
meta_data <- meta_data[c("SampleID","BrNum","PTSD","MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","ancestryPC3","inhib","ex","Oligo","Astro","Micro","OPC","Tcell","mitoMapped","overallMapRate")]

mat <- mat[,meta_data$SampleID]


pc <- prcomp(t(mat))
source("/data/humgen/daskalakislab/aiatrou/AJP/anovaDF.R")
source("/data/humgen/daskalakislab/aiatrou/AJP/eigenVariable.R")
pcTECH <- eigenVariable(pc$x[,1:5], meta_data)
p <- plot(pcTECH$plot)
ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/PCA/plots/rnaDGY1Y2_ctp7.pdf",
       plot=p,
       device="pdf",
       height=10,
       width=5)


rm(list=ls())

voommPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoommPFC.RDS")
mat <- as.data.frame(voommPFC$E)

meta_data <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS") 
meta_data <- meta_data[meta_data$Brain_Region=="mPFC",]
meta_data <- meta_data[c("SampleID","BrNum","PTSD","MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","ancestryPC3","inhib","ex","Oligo","Astro","Micro","OPC","Tcell","mitoMapped","overallMapRate")]

mat <- mat[,meta_data$SampleID]


pc <- prcomp(t(mat))
source("/data/humgen/daskalakislab/aiatrou/AJP/anovaDF.R")
source("/data/humgen/daskalakislab/aiatrou/AJP/eigenVariable.R")
pcTECH <- eigenVariable(pc$x[,1:5], meta_data)
p <- plot(pcTECH$plot)
ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/PCA/plots/rnamPFCY1Y2_ctp7.pdf",
       plot=p,
       device="pdf",
       height=10,
       width=5)

