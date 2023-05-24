df <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withPRS.RDS")

pc12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/PCA/Y1Y2/PCA_Y1Y2.RDS")
pc3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/PCA/Y3/PCA_Y3.RDS")

pc12 <- pc12[,c("BrNum","PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10")]
pc3 <- pc3[,c("BrNum","PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10")]
pcs <- rbind(pc12,pc3)

df <- merge(df,pcs, by="BrNum",all.x=T)
saveRDS(df, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withPCs.RDS")
library(writexl)
write_xlsx(df,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withPCs.xlsx")

