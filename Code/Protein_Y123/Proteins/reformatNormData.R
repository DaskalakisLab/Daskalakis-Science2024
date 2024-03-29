anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")

prepare_norm <- function(norm, anno){
  norm <- as.data.frame(norm)
  
  batch_designs <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Proteomics/batch_designs.RDS")
  
  batch_designs <- as.data.frame(batch_designs)
  batch_designs$Plate <- gsub("F", "", batch_designs$Plate)
  batch_designs$Plate <- sprintf("%02d", as.numeric(batch_designs$Plate))
  batch_designs$ID <- paste0("b",batch_designs$Plate, ".", batch_designs$Position)
  
  batch_designs <- merge(batch_designs, anno[,c("BrNum","SampleID","Brain_Region_Protein")], by.x=c("BrNum", "Brain_Region"), by.y=c("BrNum", "Brain_Region_Protein"), all.x=T)
  batch_designs[batch_designs$BrNum=="GIS","SampleID"] <- batch_designs[batch_designs$BrNum=="GIS","ID"]
  
  for (id in names(norm)){
    print(id)
    names(norm)[names(norm)==id] <- batch_designs[batch_designs$ID == id,"BrNum"]
  }
  names(norm)
  norm <- norm[,startsWith(names(norm), "B")]
  return(norm)
}

Y1Y2_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/Y1Y2Y3_NORM_Hippocampus.RDS")
Y1Y2_DG_clean <- as.data.frame(Y1Y2_DG$cleanDat)
Y1Y2_DG_clean <- prepare_norm(Y1Y2_DG_clean,anno)
saveRDS(Y1Y2_DG_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_DG_clean_no_GIS.RDS")

Y1Y2_CA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/Y1Y2Y3_NORM_Amygdala.RDS")
Y1Y2_CA_clean <- as.data.frame(Y1Y2_CA$cleanDat)
Y1Y2_CA_clean <- prepare_norm(Y1Y2_CA_clean,anno)
saveRDS(Y1Y2_CA_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_CentralAmyg_clean_no_GIS.RDS")

Y1Y2_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/Y1Y2Y3_NORM_mPFC.RDS")
Y1Y2_mPFC_clean <- as.data.frame(Y1Y2_mPFC$cleanDat)
Y1Y2_mPFC_clean <- prepare_norm(Y1Y2_mPFC_clean,anno)
saveRDS(Y1Y2_mPFC_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_mPFC_clean_no_GIS.RDS")



