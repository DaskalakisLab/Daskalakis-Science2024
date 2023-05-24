library(EWCE)
library(dplyr)

run_EWCE <- function(module_file, input_dir, region, disease){
  load(module_file)
  if (region == "CentralAmyg"){
    load("/data/humgen/daskalakislab/aiatrou/Science/EWCE/Leo/SCE_AMY-n5_tran-etal.rda")
    bg_in <- sce.amy.tran
    rm(sce.amy.tran)
  }
  if (region == "DG"){
    load("/data/humgen/daskalakislab/aiatrou/Science/EWCE/Leo/SCE_HPC-n3_tran-etal.rda")
    bg_in <- sce.hpc.tran
    rm(sce.hpc.tran)
  }
  if (region == "mPFC"){
    load("/data/humgen/daskalakislab/aiatrou/Science/EWCE/Leo/SCE_DLPFC-n3_tran-etal.rda")
    bg_in <- sce.dlpfc.tran
    rm(sce.dlpfc.tran)
  }
  
  input_files <- list.files(input_dir)
  input_files <- input_files[grepl("GENES", input_files)]
  deg_list <- c()
  for (inf in input_files){
    print(inf)
    name <- gsub(".txt","",inf)
    df_in <- fread2(paste0(input_dir, "/", inf))
    if(nrow(df_in) > 0){
      deg_list[[name]] <- df_in[,names(df_in)]
    }
  }
  
  if (region=="DG" & disease=="PTSD_MDD"){
    deg_list <- deg_list[-2]
  }
  if (region=="mPFC" & disease=="PTSD_MDD"){
    deg_list <- deg_list[-4]
  }
  
  
  reps <- 10000
  for(i in 1:length(deg_list)){
    print(i)
    if (length(intersect(deg_list[[i]], rownames(bg_in))) >= 4 & !(file.exists(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/EWCE/DEGs/",region,"/",disease,"/",names(deg_list)[[i]],"_fine.RDS")))){
      broad_results <- EWCE::bootstrap_enrichment_test(ctd, 
                                                       hits = deg_list[[i]], 
                                                       reps = reps,
                                                       bg = rownames(bg_in),
                                                       annotLevel = 1,
                                                       sctSpecies = "human",
                                                       genelistSpecies = "human",
                                                       no_cores = 50, 
                                                       geneSizeControl = T,
                                                       mtc_method = "bonferroni", 
                                                       verbose = F)
      fine_results <- EWCE::bootstrap_enrichment_test(ctd, 
                                                      hits = deg_list[[i]], 
                                                      reps = reps,
                                                      bg = rownames(bg_in),
                                                      annotLevel = 2,
                                                      sctSpecies = "human",
                                                      genelistSpecies = "human",
                                                      no_cores = 50, 
                                                      geneSizeControl = T,
                                                      mtc_method = "bonferroni", 
                                                      verbose = F)
      
      saveRDS(broad_results, 
              file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/EWCE/DEGs/",region,"/",disease,"/",names(deg_list)[[i]],"_broad.RDS"))
      saveRDS(fine_results, 
              file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/EWCE/DEGs/",region,"/",disease,"/",names(deg_list)[[i]],"_fine.RDS"))
    }
    
  }
  
  ##
  setwd(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/EWCE/DEGs/", region, "/", disease,"/"))
  dr <-paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/EWCE/DEGs/", region, "/", disease,"/")
  list.files(dr, pattern = "broad.RDS")
  
  if (length(list.files(dr, pattern = "broad.RDS")) > 0){
    for(i in 1:length(list.files(dr, pattern = "broad.RDS"))){
      re <- readRDS(paste0(list.files(dr, pattern = "broad.RDS")[i]))
      re <- re$results
      re$bon <- p.adjust(re$p, method = "bonferroni")
      re$Module <- list.files(dr, pattern = "broad.RDS")[i]
      if(i==1){broad_all=re}
      if(i!=1){broad_all=rbind(broad_all,re)}
    }
    
    broad_all$z <- scale(broad_all$sd_from_mean)
    broad_all$z[broad_all$z < 0] <- 0
    broad_all <- as.data.frame(broad_all)
    
    pdf(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/EWCE/DEGs/", region, "/", disease, "/enrich.pdf"), width = 3, height = 3, bg = "transparent")
    ggplot(broad_all %>% filter(z>0), aes(x = CellType, y = z, fill = Module))+
      geom_bar( stat = "identity", position = position_dodge2(width = 0.7, preserve = "single"), width = 0.3)+
      theme_bw()+
      xlab("") + ylab("z-score")+
      theme(legend.position="none", legend.box="vertical", legend.margin=margin(),
            legend.text=element_text(size=8),
            legend.title = element_text(size=8),
            text = element_text(size = 10))
    dev.off()
  }
  
}


run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/CentralAmyg/ctd_CentralAmyg.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/CentralAmyg",
         region="CentralAmyg",
         disease="MDD")

run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/CentralAmyg/ctd_CentralAmyg.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/CentralAmyg",
         region="CentralAmyg",
         disease="PTSD")

run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/CentralAmyg/ctd_CentralAmyg.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/CentralAmyg",
         region="CentralAmyg",
         disease="PTSD_MDD")





run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/DG/ctd_DG.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/DG",
         region="DG",
         disease="MDD")
run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/DG/ctd_DG.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/DG",
         region="DG",
         disease="PTSD")
run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/DG/ctd_DG.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/DG",
         region="DG",
         disease="PTSD_MDD")



run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/mPFC/ctd_mPFC.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MDD_FDR_Beta/mPFC",
         region="mPFC",
         disease="MDD")

run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/mPFC/ctd_mPFC.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_FDR_Beta/mPFC",
         region="mPFC",
         disease="PTSD")

run_EWCE(module_file="/data/humgen/daskalakislab/aiatrou/Science/EWCE/Module/mPFC/ctd_mPFC.rda",
         input_dir="/data/humgen/daskalakislab/aiatrou/Science/WGCNA/CleanedRes/Enrichment/InputForEnrichment/PTSD_MDD_FDR_Beta/mPFC",
         region="mPFC",
         disease="PTSD_MDD")

