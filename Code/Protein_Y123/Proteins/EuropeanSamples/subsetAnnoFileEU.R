# Subset EUR only best pop from Genes (three brain regions) 
# and rerun limma, correlate and report correlations

anno_y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS")
anno_y123_eur <- anno_y123[anno_y123$bestpop %in% c("eur"), ]
saveRDS(anno_y123_eur, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/EU_Annotation_Y123_updatedPCs.RDS")

