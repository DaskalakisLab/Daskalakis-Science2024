anno123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS")

prepare_norm <- function(norm, anno){

  batch_designs123 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/batch_designs_Y1Y2Y3.RDS")
  
  library(dplyr)
  # Find BrNums with more than 3 replicates
  id_rm <- batch_designs123 %>%
    group_by(BrNum) %>%
    filter(n() > 3) %>%
    filter(BrNum != "GIS") %>%
    group_by(BrNum) %>%
    filter(Batch != min(Batch)) %>%
    ungroup() %>%
    pull(id)
  
  batch_designs <- batch_designs123[!batch_designs123$id %in% id_rm,]
  batch_designs <- as.data.frame(batch_designs)
  
  norm <- norm[, !colnames(norm) %in% id_rm]

  batch_designs <- merge(batch_designs, anno[,c("BrNum","SampleID","Brain_Region_Protein")], by.x=c("BrNum"), by.y=c("BrNum"), all.x=T)
  batch_designs[batch_designs$BrNum=="GIS","BrNum"] <- batch_designs[batch_designs$BrNum=="GIS","id"]
  
  for (id in names(norm)){
    print(id)
    names(norm)[names(norm)==id] <- batch_designs[batch_designs$id == id,"BrNum"]
  }
  names(norm)
  norm <- norm[,startsWith(names(norm), "B")]
  return(norm)
}

Y1Y2Y3_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/Y1Y2Y3_NORM_Hippocampus.RDS")
Y1Y2Y3_DG_clean <- as.data.frame(Y1Y2Y3_DG$cleanDat)
Y1Y2Y3_DG_clean <- prepare_norm(Y1Y2Y3_DG_clean,anno123)
saveRDS(Y1Y2Y3_DG_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_DG_clean_no_GIS.RDS")

Y1Y2Y3_CA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/Y1Y2Y3_NORM_Amygdala.RDS")
Y1Y2Y3_CA_clean <- as.data.frame(Y1Y2Y3_CA$cleanDat)
Y1Y2Y3_CA_clean <- prepare_norm(Y1Y2Y3_CA_clean,anno123)
saveRDS(Y1Y2Y3_CA_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_CentralAmyg_clean_no_GIS.RDS")

Y1Y2Y3_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/Y1Y2Y3_NORM_mPFC.RDS")
Y1Y2Y3_mPFC_clean <- as.data.frame(Y1Y2Y3_mPFC$cleanDat)
Y1Y2Y3_mPFC_clean <- prepare_norm(Y1Y2Y3_mPFC_clean,anno123)
saveRDS(Y1Y2Y3_mPFC_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_mPFC_clean_no_GIS.RDS")



