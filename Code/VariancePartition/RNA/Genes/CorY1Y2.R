# To do on server use: module load R/testversions/4.2.0
library(variancePartition)
library(ggplot2)

cor_Y1Y2 <- function(info, form, out_file){
  C = canCorPairs( form, info)
  saveRDS(C, out_file)
}

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
# # Remove variables with only 1 unique value
# to_rm <- c()
# for(cov in covs){
#   print(paste(cov,nrow(info[is.na(info[[cov]]),])))
#   if(length(unique(info[[cov]])) == 1){
#     print(cov)
#     to_rm <- append(to_rm, which(covs == cov))
#   }
# }
# 
# covs <- covs[-to_rm]

form <- ~ `AgeDeath`+`Sex`+`PMI`+`PTSD`+`MDD`+`Control`+
  `BMI`+`Macroglia`+`periV`+`ex`+`in`+`immune`+
  `europe`+`oceania`+`africa`+`americas`+`cs_asia`+`e_asia`+
  `RIN`+`numReads`+`numMapped`+`numUnmapped`+`overallMapRate`+
  `concordMapRate`+`totalMapped`+`mitoMapped`+`mitoRate`+
  `totalAssignedGene`+`rRNA_rate`+`per_base_sequence_quality`+
  `per_tile_sequence_quality`+`per_base_sequence_content`+
  `per_sequence_gc_content`+`per_base_n_content`+
  `sequence_length_distribution`+`sequence_duplication_levels`+
  `overrepresented_sequences`+`adapter_content` +
  `Psychosis`+`Smoking`+`Delusions`+`Hallucinations`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+`Manner Of Death`+
  `Past Self Mutilation`+`Past Suicide Attempts`+`Flashbacks`+`Intrusive thoughts`


info_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_CentralAmyg.RDS")
info_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_DG.RDS")
info_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_mPFC.RDS")

cor_Y1Y2(info=info_ca, form=form, out_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorFiles/Y1Y2/CentralAmyg.RDS")
cor_Y1Y2(info=info_dg, form=form, out_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorFiles/Y1Y2/DG.RDS")
cor_Y1Y2(info=info_mpfc, form=form, out_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorFiles/Y1Y2/mPFC.RDS")



# plot_cor <- function(wd, file){
#   
#   out_file <- gsub(".RDS", ".tiff", file)
#   C <- readRDS(paste0(wd,file))
#   tiff(filename = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorPlots/Y1Y2/",out_file),
#        width = 10,height = 10,units = "in",compression = "lzw", res = 100)
#   plotCorrMatrix(C)
#   dev.off()
# }

plot_cor <- function(wd, file,title){
  
  out_file <- gsub(".RDS", ".pdf", file)
  C <- readRDS(paste0(wd,file))
  pdf(file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorPlots/Y1Y2/",out_file),
       width = 10,height = 10)
  plotCorrMatrix(C, margins=c(17,17), main=title)
  dev.off()
}

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorFiles/Y1Y2/"
cor_files <- list.files(wd, pattern = "*.RDS")
options(bitmapType='cairo')
for (cf in cor_files){
  print(cf)
  title <- gsub(".RDS", "", cf)
  plot_cor(wd, cf, title)
}
