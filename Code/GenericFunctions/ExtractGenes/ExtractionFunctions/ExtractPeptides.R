prep_expr_pep <- function(expr_file){
  expr <- readRDS(expr_file)
  expr$peptide <- rownames(expr)
  expr$symbol <- gsub("\\|.*", "", expr$peptide)
  
  return(expr)
}

extract_pep_name <- function(expr, pep_name, region){
  if(grepl("\\|", pep_name)){
    expr <- expr[expr$peptide==pep_name,]
    rownames(expr) <- expr$peptide
    expr <- expr[,-which(names(expr) %in% c("peptide","symbol"))]
    expr <- as.data.frame(t(expr))
    expr$Brain_Region <- region
    
  }else{
    expr <- expr[expr$symbol==pep_name,]
    rownames(expr) <- expr$peptide
    expr <- expr[,-which(names(expr) %in% c("peptide","symbol"))]
    expr <- as.data.frame(t(expr))
    expr$Brain_Region <- region
  }
  
  return(expr)
}

extract_pep_by_year <- function(pep_name, year){
  ca <- prep_expr_pep(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/", year, "/Peptides/CleanWithSampleIDs/", year, "_CentralAmyg_clean_no_GIS.RDS"))
  dg <- prep_expr_pep(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/", year, "/Peptides/CleanWithSampleIDs/", year, "_DG_clean_no_GIS.RDS"))
  mpfc <- prep_expr_pep(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/", year, "/Peptides/CleanWithSampleIDs/", year, "_mPFC_clean_no_GIS.RDS"))
  
  ca <- extract_pep_name(ca, pep_name, "CentralAmyg")
  dg <- extract_pep_name(dg, pep_name, "DG")
  mpfc <- extract_pep_name(mpfc, pep_name, "mPFC")
  
  expr <- rbind(ca,dg,mpfc)
  return(expr)
}

extract_pep <- function(pep_name, year, save=NULL){
  if (toupper(year)=="Y1Y2"){
    expr <- extract_pep_by_year(pep_name, "Y1Y2")
  }else if (toupper(year)=="Y3"){
    expr <- extract_pep_by_year(pep_name, "Y3")
  }else if (toupper(year)=="ALL"){
    expr_y1y2 <- extract_pep_by_year(pep_name, "Y1Y2")
    expr_y3 <- extract_pep_by_year(pep_name, "Y3")
    expr <- dplyr::bind_rows(expr_y1y2, expr_y3)
  }else{
    print("Invalid year selected, options: Y1Y2/Y3/All")
  }
  
  expr$BrNum <- rownames(expr)
  expr <- expr %>%
    dplyr::select(BrNum, Brain_Region, everything())
  
  if (is.null(save)){
    return(expr)
  }else{
    write.csv(expr, save, row.names = F, quote = F)
  }
  
}


# fkbp5_y1y2 <- extract_pep("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
# fkbp5_y3 <- extract_pep("FKBP5", "Y3")
# fkbp5_all <- extract_pep("FKBP5", "All")
