
sink("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/log.txt")


source("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Code/RNA/Y123/Limma_Functions.R")

regions <- c("CentralAmyg", "DG", "mPFC")

# "PTSD", "MDD", "AgeDeath", "Sex", "PMI", "ancestryPC1", "ancestryPC2", "ancestryPC3", "in", "ex", "Oligo", "mitoMapped", "overallMapRate",


for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Txs/Y1Y2Y3/log2TMM1_",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "tx",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped","batch"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Txs/Y1Y2Y3/log2TMM1_",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "tx",
                covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped","batch"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/MDD/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Txs/Y1Y2Y3/log2TMM1_",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "tx",
                covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped","batch"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD_MDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Txs/Y1Y2Y3/log2TMM1_",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "tx",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped","batch"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD_vs_MDD/")
}


sink()
