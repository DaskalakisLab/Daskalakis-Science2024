library(bigreadr)
library(tidyverse)


extract_modules <- function(wd, analysis,disease){
  res_files <- list.files(wd,pattern = "^results.*")
  for (rf in res_files){
    re <- readRDS(paste0(wd,rf))
    re$Module <- gsub("ME", "", re$Module)
    if(grepl("CentralAmyg",rf)){
      region <- "CentralAmyg"
    }else if(grepl("DG",rf)){
      region <- "DG"
    }else if(grepl("mPFC",rf)){
      region <- "mPFC"
    }
    Gene2Modules <- read.csv(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/", region, "/Gene2Modules.csv"))
    Gene2Modules <- Gene2Modules[,2:ncol(Gene2Modules)]
    modules <- names(table(Gene2Modules$Module)) 
    genes <- Gene2Modules[which(Gene2Modules$Module %in% re$Module),]
    genes$Symbol <- gsub("\\|.*", "", genes$Gene)
    saveRDS(genes, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/Protein/ModulesForEnrichment/",disease,"/",region, "/", analysis,"_", region, "_Modules.RDS"))
    
  }
  
}

extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/ChildTraumaMDD/",analysis="ChildTraumaMDD",disease="MDD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/ChildTraumaPTSD/",analysis="ChildTraumaPTSD",disease="PTSD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/ChildTraumaPTSD_MDD/",analysis="ChildTraumaPTSD_MDD",disease="PTSD_MDD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD/",analysis="MDD",disease="MDD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD_Female/",analysis="MDD_Female",disease="MDD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD_Male/",analysis="MDD_Male",disease="MDD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD/",analysis="PTSD",disease="PTSD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_Female/",analysis="PTSD_Female",disease="PTSD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_Male/",analysis="PTSD_Male",disease="PTSD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD/",analysis="PTSD_MDD",disease="PTSD_MDD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD_Female/",analysis="PTSD_MDD_Female",disease="PTSD_MDD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD_Male/",analysis="PTSD_MDD_Male",disease="PTSD_MDD")
# extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_vs_MDD/",analysis="PTSD_vs_MDD")
# extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_vs_MDD_Female/",analysis="PTSD_vs_MDD_Female")
# extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_vs_MDD_Male/",analysis="PTSD_vs_MDD_Male")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/SuicideMDD/",analysis="SuicideMDD",disease="MDD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/SuicidePTSD/",analysis="SuicidePTSD",disease="PTSD")
extract_modules(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/SuicidePTSD_MDD/",analysis="SuicidePTSD_MDD",disease="PTSD_MDD")

