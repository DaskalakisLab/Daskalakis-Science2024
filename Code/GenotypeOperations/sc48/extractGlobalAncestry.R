library(bigreadr)

brnum_map <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/kleinman_single_cell_n82.brnum2genoID.tab",header=F)
names(brnum_map) <- c("BrNum", "IID")

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenotypeOperations/global_ancestry-master/ancestry/"

sc48 <- fread2(paste0(wd,"kleinman_single_cell_n48.maf01.rsids.predpc_oneweek.header"))
names(sc48)[names(sc48)=="bestpop_oneweek"] <- "bestpop"
sc48 <- sc48[,c("IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
sc48 <- merge(sc48, brnum_map, by="IID", all.x=T)
sc48 <- sc48[,c("BrNum","IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
saveRDS(sc48,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/sc48/GlobalAncestry_sc48.RDS")
