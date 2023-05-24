library(bigreadr)

ctp12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/Methylation/Y1Y2/CTPY1Y2.RDS")
anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno12 <- anno12[,names(anno12)[!(names(anno12) %in% c("NeuN_neg", "NeuN_pos"))]]

anno12 <- merge(anno12,ctp12,by=c("BrNum","Brain_Region"),all.x=T)


saveRDS(anno12,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")

rm(list=ls())

ctp3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/Methylation/Y3/CTPY3.RDS")
anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
anno3 <- anno3[,names(anno3)[!(names(anno3) %in% c("NeuN_neg", "NeuN_pos"))]]

anno3 <- merge(anno3,ctp3,by=c("BrNum","Brain_Region"),all.x=T)


saveRDS(anno3,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

