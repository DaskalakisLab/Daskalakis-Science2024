library(bigreadr)

brmap <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/brnum2genoID_Y1234.tab",header=F)
names(brmap) <- c("BrNum", "IID", "Year")

rs <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Genotype/rs1360780.raw")
rs <- merge(rs, brmap, by="IID", all.x=T)

rs <- rs[,c("BrNum", "rs1360780_T")]

saveRDS(rs,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Genotype/rs1360780.RDS")


rs <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Genotype/rs1360780.RDS")
fkbp5 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5.RDS")

fkbp5 <- merge(fkbp5, rs, by="BrNum", all.x = T)

saveRDS(fkbp5,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withGeno.RDS")
write.csv(fkbp5,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withGeno.csv", row.names = F, quote = F)
