library(bigreadr)

Annotation_Y1Y2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
Annotation_Y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

Annotation_Y1Y2$Neuronal <- Annotation_Y1Y2$ex + Annotation_Y1Y2$inhib
Annotation_Y1Y2$NonNeuronal <- Annotation_Y1Y2$Astro + Annotation_Y1Y2$Micro + Annotation_Y1Y2$Oligo + Annotation_Y1Y2$OPC + Annotation_Y1Y2$Tcell


Annotation_Y3$Neuronal <- Annotation_Y3$ex + Annotation_Y3$inhib
Annotation_Y3$NonNeuronal <- Annotation_Y3$Astro + Annotation_Y3$Micro + Annotation_Y3$Oligo + Annotation_Y3$OPC + Annotation_Y3$Tcell


saveRDS(Annotation_Y1Y2, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
saveRDS(Annotation_Y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
