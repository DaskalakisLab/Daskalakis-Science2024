# To do on server use: module load R/testversions/4.2.0
library(variancePartition)
library(ggplot2)

cor_Y1Y2 <- function(info, form, out_file){
  C = canCorPairs( form, info)
  saveRDS(C, out_file)
}

form <- ~ `AgeDeath`+`Sex`+`PMI`+`PTSD`+`MDD`+
  `BMI`+`europe`+`americas`+`cs_asia`+`e_asia`+
  `ProtPC1`+`ProtPC2`+`ProtPC3`+`ProtPC4`+`ProtPC5`+
  `Psychosis`+`Smoking`+`Delusions`+`Lifetime Anticonvulsant`+
  `Lifetime Antidepress`+`Lifetime Antipsych`+`Lifetime Lithium`+`Manner Of Death`+
  `Past Self Mutilation`+`Past Suicide Attempts`+`Flashbacks`+`Intrusive thoughts`



info_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_CentralAmyg.RDS")
info_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_DG.RDS")
info_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y1Y2/All_mPFC.RDS")

pca_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_CentralAmyg.RDS")
pca_ca <- pca_ca[,c("BrNum", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("BrNum", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))
info_ca <- merge(info_ca, pca_ca, by="BrNum", all.x=T)

pca_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_DG.RDS")
pca_dg <- pca_dg[,c("BrNum", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("BrNum", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))
info_dg <- merge(info_dg, pca_dg, by="BrNum", all.x=T)

pca_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_mPFC.RDS")
pca_mpfc <- pca_mpfc[,c("BrNum", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("BrNum", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))
info_mpfc <- merge(info_mpfc, pca_mpfc, by="BrNum", all.x=T)

rownames(info_ca) <- info_ca$SampleID
rownames(info_dg) <- info_dg$SampleID
rownames(info_mpfc) <- info_mpfc$SampleID

cor_Y1Y2(info=info_ca, form=form, out_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/CorFiles/Y1Y2/CentralAmyg.RDS")
cor_Y1Y2(info=info_dg, form=form, out_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/CorFiles/Y1Y2/DG.RDS")
cor_Y1Y2(info=info_mpfc, form=form, out_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/CorFiles/Y1Y2/mPFC.RDS")



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
  pdf(file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/CorPlots/Y1Y2/",out_file),
      width = 10,height = 10)
  plotCorrMatrix(C, margins=c(17,17), main=title)
  dev.off()
}

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/CorFiles/Y1Y2/"
cor_files <- list.files(wd, pattern = "*.RDS")
options(bitmapType='cairo')
for (cf in cor_files){
  print(cf)
  title <- gsub(".RDS", "", cf)
  plot_cor(wd, cf, title)
}
