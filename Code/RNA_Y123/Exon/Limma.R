#source("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Limma_Functions.R")
source("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Code/RNA/Y4/Limma_Functions_zFIXED.R")

sink("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Exon/Y1Y2Y3_removed_exon/log.txt")
#regions <- c("CentralAmyg", "DG", "mPFC")
regions <- c( "mPFC")


for (region in regions){

  limma_wrapper(anno_file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Exons/Y1Y2Y3_removed_exon/Voom",region,".RDS"), 
                region = region, 
                dx="PTSD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped","batch"), 
                contrast_var = "PTSD", 
                out_folder = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Exon/Y1Y2Y3_removed_exon/PTSD/")
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS", 
                voom_file = paste0("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Exons/Y1Y2Y3_removed_exon/Voom",region,".RDS"), 
                region = region, 
                dx="MDD", 
                ptsd_vs_mdd = F, 
                ptsd_mdd = F, 
                type = "exon",
                covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped","batch"), # TODO add batches 
                contrast_var = "MDD", 
                out_folder = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Exon/Y1Y2Y3_removed_exon/MDD/")
  
  
  limma_wrapper(anno_file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Exons/Y1Y2Y3_removed_exon/Voom",region,".RDS"),
                region = region,
                dx=NULL,
                ptsd_vs_mdd = F,
                ptsd_mdd = T,
                type = "exon",
                covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped","batch"),
                contrast_var = "PTSD_MDD",
                out_folder = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Exon/Y1Y2Y3_removed_exon/PTSD_MDD/")

  limma_wrapper(anno_file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS",
                voom_file = paste0("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Voom/Exons/Y1Y2Y3_removed_exon/Voom",region,".RDS"),
                region = region, 
                dx=NULL, 
                ptsd_vs_mdd = T, 
                ptsd_mdd = F, 
                type = "exon",
                covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped","batch"), 
                contrast_var = "PTSD",
                out_folder = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Exon/Y1Y2Y3_removed_exon/PTSD_vs_MDD/")
}

# for (region in regions){
#   limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
#                 voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/Voom",region,".RDS"), 
#                 region = region, 
#                 dx="PTSD", 
#                 ptsd_vs_mdd = F, 
#                 ptsd_mdd = F, 
#                 type = "gene",
#                 covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
#                 contrast_var = "PTSD", 
#                 out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y3/PTSD/")
#   
#   limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
#                 voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/Voom",region,".RDS"), 
#                 region = region, 
#                 dx="MDD", 
#                 ptsd_vs_mdd = F, 
#                 ptsd_mdd = F, 
#                 type = "gene",
#                 covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
#                 contrast_var = "MDD", 
#                 out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y3/MDD/")
#   
#   
#   limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
#                 voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/Voom",region,".RDS"), 
#                 region = region, 
#                 dx=NULL, 
#                 ptsd_vs_mdd = F, 
#                 ptsd_mdd = T, 
#                 type = "gene",
#                 covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
#                 contrast_var = "PTSD_MDD", 
#                 out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y3/PTSD_MDD/")
#   
#   limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS", 
#                 voom_file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/Voom",region,".RDS"), 
#                 region = region, 
#                 dx=NULL, 
#                 ptsd_vs_mdd = T, 
#                 ptsd_mdd = F, 
#                 type = "gene",
#                 covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
#                 contrast_var = "PTSD", 
#                 out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/RNA/Genes/Y3/PTSD_vs_MDD/")
# }
#results_MDD_DG_MDD <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/results/LimmaResults/RNA/Exon/Y123/MDD/results_MDD_DG_MDD.RDS")
