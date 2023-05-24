library(bigreadr)

ptsd <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/PRS/PTSD3_PRS_FIN2.profile")
mdd <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/PRS/MDDH_MVP_PRS_FIN.profile")

brmap <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/brnum2genoID_Y1234.tab",header=F)
names(brmap) <- c("BrNum", "IID", "Year")
ptsd <- merge(ptsd, brmap, by="IID", all.x=T)
mdd <- merge(mdd, brmap, by="IID", all.x=T)


ptsd <- ptsd[c("BrNum", "SCORESUM")]
mdd <- mdd[c("BrNum", "SCORESUM")]

names(ptsd) <- c("BrNum", "PRS_PTSD")
names(mdd) <- c("BrNum", "PRS_MDD")

prs <- merge(ptsd,mdd,by="BrNum")
fkbp5 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withGeno.RDS")
fkbp5 <- fkbp5[,1:(ncol(fkbp5)-4)]
prs <- prs[prs$BrNum %in% unique(fkbp5$BrNum),]

prs$PRS_PTSD_standard <- as.numeric(scale(prs$PRS_PTSD))
prs$PRS_MDD_standard <- as.numeric(scale(prs$PRS_MDD))

library(ggplot2)
ggplot(prs, aes(x=PRS_PTSD)) + geom_density()
ggplot(prs, aes(x=PRS_PTSD_standard)) + geom_density()
ggplot(prs, aes(x=PRS_MDD_standard)) + geom_density()

fkbp5 <- merge(fkbp5, prs, by="BrNum", all.x=T)
saveRDS(fkbp5,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withPRS.RDS")
library(writexl)
write_xlsx(fkbp5,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5_withPRS.xlsx")

