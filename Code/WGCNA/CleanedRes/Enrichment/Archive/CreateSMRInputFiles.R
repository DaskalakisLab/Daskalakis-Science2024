SMRDataForClouds <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/SMRDataForClouds.RDS")
names(SMRDataForClouds)

for (col in names(SMRDataForClouds)[2:length( names(SMRDataForClouds))]){
  print(col)
  genes <- SMRDataForClouds[SMRDataForClouds[[col]]==1,"Genes"]
  genes <- c(col, genes)
  lapply(genes, write, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/", col, ".txt"), append=TRUE, ncolumns=1000)
}
