#multiGSEA
library(org.Hs.eg.db)
library(dplyr)
library(multiGSEA)

run_multiGSEA <- function(disease, region, pathway){
  
  df_dx <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/", disease, "_", region,".RDS"))
  transcriptome <- df_dx %>%
    dplyr::select(symbol,  beta, pval, FDR)
  rm(df_dx)
  
  df_dx <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/", disease, "_", region,".RDS"))
  proteome <- df_dx %>%
    dplyr::select(symbol,  beta, pval, FDR) 
  rm(df_dx)
  
  # create data structure
  omics_data <- initOmicsDataStructure( layer = c("transcriptome", 
                                                  "proteome"))
  
  omics_data$transcriptome <- transcriptome$beta
  names( omics_data$transcriptome) <- transcriptome$symbol
  
  ## add proteome layer
  omics_data$proteome <- proteome$beta
  names(omics_data$proteome) <- proteome$symbol
  
  # databases <- c("reactome")
  layers <- names( omics_data)
  
  if (pathway == "GO"){
    pathways <- msigdbr(species = "Homo sapiens", category = "C5", subcategory = "GO:BP")
    fgsea_sets<- pathways %>% split(x = .$gene_symbol, f = .$gs_name)
    paths <- list(transcriptome = fgsea_sets, proteome = fgsea_sets)
  }else if (pathway == "REACTOME"){
    pathways <- msigdbr(species = "Homo sapiens", category = "C2", subcategory = "CP:REACTOME")
    fgsea_sets<- pathways %>% split(x = .$gene_symbol, f = .$gs_name)
    paths <- list(transcriptome = fgsea_sets, proteome = fgsea_sets)
  }else if (pathway == "synGO"){
    syngo_ontologies <- read_excel("/data/humgen/daskalakislab/aiatrou/Science/GSEA_TEST/syngo_ontologies.xlsx")
    list <- list(NA)
    for(i in 1:length(syngo_ontologies$id)){
      try <- syngo_ontologies$hgnc_symbol[i]
      list[[i]] <- unlist(strsplit(try,", "))
      
    }
    names(list) <- syngo_ontologies$name
    
    paths <- list(transcriptome = list, proteome = list)
    
  }
  
  # use the multiGSEA function to calculate the enrichment scores
  # for all omics layer at once.
  enrichment_scores <- multiGSEA(paths, omics_data)
  
  
  ## ----combine_pvalues----------------------------------------------------------
  
  df <- extractPvalues( enrichmentScores = enrichment_scores,
                        pathwayNames = names( paths[[1]]))
  
  df$combined_pval <- combinePvalues( df)
  df$combined_padj <- p.adjust( df$combined_pval, method = "BH")
  
  df <- cbind( data.frame( pathway = names( paths[[1]])), df)
  
  saveRDS(df, file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/MultiGSEA/",region,"/", pathway, "_", disease, "_", region, "_multi.RDS"))
  saveRDS(enrichment_scores, file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/MultiGSEA/",region,"/",  pathway, "_",disease, "_", region, "_multi_enrichment_scores.RDS"))
  
}

run_multiGSEA(disease="MDD", 
              region="CentralAmyg", 
              pathway="GO")


