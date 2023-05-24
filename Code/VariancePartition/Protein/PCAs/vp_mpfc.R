library(variancePartition)

prepare_norm <- function(norm,anno){
  batch_designs <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Proteomics/batch_designs.RDS")
  
  batch_designs <- as.data.frame(batch_designs)
  batch_designs$Plate <- gsub("F", "", batch_designs$Plate)
  batch_designs$Plate <- sprintf("%02d", as.numeric(batch_designs$Plate))
  batch_designs$ID <- paste0("b",batch_designs$Plate, ".", batch_designs$Position)
  
  batch_designs <- merge(batch_designs, anno[,c("BrNum","SampleID","Brain_Region_Protein")], by.x=c("BrNum", "Brain_Region"), by.y=c("BrNum", "Brain_Region_Protein"), all.x=T)
  batch_designs[batch_designs$BrNum=="GIS","SampleID"] <- batch_designs[batch_designs$BrNum=="GIS","ID"]
  norm <- as.data.frame(norm)
  for (id in names(norm)){
    print(id)
    names(norm)[names(norm)==id] <- batch_designs[batch_designs$ID == id,"SampleID"]
  }
  names(norm)
  norm <- norm[,startsWith(names(norm), "R")]
  #norm <- as.matrix(norm)
  return(norm)
}



# # To see which are categorical and which are continuous
# info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_All.RDS")
# covs <- c("BrNum","SampleID","Brain_Region","AgeDeath","Sex","PMI","Dx","PTSD",
#           "MDD","Control","BMI","Astro","Endo","Macro","Micro","Mural","Oligo",
#           "OPC","Tcell","Excit","Inhib","europe","oceania","africa","americas",
#           "cs_asia","e_asia","RIN","mitoRate","rRNA_rate","totalAssignedGene",
#           "Psychosis","Smoking","Delusions","Hallucinations","Lifetime Anticonvulsant",
#           "Lifetime Antidepress","Lifetime Antipsych","Lifetime Lithium","Manner Of Death",
#           "Past Self Mutilation","Past Suicide Attempts","Flashbacks","Intrusive thoughts",
#           "Reliving","Detachment","Dissociation")
# 
# for (cov in covs){
#   print(cov)
#   print(head(info[[cov]]))
# }
# rm(cov, covs, info)

scale_cont <- function(info){
  info$AgeDeath <- scale(info$AgeDeath)[,1]
  #info$AgeDeath2 <- scale(info$AgeDeath2)[,1]
  info$PMI <- scale(info$PMI)[,1]
  info$BMI <- scale(info$BMI)[,1]
  info$Macroglia <- scale(info$Macroglia)[,1]
  info$ex <- scale(info$ex)[,1]
  info$`in` <- scale(info$`in`)[,1]
  info$immune <- scale(info$immune)[,1]
  info$europe <- scale(info$europe)[,1]
  info$oceania <- scale(info$oceania)[,1]
  info$africa <- scale(info$africa)[,1]
  info$americas <- scale(info$americas)[,1]
  info$cs_asia <- scale(info$cs_asia)[,1]
  info$e_asia <- scale(info$e_asia)[,1]
  info$RIN <- scale(info$RIN)[,1]
  info$numReads <- scale(info$numReads)[,1]
  info$numMapped <- scale(info$numMapped)[,1]
  info$numUnmapped <- scale(info$numUnmapped)[,1]
  info$overallMapRate <- scale(info$overallMapRate)[,1]
  info$concordMapRate <- scale(info$concordMapRate)[,1]
  info$totalMapped <- scale(info$totalMapped)[,1]
  info$mitoMapped <- scale(info$mitoMapped)[,1]
  info$mitoRate <- scale(info$mitoRate)[,1]
  info$totalAssignedGene <- scale(info$totalAssignedGene)[,1]
  info$rRNA_rate <- scale(info$rRNA_rate)[,1]
  info$ProtPC1 <- scale(info$ProtPC1)[,1]
  info$ProtPC2 <- scale(info$ProtPC2)[,1]
  info$ProtPC3 <- scale(info$ProtPC3)[,1]
  info$ProtPC4 <- scale(info$ProtPC4)[,1]
  info$ProtPC5 <- scale(info$ProtPC5)[,1]
  info$ancestryPC1 <- scale(info$ancestryPC1)[,1]
  info$ancestryPC2 <- scale(info$ancestryPC2)[,1]
  info$ancestryPC3 <- scale(info$ancestryPC3)[,1]
  info$ancestryPC4 <- scale(info$ancestryPC4)[,1]
  info$ancestryPC5 <- scale(info$ancestryPC5)[,1]
  
  return(info)
}


