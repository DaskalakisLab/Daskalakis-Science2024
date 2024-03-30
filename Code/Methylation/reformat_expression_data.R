library(bigreadr)

meth_ca <- fread2("/path/to/batch1/CentralAmygMfunnorm.csv")
rownames(meth_ca) <- meth_ca$V1
meth_ca <- meth_ca[, 2:ncol(meth_ca)]

meth_dg <- fread2("/path/to/batch1/DGMfunnorm.csv")
rownames(meth_dg) <- meth_dg$V1
meth_dg <- meth_dg[, 2:ncol(meth_dg)]

meth_mpfc <- fread2("/path/to/batch1/mPFCMfunnorm.csv")
rownames(meth_mpfc) <- meth_mpfc$V1
meth_mpfc <- meth_mpfc[, 2:ncol(meth_mpfc)]



name_map <- readRDS("/path/to/Methylation/BrNumMapping/batch1BrNumMap.RDS")


#name_map <- fread2("/path/to/Methylation/DNAmsWithDemo.csv")
anno <- readRDS("/path/to/Annotation/Annotation_batch1.RDS")
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

saveRDS(meth_ca, "/path/to/batch1/CentralAmygMfunnorm.RDS")
saveRDS(meth_dg, "/path/to/batch1/DGMfunnorm.RDS")
saveRDS(meth_mpfc, "/path/to/batch1/mPFCMfunnorm.RDS")
