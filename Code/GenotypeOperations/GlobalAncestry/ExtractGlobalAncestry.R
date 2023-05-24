library(bigreadr)

brnum_map <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/PTSD_n304.brnum2genoID.tab",header=F)
names(brnum_map) <- c("BrNum", "IID")

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenotypeOperations/global_ancestry-master/ancestry/"

y1y2 <- fread2(paste0(wd,"PTSD_Y1Y2_n150.maf01.rsids.predpc_oneweek.header"))
names(y1y2)[names(y1y2)=="bestpop_oneweek"] <- "bestpop"
y1y2 <- y1y2[,c("IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
y1y2 <- merge(y1y2, brnum_map, by="IID", all.x=T)
y1y2 <- y1y2[,c("BrNum","IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
saveRDS(y1y2,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/Y1Y2/GlobalAncestryY1Y2.RDS")

y3 <- fread2(paste0(wd,"PTSD_Y3_n81.maf01.rsids.predpc_oneweek.header"))
names(y3)[names(y3)=="bestpop_oneweek"] <- "bestpop"
y3 <- y3[,c("IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
y3 <- merge(y3, brnum_map, by="IID", all.x=T)
y3 <- y3[,c("BrNum","IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
saveRDS(y3,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/Y3/GlobalAncestryY3.RDS")

y1y2y3y4 <- fread2(paste0(wd,"PTSD_n304.maf01.rsids.predpc_oneweek.header"))
names(y1y2y3y4)[names(y1y2y3y4)=="bestpop_oneweek"] <- "bestpop"
y1y2y3y4 <- y1y2y3y4[,c("IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
y1y2y3y4 <- merge(y1y2y3y4, brnum_map, by="IID", all.x=T)
y1y2y3y4 <- y1y2y3y4[,c("BrNum","IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
saveRDS(y1y2y3y4,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/Y1Y2Y3Y4/GlobalAncestryY1Y2Y3Y4.RDS")
