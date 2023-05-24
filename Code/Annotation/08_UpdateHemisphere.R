library(bigreadr)

bl <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/BrainLaterality/BrainLaterality.RDS")

Annotation_Y1Y2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
Annotation_Y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

bl <- bl[,c("BrNum", "Brain_Region", "Hemisphere")]

Annotation_Y1Y2 <- merge(Annotation_Y1Y2, bl, by=c("BrNum", "Brain_Region"), all.x=T)
Annotation_Y3 <- merge(Annotation_Y3, bl, by=c("BrNum", "Brain_Region"), all.x=T)

saveRDS(Annotation_Y1Y2, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
saveRDS(Annotation_Y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
