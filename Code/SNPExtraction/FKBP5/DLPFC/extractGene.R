extract_FKBP5 <- function(voom_file){
  FKBP5_RNA_Gene <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_RNA_Gene.RDS")
  df <- readRDS(voom_file)
  df <- as.data.frame(df$E)
  df <- df[rownames(df) %in% FKBP5_RNA_Gene$Gene,]
  df <- as.data.frame(t(df))
  names(df) <- "RNA_Gene_FKBP5"
  df$SampleID <- rownames(df)
  df <- df[,c("SampleID","RNA_Gene_FKBP5")]
  anno <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")
  
  df <- merge(df, anno[c("SampleID","BrNum","Brain_Region")], by="SampleID", all.x=T)
  df <- df[,c("BrNum","Brain_Region","RNA_Gene_FKBP5")]
  return(df)
}

fkbp5_Gene <- extract_FKBP5(voom_file="~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Genes/VoomDLPFC231.RDS")

saveRDS(fkbp5_Gene, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/DLPFC/FKBP5_RNA_Gene.RDS")
