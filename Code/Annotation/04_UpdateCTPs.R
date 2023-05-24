library(bigreadr)
library(plyr)

anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")


# ctp_ca <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_amygdala.csv")
# ctp_dg <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_hpc.csv")
# ctp_mpfc <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_pfc.csv")
# 
# reformat_ctp <- function(ctp){
#   rownames(ctp) <- ctp$V1
#   ctp <- ctp[,2:ncol(ctp)]
#   ctp <- as.data.frame(t(ctp))
#   ctp$SampleID <- rownames(ctp)
#   return(ctp)
# }
# 
# ctp_ca <- reformat_ctp(ctp_ca)
# ctp_dg <- reformat_ctp(ctp_dg)
# ctp_mpfc <- reformat_ctp(ctp_mpfc)
# saveRDS(ctp_ca, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_CA.RDS")
# saveRDS(ctp_dg, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_DG.RDS")
# saveRDS(ctp_mpfc, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_mPFC.RDS")
# 
# ctps <- rbind.fill(ctp_ca, ctp_dg, ctp_mpfc)
# saveRDS(ctps, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_comb.RDS")

ctps <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/ArtemisCTPs/CTP_9_comb.RDS")

anno12 <- anno12[, names(anno12)[!(names(anno12) %in% c("Astro","ignore","Endo","ex","in","Micro","Mural","Oligo","OPC","Tcell","Macrophage"))]]
anno3 <- anno3[, names(anno3)[!(names(anno3) %in% c("Astro","ignore","Endo","ex","in","Micro","Mural","Oligo","OPC","Tcell","Macrophage"))]]

anno12 <- merge(anno12, ctps, by="SampleID", all.x=T)
anno3 <- merge(anno3, ctps, by="SampleID", all.x=T)

names(anno12)[names(anno12)=="in"] <- "inhib"
names(anno3)[names(anno3)=="in"] <- "inhib"

saveRDS(anno12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
saveRDS(anno3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
