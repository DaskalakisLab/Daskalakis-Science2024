
magma_ptsd <- read.table("/data/humgen/daskalakislab/aiatrou/Science/EWCE/PTSD3_MAGMA_GENES.txt", header = T)
magma_ptsd <- magma_ptsd$Symbol[which(magma_ptsd$FDR < 0.05)]

magma_mdd <- read.table("/data/humgen/daskalakislab/aiatrou/Science/EWCE/MDDHMVP_MAGMA_GENES.txt", header = T)
magma_mdd <- magma_mdd$Symbol[which(magma_mdd$FDR < 0.05)]

Gene2Modules <- read_csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/Gene2Modules.csv")
Gene2Modules <- as.data.frame(Gene2Modules)
Gene2Modules <- Gene2Modules[,2:ncol(Gene2Modules)]

darkturquoise <- as.data.frame(Gene2Modules[Gene2Modules$Module == "darkturquoise","Symbol"])
names(darkturquoise) <- "darkturquoise"
  
TopHubs_control <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/TopHubs_control.RDS")
TopHubs_control$darkturquoisedarkturquoise <- as.data.frame(darkturquoise)

darkturquoise$hub <- NA
darkturquoise[darkturquoise$darkturquoise %in% TopHubs_control$darkturquoise, "hub"] <- "HUB"
darkturquoise[darkturquoise$darkturquoise %in% magma_ptsd, "hub"] <- "PTSD_MAGMA"
darkturquoise[darkturquoise$darkturquoise %in% magma_mdd, "hub"] <- "MDD_MAGMA"
darkturquoise$PTSD_MDD <- NA
darkturquoise[(darkturquoise$darkturquoise %in% magma_ptsd) & (darkturquoise$darkturquoise %in% magma_mdd), "PTSD_MDD"] <- "PTSD_MDD_MAGMA"



write.table(darkturquoise, file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/ModuleHubs/CeA_darkturquoise.csv", row.names=F, quote=F)
