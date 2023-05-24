source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Methylation/Limma_Functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/logY1Y2.txt")

regions <- c("CentralAmyg", "DG", "mPFC")

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "meth",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/Y1Y2/PTSD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "meth",
                sex = "M",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/Y1Y2/MDD_Male/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "meth",
                sex = "M",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/Y1Y2/PTSD_MDD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "meth",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/Y1Y2/PTSD_vs_MDD_Male/")
}


for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "meth",
                sex = "F",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/Y1Y2/PTSD_Female/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "meth",
                sex = "F",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/Y1Y2/MDD_Female/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "meth",
                sex = "F",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/Y1Y2/PTSD_MDD_Female/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "meth",
                sex = "F",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/Methylation/Y1Y2/PTSD_vs_MDD_Female/")
}
sink()