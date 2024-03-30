source("/path/to/Code/RNA/Limma_Functions.R")

sink("/path/to/Data/LimmaResults/RNA/Genes/log.txt")
regions <- c("CentralAmyg", "DG", "mPFC")



for (region in regions){
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch1.RDS", 
                voom_file = paste0("/path/to/Data/RNA/Voom/Genes/batch1/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/path/to/Data/LimmaResults/RNA/Genes/batch1/PTSD/")
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch1.RDS", 
                voom_file = paste0("/path/to/Data/RNA/Voom/Genes/batch1/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/path/to/Data/LimmaResults/RNA/Genes/batch1/MDD/")
  
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch1.RDS", 
                voom_file = paste0("/path/to/Data/RNA/Voom/Genes/batch1/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "gene",
                covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/path/to/Data/LimmaResults/RNA/Genes/batch1/PTSD_MDD/")
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch1.RDS", 
                voom_file = paste0("/path/to/Data/RNA/Voom/Genes/batch1/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/path/to/Data/LimmaResults/RNA/Genes/batch1/PTSD_vs_MDD/")
}

for (region in regions){
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch2.RDS", 
                voom_file = paste0("/path/to/Data/RNA/Voom/Genes/batch2/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/path/to/Data/LimmaResults/RNA/Genes/batch2/PTSD/")
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch2.RDS", 
                voom_file = paste0("/path/to/Data/RNA/Voom/Genes/batch2/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/path/to/Data/LimmaResults/RNA/Genes/batch2/MDD/")
  
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch2.RDS", 
                voom_file = paste0("/path/to/Data/RNA/Voom/Genes/batch2/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "gene",
                covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/path/to/Data/LimmaResults/RNA/Genes/batch2/PTSD_MDD/")
  
  limma_wrapper(anno_file = "/path/to/Data/Annotation/Annotation_batch2.RDS", 
                voom_file = paste0("/path/to/Data/RNA/Voom/Genes/batch2/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "gene",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/path/to/Data/LimmaResults/RNA/Genes/batch2/PTSD_vs_MDD/")
}

