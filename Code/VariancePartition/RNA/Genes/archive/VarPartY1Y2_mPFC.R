# To do on server use: module load R/testversions/4.2.0
library(variancePartition)
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
# 
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
  `BMI`+`Astro`+`Micro`+`Mural`+`Oligo`+`OPC`+`Excit`+`Inhib`+
  `europe`+`americas`+`cs_asia`+`e_asia`+
  `RIN`+`mitoRate`+`rRNA_rate`+`totalAssignedGene`+
  `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
  `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

form2 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`Astro`+`Micro`+`Mural`+`Oligo`+`OPC`+`Excit`+`Inhib`+
  `PC1`+`PC2`+`PC3`+`PC4`+`PC5`+
  `RIN`+`mitoRate`+`rRNA_rate`+`totalAssignedGene`+
  `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
  `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

form3 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`Astro`+`Micro`+`Mural`+`Oligo`+`OPC`+`Excit`+`Inhib`+
  `ancestryPC1`+`ancestryPC2`+`ancestryPC3`+`ancestryPC4`+`ancestryPC5`+
  `RIN`+`mitoRate`+`rRNA_rate`+`totalAssignedGene`+
  `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
  `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`


info_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_CentralAmyg.RDS")
info_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_DG.RDS")
info_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_mPFC.RDS")

info_ca <- info_ca[order(info_ca$SampleID),]
info_dg <- info_dg[order(info_dg$SampleID),]
info_mpfc <- info_mpfc[order(info_mpfc$SampleID),]

rownames(info_ca) <- info_ca$SampleID
rownames(info_dg) <- info_dg$SampleID
rownames(info_mpfc) <- info_mpfc$SampleID

info_ca <- scale_cont(info_ca)
info_dg <- scale_cont(info_dg)
info_mpfc <- scale_cont(info_mpfc)

vall_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoomCentralAmyg.RDS")
vall_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoomDG.RDS")
vall_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoommPFC.RDS")

expr_ca <- vall_ca$E
expr_ca <- as.data.frame(expr_ca)
expr_ca <- expr_ca[,rownames(info_ca)]
expr_ca <- as.matrix(expr_ca)


expr_dg <- vall_dg$E
expr_dg <- as.data.frame(expr_dg)
expr_dg <- expr_dg[,rownames(info_dg)]
expr_dg <- as.matrix(expr_dg)



expr_mpfc <- vall_mpfc$E
expr_mpfc <- as.data.frame(expr_mpfc)
expr_mpfc <- expr_mpfc[,rownames(info_mpfc)]
expr_mpfc <- as.matrix(expr_mpfc)

varPart_mpfc1 <- fitExtractVarPartModel(expr_mpfc, form1, info_mpfc)
saveRDS(varPart_mpfc1, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartFiles/Y1Y2/mPFC_ae.RDS")

varPart_mpfc2 <- fitExtractVarPartModel(expr_mpfc, form2, info_mpfc)
saveRDS(varPart_mpfc2, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartFiles/Y1Y2/mPFC_gPCs.RDS")

varPart_mpfc3 <- fitExtractVarPartModel(expr_mpfc, form3, info_mpfc)
saveRDS(varPart_mpfc3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartFiles/Y1Y2/mPFC_aPCs.RDS")





