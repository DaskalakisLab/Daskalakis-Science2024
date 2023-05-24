source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Subanalyses/Code/Methylation/LimmaFunctionsY1Y2.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/SuicideLogY1Y2.txt")


regions <- c("CentralAmyg","DG","mPFC")
for (region in regions){
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"),
                region=region,
                dx="PTSD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                suicide=T,
                type = "meth",
                covariates = c("Suicide012","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicidePTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"),
                region=region,
                dx="MDD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                suicide=T,
                type = "meth",
                covariates = c("Suicide012","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicideMDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"),
                region=region,
                dx=NULL, 
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                suicide=T,
                type = "meth",
                covariates = c("Suicide012","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y1Y2/SuicidePTSD+MDD/")
  
}

sink()

rm(list=ls())

source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Subanalyses/Code/Methylation/LimmaFunctionsY3.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/SuicideLogY3.txt")


regions <- c("CentralAmyg","DG","mPFC")
for (region in regions){
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/",region,"Mfunnorm.RDS"),
                region=region,
                dx="PTSD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                suicide=T,
                type = "meth",
                covariates = c("Suicide012","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicidePTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/",region,"Mfunnorm.RDS"),
                region=region,
                dx="MDD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                suicide=T,
                type = "meth",
                covariates = c("Suicide012","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicideMDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/",region,"Mfunnorm.RDS"),
                region=region,
                dx=NULL, 
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                suicide=T,
                type = "meth",
                covariates = c("Suicide012","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Methylation/Y3/SuicidePTSD+MDD/")
  
}

sink()