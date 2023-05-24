prep_expr_gene <- function(expr_file){
  elist <- readRDS(expr_file)
  expr <- as.data.frame(elist$E)
  gene_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/RNA_Gene_Map.RDS")
  expr$genes <- rownames(expr)
  expr <- merge(expr,gene_map,by="genes",all.x=T)
  
  return(expr)
}

extract_gene <- function(expr, gene_name){
  if(startsWith(x = gene_name, prefix = "ENSG")){
    expr <- expr[expr$genes==gene_name,]
    rownames(expr) <- expr$genes
    expr <- expr[,-which(names(expr) %in% c("genes","symbol"))]
    expr <- as.data.frame(t(expr))

  }else{
    expr <- expr[expr$symbol==gene_name,]
    rownames(expr) <- expr$symbol
    expr <- expr[,-which(names(expr) %in% c("genes","symbol"))]
    expr <- as.data.frame(t(expr))
  }
  
  return(expr)
}

extract_gene_by_year <- function(gene_name, year){
  ca <- prep_expr_gene(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/", year, "/VoomCentralAmyg.RDS"))
  dg <- prep_expr_gene(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/", year, "/VoomDG.RDS"))
  mpfc <- prep_expr_gene(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/", year, "/VoommPFC.RDS"))
  
  ca <- extract_gene(ca, gene_name)
  dg <- extract_gene(dg, gene_name)
  mpfc <- extract_gene(mpfc, gene_name)
  
  expr <- rbind(ca,dg,mpfc)
  return(expr)
}

extract_rna_gene <- function(gene_name, year, save=NULL){
  if (toupper(year)=="Y1Y2"){
    expr <- extract_gene_by_year(gene_name, "Y1Y2")
  }else if (toupper(year)=="Y3"){
    expr <- extract_gene_by_year(gene_name, "Y3")
  }else if (toupper(year)=="ALL"){
    expr_y1y2 <- extract_gene_by_year(gene_name, "Y1Y2")
    expr_y3 <- extract_gene_by_year(gene_name, "Y3")
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

# fkbp5_y1y2 <- extract_rna_gene("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
# fkbp5_y3 <- extract_rna_gene("FKBP5", "Y3")
# fkbp5_all <- extract_rna_gene("FKBP5", "All")
