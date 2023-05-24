# To do on server use: module load R/testversions/4.2.0
library(variancePartition)
# # To see which are categorical and which are continuous
# info <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/PCA/InfoFiles/Y1Y2/All_All.RDS")
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
  info$AgeDeath <- scale(info$AgeDeath)[,1]
  info$AgeDeath2 <- scale(info$AgeDeath2)[,1]
  info$PMI <- scale(info$PMI)[,1]
  info$BMI <- scale(info$BMI)[,1]
  info$Astro <- scale(info$Astro)[,1]
  info$Endo <- scale(info$Endo)[,1]
  info$ex <- scale(info$ex)[,1]
  info$`in` <- scale(info$`in`)[,1]
  info$Micro <- scale(info$Micro)[,1]
  info$Mural <- scale(info$Mural)[,1]
  info$Oligo <- scale(info$Oligo)[,1]
  info$OPC <- scale(info$OPC)[,1]
  info$Tcell <- scale(info$Tcell)[,1]
  info$Macrophage <- scale(info$Macrophage)[,1]
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
  info$PC1 <- scale(info$PC1)[,1]
  info$PC2 <- scale(info$PC2)[,1]
  info$PC3 <- scale(info$PC3)[,1]
  info$PC4 <- scale(info$PC4)[,1]
  info$PC5 <- scale(info$PC5)[,1]
  info$ancestryPC1 <- scale(info$ancestryPC1)[,1]
  info$ancestryPC2 <- scale(info$ancestryPC2)[,1]
  info$ancestryPC3 <- scale(info$ancestryPC3)[,1]
  info$ancestryPC4 <- scale(info$ancestryPC4)[,1]
  info$ancestryPC5 <- scale(info$ancestryPC5)[,1]
  info$RNA_Gene_PC1 <- scale(info$RNA_Gene_PC1)[,1]
  info$RNA_Gene_PC2 <- scale(info$RNA_Gene_PC2)[,1]
  info$RNA_Gene_PC3 <- scale(info$RNA_Gene_PC3)[,1]
  info$RNA_Gene_PC4 <- scale(info$RNA_Gene_PC4)[,1]
  info$RNA_Gene_PC5 <- scale(info$RNA_Gene_PC5)[,1]
  
  return(info)
}

# form1 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
#   `BMI`+`Astro`+`Micro`+`Mural`+`Oligo`+`OPC`+`Excit`+`Inhib`+
#   `europe`+`americas`+`cs_asia`+`e_asia`+
#   `RIN`+`mitoRate`+`rRNA_rate`+`totalAssignedGene`+
#   `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
#   `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
#   `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

form1 <- ~ `AgeDeath2`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`Astro`+`ex`+`in`+`Micro`+`Mural`+`Oligo`+`OPC`+
  `europe`+`africa`+`americas`+`cs_asia`+`e_asia`+
  `RIN`+`numMapped`+`numUnmapped`+
  `concordMapRate`+`mitoMapped`+`mitoRate`+
  `totalAssignedGene`+`rRNA_rate`+(1|`per_base_sequence_quality`)+
  (1|`per_tile_sequence_quality`)+(1|`per_base_sequence_content`)+
  (1|`per_sequence_gc_content`)+(1|`per_base_n_content`)+
  (1|`sequence_length_distribution`)+(1|`sequence_duplication_levels`)+
  (1|`overrepresented_sequences`)+(1|`adapter_content`)+
  `Psychosis`+`Smoking`+`Delusions`+`Hallucinations`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
  `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

# form2 <- ~ `AgeDeath2`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
#   `BMI`+`Macroglia`+`ex`+`in`+`immune`+
#   `PC1`+`PC2`+`PC3`+`PC4`+`PC5`+
#   `RIN`+`numMapped`+`numUnmapped`+
#   `concordMapRate`+`mitoMapped`+`mitoRate`+
#   `totalAssignedGene`+`rRNA_rate`+(1|`per_base_sequence_quality`)+
#   (1|`per_tile_sequence_quality`)+(1|`per_base_sequence_content`)+
#   (1|`per_sequence_gc_content`)+(1|`per_base_n_content`)+
#   (1|`sequence_length_distribution`)+(1|`sequence_duplication_levels`)+
#   (1|`overrepresented_sequences`)+(1|`adapter_content`)+
#   `Psychosis`+`Smoking`+`Delusions`+`Hallucinations`+`Lifetime Anticonvulsant`+
#   `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
#   `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`
# 
# form3 <- ~ `AgeDeath2`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
#   `BMI`+`Macroglia`+`ex`+`in`+`immune`+
#   `ancestryPC1`+`ancestryPC2`+`ancestryPC3`+`ancestryPC4`+`ancestryPC5`+
#   `RIN`+`numMapped`+`numUnmapped`+
#   `concordMapRate`+`mitoMapped`+`mitoRate`+
#   `totalAssignedGene`+`rRNA_rate`+(1|`per_base_sequence_quality`)+
#   (1|`per_tile_sequence_quality`)+(1|`per_base_sequence_content`)+
#   (1|`per_sequence_gc_content`)+(1|`per_base_n_content`)+
#   (1|`sequence_length_distribution`)+(1|`sequence_duplication_levels`)+
#   (1|`overrepresented_sequences`)+(1|`adapter_content`)+
#   `Psychosis`+`Smoking`+`Delusions`+`Hallucinations`+`Lifetime Anticonvulsant`+
#   `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
#   `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

info_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/PCA/InfoFiles/Y1Y2/All_CentralAmyg.RDS")
info_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/PCA/InfoFiles/Y1Y2/All_DG.RDS")
info_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/PCA/InfoFiles/Y1Y2/All_mPFC.RDS")

info_ca$AgeDeath2 <- info_ca$AgeDeath**2
info_dg$AgeDeath2 <- info_dg$AgeDeath**2
info_mpfc$AgeDeath2 <- info_mpfc$AgeDeath**2


info_ca <- info_ca[order(info_ca$SampleID),]
info_dg <- info_dg[order(info_dg$SampleID),]
info_mpfc <- info_mpfc[order(info_mpfc$SampleID),]

rownames(info_ca) <- info_ca$SampleID
rownames(info_dg) <- info_dg$SampleID
rownames(info_mpfc) <- info_mpfc$SampleID

info_ca <- scale_cont(info_ca)
info_dg <- scale_cont(info_dg)
info_mpfc <- scale_cont(info_mpfc)

vall_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoomCentralAmyg.RDS")
vall_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoomDG.RDS")
vall_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoommPFC.RDS")

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
saveRDS(varPart_mpfc1, "~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartFiles/Y1Y2/mPFC.RDS")
