source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Protein/Limma_Functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/logY3.txt")
regions <- c("CentralAmyg", "DG", "mPFC")

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                covariates = c("PTSD", "AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                covariates = c("MDD", "AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/MDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "peptide",
                covariates = c("PTSD_MDD", "AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD_MDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "peptide",
                covariates = c("PTSD", "AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Protein/Peptides/Y3/PTSD_vs_MDD/")
}

sink()