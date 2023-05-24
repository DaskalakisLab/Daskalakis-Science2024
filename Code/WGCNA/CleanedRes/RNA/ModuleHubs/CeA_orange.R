
magma_ptsd <- read.table("/data/humgen/daskalakislab/aiatrou/Science/EWCE/PTSD3_MAGMA_GENES.txt", header = T)
magma_ptsd <- magma_ptsd$Symbol[which(magma_ptsd$FDR < 0.05)]

magma_mdd <- read.table("/data/humgen/daskalakislab/aiatrou/Science/EWCE/MDDHMVP_MAGMA_GENES.txt", header = T)
magma_mdd <- magma_mdd$Symbol[which(magma_mdd$FDR < 0.05)]

Gene2Modules <- read_csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/Gene2Modules.csv")
Gene2Modules <- as.data.frame(Gene2Modules)
Gene2Modules <- Gene2Modules[,2:ncol(Gene2Modules)]

orange <- as.data.frame(Gene2Modules[Gene2Modules$Module == "orange","Symbol"])
names(orange) <- "orange"
  
TopHubs_control <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/TopHubs_control.RDS")
TopHubs_control$orangeorange <- as.data.frame(orange)

orange$hub <- NA
orange[orange$orange %in% TopHubs_control$orange, "hub"] <- "HUB"
orange[orange$orange %in% magma_ptsd, "hub"] <- "PTSD_MAGMA"
orange[orange$orange %in% magma_mdd, "hub"] <- "MDD_MAGMA"
orange$PTSD_MDD <- NA
orange[(orange$orange %in% magma_ptsd) & (orange$orange %in% magma_mdd), "PTSD_MDD"] <- "PTSD_MDD_MAGMA"



write.table(orange, file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/ModuleHubs/CeA_orange.csv", row.names=F, quote=F)
