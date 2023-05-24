library(readxl)
df <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/Archive/subanalysisVars.xlsx")
df <- as.data.frame(df)
df <- df[,c("BrNum","Child trauma_0/1/2","Suicide_0/1/2")]
names(df) <- c("BrNum", "ChildTrauma012", "Suicide012")
df[df=="NA"] <- NA

anno48 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS")
anno231 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")


anno48 <- merge(anno48, df, by="BrNum", all.x=T)
anno231 <- merge(anno231, df, by="BrNum", all.x=T)

saveRDS(anno48,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS")
saveRDS(anno231,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")
