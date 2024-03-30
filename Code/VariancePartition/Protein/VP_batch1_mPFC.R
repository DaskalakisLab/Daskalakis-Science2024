library(variancePartition)

prepare_norm <- function(norm,anno){
  batch1_designs <- readRDS("/path/to/Protein/Proteomics/batch1_designs.RDS")
  
  batch1_designs <- as.data.frame(batch1_designs)
  batch1_designs$Plate <- gsub("F", "", batch1_designs$Plate)
  batch1_designs$Plate <- sprintf("%02d", as.numeric(batch1_designs$Plate))
  batch1_designs$ID <- paste0("b",batch1_designs$Plate, ".", batch1_designs$Position)
  
  batch1_designs <- merge(batch1_designs, anno[,c("BrNum","SampleID","Brain_Region_Protein")], by.x=c("BrNum", "Brain_Region"), by.y=c("BrNum", "Brain_Region_Protein"), all.x=T)
  batch1_designs[batch1_designs$BrNum=="GIS","SampleID"] <- batch1_designs[batch1_designs$BrNum=="GIS","ID"]
  norm <- as.data.frame(norm)
  for (id in names(norm)){
    print(id)
    names(norm)[names(norm)==id] <- batch1_designs[batch1_designs$ID == id,"SampleID"]
  }
  names(norm)
  norm <- norm[,startsWith(names(norm), "R")]
  #norm <- as.matrix(norm)
  return(norm)
}



# # To see which are categorical and which are continuous
# info <- readRDS("/path/to/RNA/VariancePartition/InfoFiles/batch1/All_All.RDS")
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
  info$AgeDeath <- scale(info$AgeDeath)
  info$PMI <- scale(info$PMI)
  info$BMI <- scale(info$BMI)
  info$Astro <- scale(info$Astro)
  info$Endo <- scale(info$Endo)
  info$Micro <- scale(info$Micro)
  info$Macro <- scale(info$Macro)
  info$Mural <- scale(info$Mural)
  info$Oligo <- scale(info$Oligo)
  info$OPC <- scale(info$OPC)
  info$Tcell <- scale(info$Tcell)
  info$Excit <- scale(info$Excit)
  info$Inhib <- scale(info$Inhib)
  info$europe <- scale(info$europe)
  info$oceania <- scale(info$oceania)
  info$africa <- scale(info$africa)
  info$americas <- scale(info$americas)
  info$cs_asia <- scale(info$cs_asia)
  info$e_asia <- scale(info$e_asia)
  info$RIN <- scale(info$RIN)
  info$mitoRate <- scale(info$mitoRate)
  info$rRNA_rate <- scale(info$rRNA_rate)
  info$totalAssignedGene <- scale(info$totalAssignedGene)
  return(info)
}


form1 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`europe`+`americas`+`cs_asia`+`e_asia`+
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

info_ca <- readRDS("/path/to/RNA/VariancePartition/InfoFiles/batch1/All_CentralAmyg.RDS")
info_dg <- readRDS("/path/to/RNA/VariancePartition/InfoFiles/batch1/All_DG.RDS")
info_mpfc <- readRDS("/path/to/RNA/VariancePartition/InfoFiles/batch1/All_mPFC.RDS")
rownames(info_ca) <- info_ca$SampleID
rownames(info_dg) <- info_dg$SampleID
rownames(info_mpfc) <- info_mpfc$SampleID

info_ca <- scale_cont(info_ca)
info_dg <- scale_cont(info_dg)
info_mpfc <- scale_cont(info_mpfc)

tamp_ca <- readRDS("/path/to/Protein/TamporNormalized/Proteins/batch1_Amygdala.RDS")
tamp_dg <- readRDS("/path/to/Protein/TamporNormalized/Proteins/batch1_Hippocampus.RDS")
tamp_mpfc <- readRDS("/path/to/Protein/TamporNormalized/Proteins/batch1_mPFC.RDS")

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


# varPart_mpfc1 <- fitExtractVarPartModel(expr_mpfc, form1, info_mpfc)
# saveRDS(varPart_mpfc1, "/path/to/Protein/VariancePartition/Proteins/VarPartFiles/batch1/mPFC_ae.RDS")

varPart_mpfc2 <- fitExtractVarPartModel(expr_mpfc, form2, info_mpfc)
saveRDS(varPart_mpfc2, "/path/to/Protein/VariancePartition/Proteins/VarPartFiles/batch1/mPFC_gPCs.RDS")

varPart_mpfc3 <- fitExtractVarPartModel(expr_mpfc, form3, info_mpfc)
saveRDS(varPart_mpfc3, "/path/to/Protein/VariancePartition/Proteins/VarPartFiles/batch1/mPFC_aPCs.RDS")




