source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Subanalyses/Code/RNA/Sub_Limma_functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Exons/SuicideLog.txt")

regions <- c("CentralAmyg","DG","mPFC")
for (region in regions){
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"),
                region=region,
                dx="PTSD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                suicide=T,
                type = "exon",
                covariates = c("Suicide012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Exons/Y1Y2/SuicidePTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"),
                region=region,
                dx="MDD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                suicide=T,
                type = "exon",
                covariates = c("Suicide012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Exons/Y1Y2/SuicideMDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/Voom",region,".RDS"),
                region=region,
                dx=NULL, 
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                suicide=T,
                type = "exon",
                covariates = c("Suicide012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Exons/Y1Y2/SuicidePTSD+MDD/")
  
}

for (region in regions){
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"),
                region=region,
                dx="PTSD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                suicide=T,
                type = "exon",
                covariates = c("Suicide012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Exons/Y3/SuicidePTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"),
                region=region,
                dx="MDD",
                ptsd_vs_mdd = F,
                ptsd_mdd = F,
                suicide=T,
                type = "exon",
                covariates = c("Suicide012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Exons/Y3/SuicideMDD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/Voom",region,".RDS"),
                region=region,
                dx=NULL, 
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                suicide=T,
                type = "exon",
                covariates = c("Suicide012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"),
                contrast_var = "Suicide012",
                out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/RNA/Exons/Y3/SuicidePTSD+MDD/")
  
}

