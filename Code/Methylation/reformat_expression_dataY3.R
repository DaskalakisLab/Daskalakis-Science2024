library(bigreadr)

meth_ca <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/AmyMfunnorm.csv")
rownames(meth_ca) <- meth_ca$V1
meth_ca <- meth_ca[, 2:ncol(meth_ca)]

meth_dg <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/HippMfunnorm.csv")
rownames(meth_dg) <- meth_dg$V1
meth_dg <- meth_dg[, 2:ncol(meth_dg)]

meth_mpfc <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/mPFCMfunnorm.csv")
rownames(meth_mpfc) <- meth_mpfc$V1
meth_mpfc <- meth_mpfc[, 2:ncol(meth_mpfc)]

brmap <- fread2("/data/humgen/daskalakislab/jajoo/TACC/DNAmethylation/Year3Link/methylation_data_dictionary_with_some_demographic_data.newdata.csv")
brmap$MethID <- paste0(brmap$Slide, "_",brmap$Array)

for (col in names(meth_ca)){
  names(meth_ca)[names(meth_ca)==col] <- brmap[brmap$MethID==col,"BrNum"]
}
for (col in names(meth_dg)){
  names(meth_dg)[names(meth_dg)==col] <- brmap[brmap$MethID==col,"BrNum"]
}
for (col in names(meth_mpfc)){
  names(meth_mpfc)[names(meth_mpfc)==col] <- brmap[brmap$MethID==col,"BrNum"]
}

saveRDS(meth_ca, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/CentralAmygMfunnorm.RDS")
saveRDS(meth_dg, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/DGMfunnorm.RDS")
saveRDS(meth_mpfc, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y3/mPFCMfunnorm.RDS")
