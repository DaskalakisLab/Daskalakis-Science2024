prep_expr_jx <- function(expr_file){
  elist <- readRDS(expr_file)
  expr <- as.data.frame(elist$E)
  jx_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/jx_map.RDS")
  expr$jx <- rownames(expr)
  expr <- merge(expr,jx_map,by="jx",all.x=T)
  expr[is.na(expr$symbol), "symbol"] <- expr[is.na(expr$symbol), "jx"]
  
  return(expr)
}

extract_jx <- function(expr, jx_name){
  if(startsWith(x = jx_name, prefix = "chr")){
    expr <- expr[expr$jx==jx_name,]
    rownames(expr) <- expr$jx
    expr <- expr[,-which(names(expr) %in% c("jx","symbol"))]
    expr <- as.data.frame(t(expr))
    
  }else{
    expr <- expr[expr$symbol==jx_name,]
    rownames(expr) <- paste0(expr$jx, "_", expr$symbol)
    expr <- expr[,-which(names(expr) %in% c("jx","symbol"))]
    expr <- as.data.frame(t(expr))
  }
  
  return(expr)
}

extract_jx_by_year <- function(jx_name, year){
  ca <- prep_expr_jx(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/", year, "/VoomCentralAmyg.RDS"))
  dg <- prep_expr_jx(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/", year, "/VoomDG.RDS"))
  mpfc <- prep_expr_jx(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/", year, "/VoommPFC.RDS"))
  
  ca <- extract_jx(ca, jx_name)
  dg <- extract_jx(dg, jx_name)
  mpfc <- extract_jx(mpfc, jx_name)
  
  expr <- rbind(ca,dg,mpfc)
  return(expr)
}

extract_rna_jx <- function(jx_name, year, save=NULL){
  if (toupper(year)=="Y1Y2"){
    expr <- extract_jx_by_year(jx_name, "Y1Y2")
  }else if (toupper(year)=="Y3"){
    expr <- extract_jx_by_year(jx_name, "Y3")
  }else if (toupper(year)=="ALL"){
    expr_y1y2 <- extract_jx_by_year(jx_name, "Y1Y2")
    expr_y3 <- extract_jx_by_year(jx_name, "Y3")
    expr <- rbind(expr_y1y2, expr_y3)
  }else{
    print("Invalid year selected, options: Y1Y2/Y3/All")
  }
  
  anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
  anno12 <- anno12[,c("SampleID", "BrNum", "Brain_Region")]
  anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
  anno3 <- anno3[,c("SampleID", "BrNum", "Brain_Region")]
  anno <- rbind(anno12, anno3)
  rm(anno12, anno3)
  expr$SampleID <- rownames(expr)
  
  expr <- merge(expr, anno, by="SampleID", all.x=T)
  
  expr <- expr %>%
    dplyr::select(SampleID, BrNum, Brain_Region, everything())
  
  if (is.null(save)){
    return(expr)
  }else{
    write.csv(expr, save, row.names = F, quote = F)
  }
  
}

# fkbp5_y1y2 <- extract_rna_jx("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
# fkbp5_y3 <- extract_rna_jx("FKBP5", "Y3")
# fkbp5_all <- extract_rna_jx("FKBP5", "All")
