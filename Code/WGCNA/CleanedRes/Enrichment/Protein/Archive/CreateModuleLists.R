library(bigreadr)
library(tidyverse)

regions <- c("CentralAmyg", "DG", "mPFC")
diseases <- c("PTSD", "MDD", "PTSD_MDD")
path <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/"

for (region in regions){
  for(disease in diseases){
    re <- readRDS(paste0(path, disease, "/results_",disease, "_", region, "_", disease, ".RDS" ))
    # re <- re %>%
    #   filter(adj.P.Val < 0.05)
    print(re$Module)
    re$Module <- gsub("ME", "", re$Module)
    Gene2Modules <- read.csv(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/", region, "/Gene2Modules.csv"))
    Gene2Modules <- Gene2Modules[,2:ncol(Gene2Modules)]
    modules <- names(table(Gene2Modules$Module)) 
    genes <- Gene2Modules[which(Gene2Modules$Module %in% re$Module),]
    genes$Symbol <- gsub("\\|.*", "", genes$Gene)
    saveRDS(genes, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/Protein/ModulesForEnrichment/",disease,"_", region, "_Modules.RDS"))
    
  }
}

