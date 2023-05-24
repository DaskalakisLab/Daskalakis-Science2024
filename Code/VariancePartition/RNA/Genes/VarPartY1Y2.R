# To see which are categorical and which are continuous
info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_All.RDS")
covs <- c("BrNum","SampleID","Brain_Region","AgeDeath","Sex","PMI","Dx","PTSD",
          "MDD","Control","BMI","Astro","Endo","Macro","Micro","Mural","Oligo",
          "OPC","Tcell","Excit","Inhib","europe","oceania","africa","americas",
          "cs_asia","e_asia","RIN","mitoRate","rRNA_rate","totalAssignedGene",
          "Psychosis","Smoking","Delusions","Hallucinations","Lifetime Anticonvulsant",
          "Lifetime Antidepress","Lifetime Antipsych","Lifetime Lithium","Manner Of Death",
          "Past Self Mutilation","Past Suicide Attempts","Flashbacks","Intrusive thoughts",
          "Reliving","Detachment","Dissociation")

for (cov in covs){
  print(cov)
  print(head(info[[cov]]))
}
rm(cov, covs, info)

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


form <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`Astro`+`Micro`+`Mural`+`Oligo`+`OPC`+`Excit`+`Inhib`+
  `europe`+`americas`+`cs_asia`+`e_asia`+
  `RIN`+`mitoRate`+`rRNA_rate`+`totalAssignedGene`+
  `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
  `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

info_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_CentralAmyg.RDS")
info_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_DG.RDS")
info_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_mPFC.RDS")

info_ca <- scale_cont(info_ca)
info_dg <- scale_cont(info_dg)
info_mpfc <- scale_cont(info_mpfc)

vall_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Voom_Y1Y2_CentralAmyg.RDS")
vall_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Voom_Y1Y2_DG.RDS")
vall_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Voom_Y1Y2_mPFC.RDS")

varPart_ca <- fitExtractVarPartModel(vall_ca, form, info_ca)
saveRDS(varPart_ca, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartFiles/Y1Y2/CentralAmyg.RDS")

varPart_dg <- fitExtractVarPartModel(vall_dg, form, info_dg)
saveRDS(varPart_dg, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartFiles/Y1Y2/DG.RDS")

varPart_mpfc <- fitExtractVarPartModel(vall_mpfc, form, info_mpfc)
saveRDS(varPart_mpfc, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartFiles/Y1Y2/mPFC.RDS")





