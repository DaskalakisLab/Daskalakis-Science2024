anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_batch11.RDS")

prepare_norm <- function(norm, anno){
  norm <- as.data.frame(norm)
  
  batch1_designs <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Proteomics/batch1_designs.RDS")
  
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

batch11_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/batch11/Peptides/batch11_Hippocampus.RDS")
batch11_DG_clean <- as.data.frame(batch11_DG$cleanDat)
batch11_DG_clean <- prepare_norm(batch11_DG_clean,anno)
saveRDS(batch11_DG_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/batch11/Peptides/CleanWithSampleIDs/batch11_DG_clean_no_GIS.RDS")

batch11_CA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/batch11/Peptides/batch11_Amygdala.RDS")
batch11_CA_clean <- as.data.frame(batch11_CA$cleanDat)
batch11_CA_clean <- prepare_norm(batch11_CA_clean,anno)
saveRDS(batch11_CA_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/batch11/Peptides/CleanWithSampleIDs/batch11_CentralAmyg_clean_no_GIS.RDS")

batch11_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/batch11/Peptides/batch11_mPFC.RDS")
batch11_mPFC_clean <- as.data.frame(batch11_mPFC$cleanDat)
batch11_mPFC_clean <- prepare_norm(batch11_mPFC_clean,anno)
saveRDS(batch11_mPFC_clean, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/batch11/Peptides/CleanWithSampleIDs/batch11_mPFC_clean_no_GIS.RDS")



