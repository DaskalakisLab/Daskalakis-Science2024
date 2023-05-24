source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Subanalyses/Code/RNA/Sub_Limma_functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/ChildTraumaLog.txt")

regions <- c("CentralAmyg","DG","mPFC")
for (region in regions){
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y1Y2/Voom",region,".RDS"),
                region=region,
                dx="PTSD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                childtrauma=T,
                type = "jx",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaPTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y1Y2/Voom",region,".RDS"),
                region=region,
                dx="MDD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                childtrauma=T,
                type = "jx",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaMDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y1Y2/Voom",region,".RDS"),
                region=region,
                dx=NULL, 
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                childtrauma=T,
                type = "jx",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y1Y2/ChildTraumaPTSD+MDD/")
  
}

for (region in regions){
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y3/Voom",region,".RDS"),
                region=region,
                dx="PTSD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                childtrauma=T,
                type = "jx",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaPTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y3/Voom",region,".RDS"),
                region=region,
                dx="MDD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                childtrauma=T,
                type = "jx",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaMDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y3/Voom",region,".RDS"),
                region=region,
                dx=NULL, 
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                childtrauma=T,
                type = "jx",
                covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "ChildTrauma012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Jxs/Y3/ChildTraumaPTSD+MDD/")
  
}
sink()
