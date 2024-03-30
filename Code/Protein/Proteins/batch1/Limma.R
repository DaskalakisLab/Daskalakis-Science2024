sink("/path/to/Data/LimmaResults/Protein/Proteins/log.txt")
source("/path/to/Code/Protein/Limma_Functions.R")

regions <- c("CentralAmyg", "DG", "mPFC")

for (region in regions){
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch1.RDS", 
                paste0("/path/to/Data/Protein/TamporNormalized/batch1/Proteins/CleanedWithSampleIDs/batch1_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "protein",
                covariates = c("PTSD", "AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/path/to/Data/LimmaResults/Protein/Proteins/batch1/PTSD/")
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch1.RDS", 
                paste0("/path/to/Data/Protein/TamporNormalized/batch1/Proteins/CleanedWithSampleIDs/batch1_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "protein",
                covariates = c("MDD", "AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/path/to/Data/LimmaResults/Protein/Proteins/batch1/MDD/")
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch1.RDS", 
                paste0("/path/to/Data/Protein/TamporNormalized/batch1/Proteins/CleanedWithSampleIDs/batch1_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "protein",
                covariates = c("PTSD_MDD", "AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/path/to/Data/LimmaResults/Protein/Proteins/batch1/PTSD_MDD/")
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch1.RDS", 
                paste0("/path/to/Data/Protein/TamporNormalized/batch1/Proteins/CleanedWithSampleIDs/batch1_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "protein",
                covariates = c("PTSD", "AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/path/to/Data/LimmaResults/Protein/Proteins/batch1/PTSD_vs_MDD/")
}
sink()
