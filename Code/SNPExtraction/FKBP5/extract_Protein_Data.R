extract_FKBP5 <- function(tamp_file, year, region){
  FKBP5_Protein <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_Protein.RDS")
  df <- readRDS(tamp_file)
  df <- df[rownames(df) %in% FKBP5_Protein$Protein,]
  df <- as.data.frame(t(df))
  names(df) <- paste0("Protein_", names(df))
  df$BrNum <- rownames(df)
  if (year == "Y1Y2"){
    anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
  }
  if (year == "Y3"){
    anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
  }
  anno <- anno[anno$Brain_Region==region,]
  df <- merge(df, anno[c("SampleID","BrNum","Brain_Region","Year")], by="BrNum", all.x=T)
  df <- df[ , -which(names(df) %in% c("SampleID"))]
  df <- df %>%
    dplyr::select(BrNum, Brain_Region, Year, everything())
  return(df)
}

fkbp5_CA_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_CentralAmyg_clean_no_GIS.RDS", "Y1Y2", "CentralAmyg")
fkbp5_DG_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_DG_clean_no_GIS.RDS", "Y1Y2", "DG")
fkbp5_mPFC_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_mPFC_clean_no_GIS.RDS", "Y1Y2", "mPFC")

fkbp5_CA_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_CentralAmyg_clean_no_GIS.RDS", "Y3", "CentralAmyg")
fkbp5_DG_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_CentralAmyg_clean_no_GIS.RDS", "Y3", "DG")
fkbp5_mPFC_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_CentralAmyg_clean_no_GIS.RDS", "Y3", "mPFC")

fkbp5_Protein <- rbind(fkbp5_CA_Y1Y2,fkbp5_DG_Y1Y2,fkbp5_mPFC_Y1Y2,
                    fkbp5_CA_Y3,fkbp5_DG_Y3,fkbp5_mPFC_Y3)

saveRDS(fkbp5_Protein, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_Protein.RDS")