form1 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`europe`+`americas`+`cs_asia`+`e_asia`+
  `ProtPC1`+`ProtPC2`+`ProtPC3`+`ProtPC4`+`ProtPC5`+
  `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
  `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

form2 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`PC1`+`PC2`+`PC3`+`PC4`+`PC5`+
  `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
  `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

form3 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`ancestryPC1`+`ancestryPC2`+`ancestryPC3`+`ancestryPC4`+`ancestryPC5`+
  `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
  `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

info_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_CentralAmyg.RDS")
info_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_DG.RDS")
info_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_mPFC.RDS")

pca_ca <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_CentralAmyg.RDS")
pca_ca$BrNum <- rownames(pca_ca)
pca_ca <- pca_ca[,c("BrNum", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("BrNum", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))
info_ca <- merge(info_ca, pca_ca, by="BrNum", all.x=T)

pca_dg <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_DG.RDS")
pca_dg$BrNum <- rownames(pca_dg)
pca_dg <- pca_dg[,c("BrNum", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("BrNum", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))
info_dg <- merge(info_dg, pca_dg, by="BrNum", all.x=T)

pca_mpfc <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_mPFC.RDS")
pca_mpfc$BrNum <- rownames(pca_mpfc)
pca_mpfc <- pca_mpfc[,c("BrNum", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("BrNum", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))
info_mpfc <- merge(info_mpfc, pca_mpfc, by="BrNum", all.x=T)

rownames(info_ca) <- info_ca$SampleID
rownames(info_dg) <- info_dg$SampleID
rownames(info_mpfc) <- info_mpfc$SampleID

info_ca <- scale_cont(info_ca)
info_dg <- scale_cont(info_dg)
info_mpfc <- scale_cont(info_mpfc)

tamp_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/Y1Y2_CentralAmyg.RDS")
tamp_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/Y1Y2_DG.RDS")
tamp_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/Y1Y2_mPFC.RDS")

expr_ca <- prepare_norm(tamp_ca$cleanDat,info_ca)
expr_ca <- expr_ca[complete.cases(expr_ca), ]

expr_dg <- prepare_norm(tamp_dg$cleanDat,info_dg)
expr_dg <- expr_dg[complete.cases(expr_dg), ]

expr_mpfc <- prepare_norm(tamp_mpfc$cleanDat,info_mpfc)
expr_mpfc <- expr_mpfc[complete.cases(expr_mpfc), ]

info_ca <- info_ca[order(info_ca$SampleID),]
expr_ca <- expr_ca[,rownames(info_ca)]

info_dg <- info_dg[order(info_dg$SampleID),]
expr_dg <- expr_dg[,rownames(info_dg)]

info_mpfc <- info_mpfc[order(info_mpfc$SampleID),]
expr_mpfc <- expr_mpfc[,rownames(info_mpfc)]

varPart_mpfc1 <- fitExtractVarPartModel(expr_mpfc, form1, info_mpfc)
saveRDS(varPart_mpfc1, "~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/VarPartFiles/Y1Y2/PCAs/mPFC_ae.RDS")

# varPart_ca2 <- fitExtractVarPartModel(expr_ca, form2, info_ca)
# saveRDS(varPart_ca2, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/VarPartFiles/Y1Y2/CentralAmyg_gPCs.RDS")
# 
# varPart_ca3 <- fitExtractVarPartModel(expr_ca, form3, info_ca)
# saveRDS(varPart_ca3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/VarPartFiles/Y1Y2/CentralAmyg_aPCs.RDS")






