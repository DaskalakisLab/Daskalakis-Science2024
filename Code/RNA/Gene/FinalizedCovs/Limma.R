source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Limma_Functions.R")

sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/log.txt")
regions <- c("CentralAmyg", "DG", "mPFC")



for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y1Y2/PTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y1Y2/MDD/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "gene",
                covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y1Y2/PTSD_MDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y1Y2/PTSD_vs_MDD/")
}

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y3/PTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y3/MDD/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "gene",
                covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y3/PTSD_MDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y3/PTSD_vs_MDD/")
}

