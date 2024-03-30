anno <- readRDS("/path/to/Data/Annotation/Annotation_batch1.RDS")

prepare_norm <- function(norm, anno){
  norm <- as.data.frame(norm)
  
  batch_designs <- readRDS("/path/to/Data/Protein/Proteomics/batch_designs.RDS")
  
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

batch1_DG <- readRDS("/path/to/Data/Protein/TamporNormalized/batch1/Proteins/batch1_DG.RDS")
batch1_DG_clean <- as.data.frame(batch1_DG$cleanDat)
batch1_DG_clean <- prepare_norm(batch1_DG_clean,anno)
saveRDS(batch1_DG_clean, "/path/to/Data/Protein/TamporNormalized/batch1/Proteins/CleanedWithSampleIDs/batch1_DG_clean_no_GIS.RDS")

batch1_CA <- readRDS("/path/to/Data/Protein/TamporNormalized/batch1/Proteins/batch1_CentralAmyg.RDS")
batch1_CA_clean <- as.data.frame(batch1_CA$cleanDat)
batch1_CA_clean <- prepare_norm(batch1_CA_clean,anno)
saveRDS(batch1_CA_clean, "/path/to/Data/Protein/TamporNormalized/batch1/Proteins/CleanedWithSampleIDs/batch1_CentralAmyg_clean_no_GIS.RDS")

batch1_mPFC <- readRDS("/path/to/Data/Protein/TamporNormalized/batch1/Proteins/batch1_mPFC.RDS")
batch1_mPFC_clean <- as.data.frame(batch1_mPFC$cleanDat)
batch1_mPFC_clean <- prepare_norm(batch1_mPFC_clean,anno)
saveRDS(batch1_mPFC_clean, "/path/to/Data/Protein/TamporNormalized/batch1/Proteins/CleanedWithSampleIDs/batch1_mPFC_clean_no_GIS.RDS")



