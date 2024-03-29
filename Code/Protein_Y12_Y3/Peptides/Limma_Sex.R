source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Protein/Limma_Functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/log.txt")

regions <- c("CentralAmyg", "DG", "mPFC")

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y1Y2/PTSD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "M",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y1Y2/MDD_Male/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "peptide",
                sex = "M",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y1Y2/PTSD_MDD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y1Y2/PTSD_vs_MDD_Male/")
}

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                tamp_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y3/PTSD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                tamp_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "M",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y3/MDD_Male/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                tamp_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "peptide",
                sex = "M",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y3/PTSD_MDD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                tamp_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y3/PTSD_vs_MDD_Male/")
}













source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Protein/Limma_Functions.R")

regions <- c("CentralAmyg", "DG", "mPFC")


for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "F",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y1Y2/PTSD_Female/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "F",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y1Y2/MDD_Female/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "peptide",
                sex = "F",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y1Y2/PTSD_MDD_Female/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                tamp_file =  paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "F",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y1Y2/PTSD_vs_MDD_Female/")
}

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                tamp_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "F",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y3/PTSD_Female/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                tamp_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "peptide",
                sex = "F",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y3/MDD_Female/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                tamp_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "peptide",
                sex = "F",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y3/PTSD_MDD_Female/")
  
  #   limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
  #                 tamp_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"), 
  #                 region = region, 
  #                 dx=NULL, 
  #                 ptsd_vs_mdd = T, 
  #                 ptsd_mdd = F, 
  #                 type = "peptide",
  #                 sex = "F",
  #                 covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","PepPC1","PepPC2","PepPC3","PepPC4","PepPC5","mitoMapped"), 
  #                 contrast_var = "PTSD", 
  #                 out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Protein/Peptides/Y3/PTSD_vs_MDD_Female/")
}


