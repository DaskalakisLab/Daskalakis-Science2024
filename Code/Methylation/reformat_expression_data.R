library(bigreadr)

meth_ca <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/CentralAmygMfunnorm.csv")
rownames(meth_ca) <- meth_ca$V1
meth_ca <- meth_ca[, 2:ncol(meth_ca)]

meth_dg <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/DGMfunnorm.csv")
rownames(meth_dg) <- meth_dg$V1
meth_dg <- meth_dg[, 2:ncol(meth_dg)]

meth_mpfc <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/mPFCMfunnorm.csv")
rownames(meth_mpfc) <- meth_mpfc$V1
meth_mpfc <- meth_mpfc[, 2:ncol(meth_mpfc)]



name_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/BrNumMapping/Y1Y2BrNumMap.RDS")


#name_map <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/DNAmsWithDemo.csv")
anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
name_map$mergeID <- paste0(name_map$BrNum, "_", name_map$Brain_Region)
anno$mergeID <- paste0(anno$BrNum, "_", anno$Brain_Region)

name_map <- merge(name_map, anno[,c("mergeID", "SampleID")], by="mergeID",all.x=T)


for (i in 1:length(names(meth_ca))){
  print(names(meth_ca)[i])
  names(meth_ca)[i] <- name_map[name_map$MethID==names(meth_ca)[i],"SampleID"]
}

for (i in 1:length(names(meth_dg))){
  print(names(meth_dg)[i])
  names(meth_dg)[i] <- name_map[name_map$MethID==names(meth_dg)[i],"SampleID"]
}

for (i in 1:length(names(meth_mpfc))){
  print(names(meth_mpfc)[i])
  names(meth_mpfc)[i] <- name_map[name_map$MethID==names(meth_mpfc)[i],"SampleID"]
}

saveRDS(meth_ca, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/CentralAmygMfunnorm.RDS")
saveRDS(meth_dg, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/DGMfunnorm.RDS")
saveRDS(meth_mpfc, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/AartiNormalized/Y1Y2/mPFCMfunnorm.RDS")
