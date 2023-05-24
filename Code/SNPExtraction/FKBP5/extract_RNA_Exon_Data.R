library(dplyr)

extract_FKBP5 <- function(voom_file, year){
  FKBP5_RNA_Exon <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_RNA_Exon.RDS")
  df <- readRDS(voom_file)
  df <- as.data.frame(df$E)
  df <- df[rownames(df) %in% FKBP5_RNA_Exon$Exon,]
  df <- as.data.frame(t(df))
  names(df) <- paste0("RNA_Exon_",names(df),"_","FKBP5")
  df$SampleID <- rownames(df)
  if (year == "Y1Y2"){
    anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
  }
  if (year == "Y3"){
    anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
  }
  df <- merge(df, anno[c("SampleID","BrNum","Brain_Region","Year")], by="SampleID", all.x=T)
  df <- df[ , -which(names(df) %in% c("SampleID"))]
  df <- df %>%
    dplyr::select(BrNum, Brain_Region, Year, everything())
  return(df)
}

fkbp5_CA_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoomCentralAmyg.RDS", "Y1Y2")
fkbp5_DG_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoomDG.RDS", "Y1Y2")
fkbp5_mPFC_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoommPFC.RDS", "Y1Y2")

fkbp5_CA_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/VoomCentralAmyg.RDS", "Y3")
fkbp5_DG_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/VoomDG.RDS", "Y3")
fkbp5_mPFC_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/VoommPFC.RDS", "Y3")

fkbp5_Exon <- rbind(fkbp5_CA_Y1Y2,fkbp5_DG_Y1Y2,fkbp5_mPFC_Y1Y2,
                   fkbp5_CA_Y3,fkbp5_DG_Y3,fkbp5_mPFC_Y3)

saveRDS(fkbp5_Exon, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_RNA_Exon.RDS")
