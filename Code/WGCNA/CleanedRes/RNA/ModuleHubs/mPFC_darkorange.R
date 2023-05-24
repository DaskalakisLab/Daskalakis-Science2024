magma_ptsd <- read.table("/data/humgen/daskalakislab/aiatrou/Science/EWCE/PTSD3_MAGMA_GENES.txt", header = T)
magma_ptsd <- magma_ptsd$Symbol[which(magma_ptsd$FDR < 0.05)]

magma_mdd <- read.table("/data/humgen/daskalakislab/aiatrou/Science/EWCE/MDDHMVP_MAGMA_GENES.txt", header = T)
magma_mdd <- magma_mdd$Symbol[which(magma_mdd$FDR < 0.05)]

Gene2Modules <- read_csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/Gene2Modules.csv")
Gene2Modules <- as.data.frame(Gene2Modules)
Gene2Modules <- Gene2Modules[,2:ncol(Gene2Modules)]

darkorange <- as.data.frame(Gene2Modules[Gene2Modules$Module == "darkorange","Symbol"])
names(darkorange) <- "darkorange"
  
TopHubs_control <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/TopHubs_control.RDS")
TopHubs_control$darkorangedarkorange <- as.data.frame(darkorange)

darkorange$hub <- NA
darkorange[darkorange$darkorange %in% TopHubs_control$darkorange, "hub"] <- "HUB"
darkorange[darkorange$darkorange %in% magma_ptsd, "hub"] <- "PTSD_MAGMA"
darkorange[darkorange$darkorange %in% magma_mdd, "hub"] <- "MDD_MAGMA"
darkorange$PTSD_MDD <- NA
darkorange[(darkorange$darkorange %in% magma_ptsd) & (darkorange$darkorange %in% magma_mdd), "PTSD_MDD"] <- "PTSD_MDD_MAGMA"



write.table(darkorange, file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/ModuleHubs/mPFC_darkorange.csv", row.names=F, quote=F)
