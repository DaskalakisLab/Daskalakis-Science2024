library(dplyr)

extract_FKBP5 <- function(voom_file, year){
  FKBP5_RNA_Tx <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_RNA_Tx.RDS")
  df <- readRDS(voom_file)
  df <- df[rownames(df) %in% FKBP5_RNA_Tx$Tx,]
  df <- as.data.frame(t(df))
  names(df) <- paste0("RNA_Tx_", names(df),"_","FKBP5")
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

fkbp5_CA_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_CentralAmyg.RDS", "Y1Y2")
fkbp5_DG_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_DG.RDS", "Y1Y2")
fkbp5_mPFC_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_mPFC.RDS", "Y1Y2")

fkbp5_CA_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_CentralAmyg.RDS", "Y3")
fkbp5_DG_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_DG.RDS", "Y3")
fkbp5_mPFC_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_mPFC.RDS", "Y3")

fkbp5_Tx <- rbind(fkbp5_CA_Y1Y2,fkbp5_DG_Y1Y2,fkbp5_mPFC_Y1Y2,
                  fkbp5_CA_Y3,fkbp5_DG_Y3,fkbp5_mPFC_Y3)

saveRDS(fkbp5_Tx, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_RNA_Tx.RDS")
