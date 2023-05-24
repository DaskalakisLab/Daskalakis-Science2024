library(WGCNA)

source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/WGCNA/CleanedRes/Enrichment/RNA/ExtractFDRGenes.R")


runEnrichment <- function(fdr_genes, region, disease){
  modules <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/ModulesForEnrichment/", disease, "_", region, "_Modules.RDS"))
  genes <- modules$Symbol
  mods <- modules$Module
  
  enrich <- userListEnrichment(geneR=genes, 
                               labelR=mods, 
                               fnIn = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/fnIn/",disease,"_",region,"_fnIn.txt"), 
                               nameOut = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/",disease,"_",region,"_Enrichment.csv"), 
                               useBrainLists = FALSE, 
                               useBloodAtlases = FALSE, 
                               omitCategories = "", 
                               outputCorrectedPvalues = TRUE, 
                               useStemCellLists = FALSE, 
                               outputGenes = TRUE, 
                               minGenesInCategory = 1, 
                               useBrainRegionMarkers = FALSE, 
                               useImmunePathwayLists = FALSE)
  
  saveRDS(enrich, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/RNA/",disease,"_",region,"_Enrichment.RDS"))
}

runEnrichment(MDD_CentralAmyg_FDR, "CentralAmyg", "MDD")
runEnrichment(MDD_mPFC_FDR, "mPFC", "MDD")
runEnrichment(MDD_DG_FDR, "DG", "MDD")

runEnrichment(PTSD_CentralAmyg_FDR, "CentralAmyg", "PTSD")
runEnrichment(PTSD_mPFC_FDR, "mPFC", "PTSD")
runEnrichment(PTSD_DG_FDR, "DG", "PTSD")

runEnrichment(PTSD_MDD_CentralAmyg_FDR, "CentralAmyg", "PTSD_MDD")
runEnrichment(PTSD_MDD_mPFC_FDR, "mPFC", "PTSD_MDD")
runEnrichment(PTSD_MDD_DG_FDR, "DG", "PTSD_MDD")

