source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Subanalyses/Code/Protein/Sub_Limma_functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Proteins/ChildTraumaLog.txt")


regions <- c("CentralAmyg","DG","mPFC")
for (region in regions){
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                tamp_file=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"),
                region=region,
                dx="PTSD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                childtrauma=T,
                type = "protein",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Proteins/Y1Y2/ChildTraumaPTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                tamp_file=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"),
                region=region,
                dx="MDD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                childtrauma=T,
                type = "protein",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Proteins/Y1Y2/ChildTraumaMDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                tamp_file=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_",region,"_clean_no_GIS.RDS"),
                region=region,
                dx=NULL, 
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                childtrauma=T,
                type = "protein",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Proteins/Y1Y2/ChildTraumaPTSD+MDD/")
  
}

for (region in regions){
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                tamp_file=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"),
                region=region,
                dx="PTSD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                childtrauma=T,
                type = "protein",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Proteins/Y3/ChildTraumaPTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                tamp_file=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"),
                region=region,
                dx="MDD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                childtrauma=T,
                type = "protein",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Proteins/Y3/ChildTraumaMDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                tamp_file=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_",region,"_clean_no_GIS.RDS"),
                region=region,
                dx=NULL, 
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                childtrauma=T,
                type = "protein",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Protein/Proteins/Y3/ChildTraumaPTSD+MDD/")
  
}
sink()
