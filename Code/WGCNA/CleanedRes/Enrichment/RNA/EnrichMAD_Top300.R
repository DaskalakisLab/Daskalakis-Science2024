library(WGCNA)

run_enrichment_MAD <- function(wd, mod_file,disease,region){
  modules <- readRDS(paste0(wd, "/", mod_file))
  genes <- modules$Symbol
  mods <- modules$Module
  
  out_file <- gsub("_Modules.RDS", "_Enrich", mod_file)
  
  fnIn_list <- "/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/TOP300_and_MADGenes/MAD_GENES.txt"
  
  enrich <- userListEnrichment(geneR=genes, 
                               labelR=mods, 
                               fnIn = fnIn_list, 
                               nameOut = paste0("/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/Results/MAD/",region,"/",out_file,".csv"), 
                               useBrainLists = FALSE, 
                               useBloodAtlases = FALSE, 
                               omitCategories = "", 
                               outputCorrectedPvalues = TRUE, 
                               useStemCellLists = FALSE, 
                               outputGenes = T, 
                               minGenesInCategory = 1, 
                               useBrainRegionMarkers = FALSE, 
                               useImmunePathwayLists = FALSE)
  
  saveRDS(enrich, paste0("/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/Results/MAD/",region,"/",out_file,".RDS"))
  
}

run_enrichment_top262 <- function(wd, mod_file,disease,region){
  modules <- readRDS(paste0(wd, "/", mod_file))
  genes <- modules$Symbol
  mods <- modules$Module
  
  out_file <- gsub("_Modules.RDS", "_Enrich", mod_file)
  
  fnIn_list <- "/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/TOP262_and_MADGenes/TOP262_GENES.txt"
  
  enrich <- userListEnrichment(geneR=genes, 
                               labelR=mods, 
                               fnIn = fnIn_list, 
                               nameOut = paste0("/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/Results/Top262/",region,"/",out_file,".csv"), 
                               useBrainLists = FALSE, 
                               useBloodAtlases = FALSE, 
                               omitCategories = "", 
                               outputCorrectedPvalues = TRUE, 
                               useStemCellLists = FALSE, 
                               outputGenes = T, 
                               minGenesInCategory = 1, 
                               useBrainRegionMarkers = FALSE, 
                               useImmunePathwayLists = FALSE)
  
  saveRDS(enrich, paste0("/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/Results/Top262/",region,"/",out_file,".RDS"))
  
}

mdd_dir <- "/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/ModulesForEnrichment/MDD/"
regions <- c("CentralAmyg", "DG", "mPFC")
for (region in regions){
  region_files <- list.files(paste0(mdd_dir,region))
  for (rf in region_files){
    #run_enrichment_MAD(wd=paste0(mdd_dir,region), mod_file=rf, disease="MDD", region=region)
    run_enrichment_top262(wd=paste0(mdd_dir,region), mod_file=rf, disease="MDD", region=region)
  }
}

ptsd_dir <- "/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/ModulesForEnrichment/PTSD/"
regions <- c("CentralAmyg", "DG", "mPFC")
for (region in regions){
  region_files <- list.files(paste0(ptsd_dir,region))
  for (rf in region_files){
    #run_enrichment_MAD(wd=paste0(ptsd_dir,region), mod_file=rf, disease="PTSD", region=region)
    run_enrichment_top262(wd=paste0(ptsd_dir,region), mod_file=rf, disease="PTSD", region=region)
  }
}

ptsd_mdd_dir <- "/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/Protein/ModulesForEnrichment/PTSD_MDD/"
regions <- c("CentralAmyg", "DG", "mPFC")
for (region in regions){
  region_files <- list.files(paste0(ptsd_mdd_dir,region))
  for (rf in region_files){
    #run_enrichment_MAD(wd=paste0(ptsd_mdd_dir,region), mod_file=rf, disease="PTSD_MDD", region=region)
    run_enrichment_top262(wd=paste0(ptsd_mdd_dir,region), mod_file=rf, disease="PTSD_MDD", region=region)
  }
}
