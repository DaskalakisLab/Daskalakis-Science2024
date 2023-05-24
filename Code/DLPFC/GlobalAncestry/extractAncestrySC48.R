library(bigreadr)

brnum_map <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/O771_genotype_id_mapping.csv")
brnum_map <- brnum_map[c("BrNum","genotype_ID")]
names(brnum_map) <- c("BrNum", "IID")

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenotypeOperations/global_ancestry-master/ancestry/"

df <- fread2(paste0(wd,"SC48.predpc_oneweek.header"))
names(df)[names(df)=="bestpop_oneweek"] <- "bestpop"
df <- df[,c("IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
df <- merge(df, brnum_map, by="IID", all.x=T)
df <- df[,c("BrNum","IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","PC1","PC2","PC3","PC4","PC5")]
saveRDS(df,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/sc48DLPFC/GlobalAncestrySC48DLPFC.RDS")
