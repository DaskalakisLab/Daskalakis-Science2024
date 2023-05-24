library(ggplot2)

anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
ctps12 <- anno12[,c("BrNum","Brain_Region","AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","overallMapRate","ancestryPC3")]

#"AgeDeath","Sex","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","overallMapRate","ancestryPC3"

rownames(ctps12) <- paste0(ctps12$BrNum, "_", ctps12$Brain_Region)


ctps12_ca <- ctps12[ctps12$Brain_Region=="CentralAmyg",]
ctps12_ca <- ctps12_ca[,c("AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","overallMapRate","ancestryPC3")]

ctps12_dg <- ctps12[ctps12$Brain_Region=="DG",]
ctps12_dg <- ctps12_dg[,c("AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","overallMapRate","ancestryPC3")]

ctps12_mpfc <- ctps12[ctps12$Brain_Region=="mPFC",]
ctps12_mpfc <- ctps12_mpfc[,c("AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","overallMapRate","ancestryPC3")]

library(Matrix)
rankMatrix(ctps12_ca)
rankMatrix(ctps12_dg)
rankMatrix(ctps12_mpfc)



rm(list=ls())





anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
ctps12 <- anno12[,c("BrNum","Brain_Region","AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","ancestryPC3","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5")]

#"AgeDeath","Sex","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","overallMapRate","ancestryPC3"

rownames(ctps12) <- paste0(ctps12$BrNum, "_", ctps12$Brain_Region)


ctps12_ca <- ctps12[ctps12$Brain_Region=="CentralAmyg",]
ctps12_ca <- ctps12_ca[,c("AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","ancestryPC3","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5")]

ctps12_dg <- ctps12[ctps12$Brain_Region=="DG",]
ctps12_dg <- ctps12_dg[,c("AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","ancestryPC3","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5")]

ctps12_mpfc <- ctps12[ctps12$Brain_Region=="mPFC",]
ctps12_mpfc <- ctps12_mpfc[,c("AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","ancestryPC3","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5")]


rm(list=ls())





anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
#ctps12 <- anno12[,c("BrNum","Brain_Region","AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","ancestryPC3","Smoking","Meth_PC1","Meth_PC2","Meth_PC3","Meth_PC4","Meth_PC5")]
ctps12 <- anno12[,c("BrNum","Brain_Region","AgeDeath","Male","PMI","PTSD","MDD","NeuN_neg","NeuN_pos","ancestryPC1","ancestryPC2","ancestryPC3","Smoking","Meth_PC1","Meth_PC2","Meth_PC3","Meth_PC4","Meth_PC5")]

#"AgeDeath","Sex","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","mitoMapped","overallMapRate","ancestryPC3"

rownames(ctps12) <- paste0(ctps12$BrNum, "_", ctps12$Brain_Region)


ctps12_ca <- ctps12[ctps12$Brain_Region=="CentralAmyg",]
#ctps12_ca <- ctps12_ca[,c("AgeDeath","Male","PMI","PTSD","MDD","ex","inhib","Astro","Micro","Oligo","OPC","Tcell","ancestryPC1","ancestryPC2","ancestryPC3","Smoking","Meth_PC1","Meth_PC2","Meth_PC3","Meth_PC4","Meth_PC5")]
ctps12_ca <- ctps12_ca[,c("AgeDeath","Male","PMI","PTSD","MDD","NeuN_neg","NeuN_pos","ancestryPC1","ancestryPC2","ancestryPC3","Smoking","Meth_PC1","Meth_PC2","Meth_PC3","Meth_PC4","Meth_PC5")]
ctps12_ca <- ctps12_ca[!(is.na(ctps12_ca$Meth_PC1)),]

ctps12_dg <- ctps12[ctps12$Brain_Region=="DG",]
ctps12_dg <- ctps12_dg[,c("AgeDeath","Male","PMI","PTSD","MDD","NeuN_neg","NeuN_pos","ancestryPC1","ancestryPC2","ancestryPC3","Smoking","Meth_PC1","Meth_PC2","Meth_PC3","Meth_PC4","Meth_PC5")]
ctps12_dg <- ctps12_dg[!(is.na(ctps12_dg$Meth_PC1)),]

ctps12_mpfc <- ctps12[ctps12$Brain_Region=="mPFC",]
ctps12_mpfc <- ctps12_mpfc[,c("AgeDeath","Male","PMI","PTSD","MDD","NeuN_neg","NeuN_pos","ancestryPC1","ancestryPC2","ancestryPC3","Smoking","Meth_PC1","Meth_PC2","Meth_PC3","Meth_PC4","Meth_PC5")]
ctps12_mpfc <- ctps12_mpfc[!(is.na(ctps12_mpfc$Meth_PC1)),]

library(Matrix)
rankMatrix(ctps12_ca)
rankMatrix(ctps12_dg)
rankMatrix(ctps12_mpfc)
