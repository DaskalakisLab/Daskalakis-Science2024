library(readxl)

anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")

prepare_norm <- function(norm, anno){
  norm <- as.data.frame(norm)
  
  batch_designs <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Bulk/Y3/Batch_Design.xlsx")
  #batch_designs <- batch_designs[batch_designs$BrNum != "GIS",]
  batch_designs <- as.data.frame(batch_designs)
  
  batch_designs$Plate <- gsub("PLATE_", "", batch_designs$plate)
  batch_designs$Plate <- sprintf("%02d", as.numeric(batch_designs$Plate))
  batch_designs$ID <- paste0("b",batch_designs$Plate, ".", batch_designs$Channel)
  batch_designs$Brain_Region <- batch_designs$Region
  batch_designs[batch_designs$Brain_Region=="CeA", "Brain_Region"] <- "CentralAmyg"
  
  batch_designs <- merge(batch_designs, anno[,c("BrNum","SampleID","Brain_Region")], by=c("BrNum", "Brain_Region"), all.x=T)
  batch_designs[batch_designs$BrNum=="GIS","SampleID"] <- batch_designs[batch_designs$BrNum=="GIS","ID"]
  
  for (id in names(norm)){
    print(id)
    names(norm)[names(norm)==id] <- batch_designs[batch_designs$ID == id,"BrNum"]
  }
  names(norm)
  norm <- norm[,startsWith(names(norm), "B")]
  return(norm)
}

Y3_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_Hippocampus.RDS")
Y3_DG_clean <- as.data.frame(Y3_DG$cleanDat)
Y3_DG_clean <- prepare_norm(Y3_DG_clean,anno)
Y3_DG_clean <- Y3_DG_clean[,names(Y3_DG_clean)[!(names(Y3_DG_clean) %in% anno12$BrNum)]]
saveRDS(Y3_DG_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_DG_clean_no_GIS.RDS")

Y3_CA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_Amygdala.RDS")
Y3_CA_clean <- as.data.frame(Y3_CA$cleanDat)
Y3_CA_clean <- prepare_norm(Y3_CA_clean,anno)
Y3_CA_clean <- Y3_CA_clean[,names(Y3_CA_clean)[!(names(Y3_CA_clean) %in% anno12$BrNum)]]
saveRDS(Y3_CA_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_CentralAmyg_clean_no_GIS.RDS")

Y3_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/Y3_mPFC.RDS")
Y3_mPFC_clean <- as.data.frame(Y3_mPFC$cleanDat)
Y3_mPFC_clean <- prepare_norm(Y3_mPFC_clean,anno)
Y3_mPFC_clean <- Y3_mPFC_clean[,names(Y3_mPFC_clean)[!(names(Y3_mPFC_clean) %in% anno12$BrNum)]]
saveRDS(Y3_mPFC_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_mPFC_clean_no_GIS.RDS")


