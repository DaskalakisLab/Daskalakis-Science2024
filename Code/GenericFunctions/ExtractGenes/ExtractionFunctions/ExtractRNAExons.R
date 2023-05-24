prep_expr_exon <- function(expr_file){
  elist <- readRDS(expr_file)
  expr <- as.data.frame(elist$E)
  exon_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/exon_map_with_index.RDS")
  expr$exon <- rownames(expr)
  expr <- merge(expr,exon_map,by="exon",all.x=T)
  expr[is.na(expr$symbol), "symbol"] <- expr[is.na(expr$symbol), "exon"]
  
  return(expr)
}

extract_exon <- function(expr, exon_name){
  if(startsWith(x = exon_name, prefix = "e")){
    expr <- expr[expr$exon==exon_name,]
    rownames(expr) <- expr$exon
    expr <- expr[,-which(names(expr) %in% c("exon","symbol","idx"))]
    expr <- as.data.frame(t(expr))
    
  }else{
    expr <- expr[expr$symbol==exon_name,]
    rownames(expr) <- paste0(expr$exon, "_", expr$symbol)
    expr <- expr[,-which(names(expr) %in% c("exon","symbol","idx"))]
    expr <- as.data.frame(t(expr))
  }
  
  return(expr)
}

extract_exon_by_year <- function(exon_name, year){
  ca <- prep_expr_exon(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/", year, "/VoomCentralAmyg.RDS"))
  dg <- prep_expr_exon(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/", year, "/VoomDG.RDS"))
  mpfc <- prep_expr_exon(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/", year, "/VoommPFC.RDS"))
  
  ca <- extract_exon(ca, exon_name)
  dg <- extract_exon(dg, exon_name)
  mpfc <- extract_exon(mpfc, exon_name)
  
  expr <- rbind(ca,dg,mpfc)
  return(expr)
}

extract_rna_exon <- function(exon_name, year, save=NULL){
  if (toupper(year)=="Y1Y2"){
    expr <- extract_exon_by_year(exon_name, "Y1Y2")
  }else if (toupper(year)=="Y3"){
    expr <- extract_exon_by_year(exon_name, "Y3")
  }else if (toupper(year)=="ALL"){
    expr_y1y2 <- extract_exon_by_year(exon_name, "Y1Y2")
    expr_y3 <- extract_exon_by_year(exon_name, "Y3")
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



# fkbp5_y1y2 <- extract_rna_exon("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
# fkbp5_y3 <- extract_rna_exon("FKBP5", "Y3")
# fkbp5_all <- extract_rna_exon("FKBP5", "All")
