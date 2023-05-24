prep_expr_tx <- function(expr_file){
  expr <- readRDS(expr_file)
  tx_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/tx_map.RDS")
  expr$tx <- rownames(expr)
  expr <- merge(expr,tx_map,by="tx",all.x=T)
  expr[is.na(expr$symbol), "symbol"] <- expr[is.na(expr$symbol), "tx"]
  
  return(expr)
}

extract_tx <- function(expr, tx_name){
  if(startsWith(x = tx_name, prefix = "ENST")){
    expr <- expr[expr$tx==tx_name,]
    rownames(expr) <- expr$tx
    expr <- expr[,-which(names(expr) %in% c("tx","symbol"))]
    expr <- as.data.frame(t(expr))
    
  }else{
    expr <- expr[expr$symbol==tx_name,]
    rownames(expr) <- paste0(expr$tx, "_", expr$symbol)
    expr <- expr[,-which(names(expr) %in% c("tx","symbol"))]
    expr <- as.data.frame(t(expr))
  }
  
  return(expr)
}

extract_tx_by_year <- function(tx_name, year){
  ca <- prep_expr_tx(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/", year, "/log2TMM1_CentralAmyg.RDS"))
  dg <- prep_expr_tx(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/", year, "/log2TMM1_DG.RDS"))
  mpfc <- prep_expr_tx(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/", year, "/log2TMM1_mPFC.RDS"))
  
  ca <- extract_tx(ca, tx_name)
  dg <- extract_tx(dg, tx_name)
  mpfc <- extract_tx(mpfc, tx_name)
  
  expr <- rbind(ca,dg,mpfc)
  return(expr)
}

extract_rna_tx <- function(tx_name, year, save=NULL){
  if (toupper(year)=="Y1Y2"){
    expr <- extract_tx_by_year(tx_name, "Y1Y2")
  }else if (toupper(year)=="Y3"){
    expr <- extract_tx_by_year(tx_name, "Y3")
  }else if (toupper(year)=="ALL"){
    expr_y1y2 <- extract_tx_by_year(tx_name, "Y1Y2")
    expr_y3 <- extract_tx_by_year(tx_name, "Y3")
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


# fkbp5_y1y2 <- extract_rna_tx("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
# fkbp5_y3 <- extract_rna_tx("FKBP5", "Y3")
# fkbp5_all <- extract_rna_tx("FKBP5", "All")
