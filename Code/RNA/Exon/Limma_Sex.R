source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Limma_Functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/log.txt")

regions <- c("CentralAmyg", "DG", "mPFC")

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y1Y2/PTSD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "M",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y1Y2/MDD_Male/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "exon",
                sex = "M",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y1Y2/PTSD_MDD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y1Y2/PTSD_vs_MDD_Male/")
}

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y3/PTSD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "M",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y3/MDD_Male/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "exon",
                sex = "M",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y3/PTSD_MDD_Male/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "M",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y3/PTSD_vs_MDD_Male/")
}

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "F",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y1Y2/PTSD_Female/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "F",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y1Y2/MDD_Female/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "exon",
                sex = "F",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y1Y2/PTSD_MDD_Female/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "F",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y1Y2/PTSD_vs_MDD_Female/")
}

for (region in regions){
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "F",
                covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y3/PTSD_Female/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                sex = "F",
                covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y3/MDD_Female/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"), 
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = F, 
                ptsd_mdd = T, 
                type = "exon",
                sex = "F",
                covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
                contrast_var = "PTSD_MDD", 
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y3/PTSD_MDD_Female/")
  
  #   limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
  #                 voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"), 
  #                 region = region, 
  #                 dx=NULL, 
  #                 ptsd_vs_mdd = T, 
  #                 ptsd_mdd = F, 
  #                 type = "exon",
  #                 sex = "F",
  #                 covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
  #                 contrast_var = "PTSD", 
  #                 out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/RNA/Exons/Y3/PTSD_vs_MDD_Female/")
}

sink()
