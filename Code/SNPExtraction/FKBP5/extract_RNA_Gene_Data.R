extract_FKBP5 <- function(voom_file, year){
  FKBP5_RNA_Gene <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_RNA_Gene.RDS")
  df <- readRDS(voom_file)
  df <- as.data.frame(df$E)
  df <- df[rownames(df) %in% FKBP5_RNA_Gene$Gene,]
  df <- as.data.frame(t(df))
  names(df) <- "RNA_Gene_FKBP5"
  df$SampleID <- rownames(df)
  df <- df[,c("SampleID","RNA_Gene_FKBP5")]
  if (year == "Y1Y2"){
    anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
  }
  if (year == "Y3"){
    anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
  }
  df <- merge(df, anno[c("SampleID","BrNum","Brain_Region","Year")], by="SampleID", all.x=T)
  df <- df[,c("BrNum","Brain_Region","Year","RNA_Gene_FKBP5")]
  return(df)
}

fkbp5_CA_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoomCentralAmyg.RDS", "Y1Y2")
fkbp5_DG_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoomDG.RDS", "Y1Y2")
fkbp5_mPFC_Y1Y2 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoommPFC.RDS", "Y1Y2")

fkbp5_CA_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/VoomCentralAmyg.RDS", "Y3")
fkbp5_DG_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/VoomDG.RDS", "Y3")
fkbp5_mPFC_Y3 <- extract_FKBP5("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/VoommPFC.RDS", "Y3")

fkbp5_Gene <- rbind(fkbp5_CA_Y1Y2,fkbp5_DG_Y1Y2,fkbp5_mPFC_Y1Y2,
                   fkbp5_CA_Y3,fkbp5_DG_Y3,fkbp5_mPFC_Y3)

saveRDS(fkbp5_Gene, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_RNA_Gene.RDS")
