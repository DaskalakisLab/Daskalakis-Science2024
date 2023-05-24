library(readxl)
df <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SubanalysesArchive/Archive/subanalysisVars.xlsx")
df <- as.data.frame(df)
df <- df[,c("BrNum","Child trauma_0/1/2","Suicide_0/1/2")]
names(df) <- c("BrNum", "ChildTrauma012", "Suicide012")
df[df=="NA"] <- NA

anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")


anno12 <- merge(anno12, df, by="BrNum", all.x=T)
anno3 <- merge(anno3, df, by="BrNum", all.x=T)

saveRDS(anno12,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
saveRDS(anno3,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
