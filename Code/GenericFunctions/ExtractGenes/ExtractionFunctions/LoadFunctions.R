extract_dir <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenericFunctions/ExtractGenes/ExtractionFunctions/"
extraction_functions <- list.files(extract_dir)
extraction_functions <- extraction_functions[!extraction_functions=="LoadFunctions.R"]
for (f in extraction_functions){
  source(paste0(extract_dir,f))
}
rm(extract_dir,extraction_functions,f)