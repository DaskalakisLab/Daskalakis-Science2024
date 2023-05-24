prep_expr_meth <- function(expr_file){
  
  expr <- readRDS(expr_file)
  meth_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/CPGMap/cpgMap.RDS")
  expr$cpg <- rownames(expr)
  expr <- merge(expr,meth_map,by="cpg",all.x=T)
  
  return(expr)
}

extract_meth_name <- function(expr, meth_name){
  if(startsWith(x = meth_name, prefix = "ENSG")){
    expr <- expr[expr$cpg==meth_name,]
    rownames(expr) <- expr$cpg
    expr <- expr[,-which(names(expr) %in% c("cpg","symbol"))]
    expr <- as.data.frame(t(expr))
    
  }else{
    expr <- expr[expr$symbol==meth_name,]
    rownames(expr) <- paste0(expr$cpg, "_", expr$symbol)
    expr <- expr[,-which(names(expr) %in% c("cpg","symbol"))]
    expr <- as.data.frame(t(expr))
  }
  
  return(expr)
}

extract_meth <- function(meth_name, save=NULL){

  ca <- prep_expr_meth("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/CentralAmygMfunnorm.RDS")
  dg <- prep_expr_meth("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/DGMfunnorm.RDS")
  mpfc <- prep_expr_meth("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/mPFCMfunnorm.RDS")
  
  ca <- extract_meth_name(ca, meth_name)
  dg <- extract_meth_name(dg, meth_name)
  mpfc <- extract_meth_name(mpfc, meth_name)

  expr <- dplyr::bind_rows(ca,dg,mpfc)
  expr <- as.data.frame(expr)
  
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

# fkbp5_y1y2 <- extract_meth("FKBP5", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
# fkbp5_y1y2 <- extract_meth("FKBP5")

