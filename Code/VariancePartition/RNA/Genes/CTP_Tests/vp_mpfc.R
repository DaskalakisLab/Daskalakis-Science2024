# To do on server use: module load R/testversions/4.2.0
library(variancePartition)

anno_y1y2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno_y1y2 <- anno_y1y2[anno_y1y2$Brain_Region=="mPFC",]
names(anno_y1y2)
anno_y1y2 <- anno_y1y2[,1:84]
names(anno_y1y2)

ctp9 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_pfc.RDS")

anno_y1y2 <- merge(anno_y1y2, ctp9, by="SampleID", all.x=T)
names(anno_y1y2)

info <- anno_y1y2
rm(anno_y1y2,ctp9)






scale_cont <- function(info){
  info$AgeDeath <- scale(info$AgeDeath)[,1]
  info$PMI <- scale(info$PMI)[,1]
  info$BMI <- scale(info$BMI)[,1]
  info$Astro <- scale(info$Astro)[,1]
  info$ex <- scale(info$ex)[,1]
  info$`in` <- scale(info$`in`)[,1]
  info$Macrophage <- scale(info$Macrophage)[,1]
  info$Micro <- scale(info$Micro)[,1]
  info$Mural <- scale(info$Mural)[,1]
  info$Oligo <- scale(info$Oligo)[,1]
  info$OPC <- scale(info$OPC)[,1]
  info$Tcell <- scale(info$Tcell)[,1]
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
  
  return(info)
}

# form1 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
#   `BMI`+`Astro`+`Micro`+`Mural`+`Oligo`+`OPC`+`Excit`+`Inhib`+
#   `europe`+`americas`+`cs_asia`+`e_asia`+
#   `RIN`+`mitoRate`+`rRNA_rate`+`totalAssignedGene`+
#   `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
#   `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+(1|`Manner Of Death`)+
#   `Past Self Mutilation`+(1|`Past Suicide Attempts`)+`Flashbacks`+`Intrusive thoughts`

form1 <- ~ `AgeDeath`+(1|`Sex`)+`PMI`+`PTSD`+`MDD`+
  `BMI`+`Astro`+`ex`+`in`+`Micro`+`Mural`+`Oligo`+`OPC`+`Tcell`+
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


info <- info[order(info$SampleID),]
rownames(info) <- info$SampleID


info <- scale_cont(info)
vall_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoommPFC.RDS")


expr_mpfc <- vall_mpfc$E
expr_mpfc <- as.data.frame(expr_mpfc)
expr_mpfc <- expr_mpfc[,rownames(info)]
expr_mpfc <- as.matrix(expr_mpfc)

varPart_mpfc1 <- fitExtractVarPartModel(expr_mpfc, form1, info)
saveRDS(varPart_mpfc1, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CTP_Tests/VarPartFiles/mPFC_ae.RDS")
