Annotation_231 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")
Annotation_sc48 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS")

Annotation_sc48$PTSD_MDD <- Annotation_sc48$PTSD+Annotation_sc48$MDD
Annotation_231$PTSD_MDD <- Annotation_231$PTSD+Annotation_231$MDD

saveRDS(Annotation_231,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")
saveRDS(Annotation_sc48,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS")
