library(plyr)

extract_FKBP5_y12 <- function(meth_file){
  FKBP5_Methylation <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_Methylation.RDS")
  df <- readRDS(meth_file)
  df <- df[rownames(df) %in% FKBP5_Methylation$CPG,]
  df <- as.data.frame(t(df))
  names(df) <- paste0("Methylation_", names(df))
  df$SampleID <- rownames(df)

  anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")

  df <- merge(df, anno[c("SampleID","BrNum","Brain_Region","Year")], by="SampleID", all.x=T)
  df <- df[ , -which(names(df) %in% c("SampleID"))]
  df <- df %>%
    dplyr::select(BrNum, Brain_Region, Year, everything())
  return(df)
}

extract_FKBP5_y3 <- function(meth_file, region){
  FKBP5_Methylation <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_Methylation.RDS")
  df <- readRDS(meth_file)
  df <- df[rownames(df) %in% FKBP5_Methylation$CPG,]
  df <- as.data.frame(t(df))
  names(df) <- paste0("Methylation_", names(df))
  df$BrNum <- rownames(df)
  
  anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
  
  anno <- anno[anno$Brain_Region==region,]
  df <- merge(df, anno[c("SampleID","BrNum","Brain_Region","Year")], by="BrNum", all.x=T)
  df <- df[ , -which(names(df) %in% c("SampleID"))]
  df <- df %>%
    dplyr::select(BrNum, Brain_Region, Year, everything())
  return(df)
}



fkbp5_CA_Y1Y2 <- extract_FKBP5_y12("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/CentralAmygMfunnorm.RDS")
fkbp5_DG_Y1Y2 <- extract_FKBP5_y12("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/DGMfunnorm.RDS")
fkbp5_mPFC_Y1Y2 <- extract_FKBP5_y12("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/mPFCMfunnorm.RDS")

fkbp5_CA_Y3 <- extract_FKBP5_y3("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/CentralAmygMfunnorm.RDS", "CentralAmyg")
fkbp5_DG_Y3 <- extract_FKBP5_y3("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/DGMfunnorm.RDS", "DG")
fkbp5_mPFC_Y3 <- extract_FKBP5_y3("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/mPFCMfunnorm.RDS", "mPFC")

fkbp5_Methylation <- rbind.fill(fkbp5_CA_Y1Y2,fkbp5_DG_Y1Y2,fkbp5_mPFC_Y1Y2,
                            fkbp5_CA_Y3,fkbp5_DG_Y3,fkbp5_mPFC_Y3)

saveRDS(fkbp5_Methylation, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_Methylation.RDS")
