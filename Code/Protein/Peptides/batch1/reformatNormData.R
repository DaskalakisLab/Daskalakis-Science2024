anno <- readRDS("/path/to/Data/Annotation/Annotation_batch1.RDS")

prepare_norm <- function(norm, anno){
  norm <- as.data.frame(norm)
  
  batch1_designs <- readRDS("/path/to/Data/Protein/Proteomics/batch1_designs.RDS")
  
  batch1_designs <- as.data.frame(batch1_designs)
  batch1_designs$Plate <- gsub("F", "", batch1_designs$Plate)
  batch1_designs$Plate <- sprintf("%02d", as.numeric(batch1_designs$Plate))
  batch1_designs$ID <- paste0("b",batch1_designs$Plate, ".", batch1_designs$Position)
  
  batch1_designs <- merge(batch1_designs, anno[,c("BrNum","SampleID","Brain_Region_Protein")], by.x=c("BrNum", "Brain_Region"), by.y=c("BrNum", "Brain_Region_Protein"), all.x=T)
  batch1_designs[batch1_designs$BrNum=="GIS","SampleID"] <- batch1_designs[batch1_designs$BrNum=="GIS","ID"]
  
  for (id in names(norm)){
    print(id)
    names(norm)[names(norm)==id] <- batch1_designs[batch1_designs$ID == id,"BrNum"]
  }
  names(norm)
  norm <- norm[,startsWith(names(norm), "B")]
  return(norm)
}

batch1_DG <- readRDS("/path/to/Data/Protein/TamporNormalized/batch1/Peptides/batch1_Hippocampus.RDS")
batch1_DG_clean <- as.data.frame(batch1_DG$cleanDat)
batch1_DG_clean <- prepare_norm(batch1_DG_clean,anno)
saveRDS(batch1_DG_clean, "/path/to/Data/Protein/TamporNormalized/batch1/Peptides/CleanWithSampleIDs/batch1_DG_clean_no_GIS.RDS")

batch1_CA <- readRDS("/path/to/Data/Protein/TamporNormalized/batch1/Peptides/batch1_Amygdala.RDS")
batch1_CA_clean <- as.data.frame(batch1_CA$cleanDat)
batch1_CA_clean <- prepare_norm(batch1_CA_clean,anno)
saveRDS(batch1_CA_clean, "/path/to/Data/Protein/TamporNormalized/batch1/Peptides/CleanWithSampleIDs/batch1_CentralAmyg_clean_no_GIS.RDS")

batch1_mPFC <- readRDS("/path/to/Data/Protein/TamporNormalized/batch1/Peptides/batch1_mPFC.RDS")
batch1_mPFC_clean <- as.data.frame(batch1_mPFC$cleanDat)
batch1_mPFC_clean <- prepare_norm(batch1_mPFC_clean,anno)
saveRDS(batch1_mPFC_clean, "/path/to/Data/Protein/TamporNormalized/batch1/Peptides/CleanWithSampleIDs/batch1_mPFC_clean_no_GIS.RDS")



