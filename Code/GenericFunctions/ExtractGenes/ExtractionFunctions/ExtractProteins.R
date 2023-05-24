prep_expr_prot <- function(expr_file){
  expr <- readRDS(expr_file)
  expr$protein <- rownames(expr)
  expr$symbol <- gsub("\\|.*", "", expr$protein)
  
  return(expr)
}

extract_prot_name <- function(expr, prot_name, region){
  if(grepl("\\|", prot_name)){
    expr <- expr[expr$protein==prot_name,]
    rownames(expr) <- expr$protein
    expr <- expr[,-which(names(expr) %in% c("protein","symbol"))]
    expr <- as.data.frame(t(expr))
    expr$Brain_Region <- region
    
  }else{
    expr <- expr[expr$symbol==prot_name,]
    rownames(expr) <- expr$protein
    expr <- expr[,-which(names(expr) %in% c("protein","symbol"))]
    expr <- as.data.frame(t(expr))
    expr$Brain_Region <- region
  }
  
  return(expr)
}

extract_prot_by_year <- function(prot_name, year){
  ca <- prep_expr_prot(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/", year, "/Proteins/CleanedWithSampleIDs/", year, "_CentralAmyg_clean_no_GIS.RDS"))
  dg <- prep_expr_prot(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/", year, "/Proteins/CleanedWithSampleIDs/", year, "_DG_clean_no_GIS.RDS"))
  mpfc <- prep_expr_prot(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/", year, "/Proteins/CleanedWithSampleIDs/", year, "_mPFC_clean_no_GIS.RDS"))
  
  ca <- extract_prot_name(ca, prot_name, "CentralAmyg")
  dg <- extract_prot_name(dg, prot_name, "DG")
  mpfc <- extract_prot_name(mpfc, prot_name, "mPFC")
  
  expr <- rbind(ca,dg,mpfc)
  return(expr)
}

extract_prot <- function(prot_name, year, save=NULL){
  if (toupper(year)=="Y1Y2"){
    expr <- extract_prot_by_year(prot_name, "Y1Y2")
  }else if (toupper(year)=="Y3"){
    expr <- extract_prot_by_year(prot_name, "Y3")
  }else if (toupper(year)=="ALL"){
    expr_y1y2 <- extract_prot_by_year(prot_name, "Y1Y2")
    expr_y3 <- extract_prot_by_year(prot_name, "Y3")
    expr <- rbind(expr_y1y2, expr_y3)
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


# fkbp5_y1y2 <- extract_prot("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
# fkbp5_y3 <- extract_prot("FKBP5", "Y3")
# fkbp5_all <- extract_prot("FKBP5", "All")
