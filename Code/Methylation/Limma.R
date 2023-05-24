source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Methylation/Limma_Functions.R")

sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/logY1Y2.txt")

regions <- c("CentralAmyg", "DG", "mPFC")

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "meth",
                covariates = c("PTSD","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "meth",
                covariates = c("MDD","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/MDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"),
                region = region,
                dx=NULL,
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                type = "meth",
                covariates = c("PTSD_MDD","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"),
                contrast_var = "PTSD_MDD",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD_MDD/")

  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                expr_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/",region,"Mfunnorm.RDS"),
                region = region,
                dx=NULL,
                ptsd_vs_mdd = T,
                ptsd_mdd = F,
                type = "meth",
                covariates = c("PTSD","AgeDeath","PMI","Sex","ancestryPC1","ancestryPC2","Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos"),
                contrast_var = "PTSD",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/Methylation/Y1Y2/PTSD_vs_MDD/")
}
sink()