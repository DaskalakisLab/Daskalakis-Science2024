magma_ptsd <- read.table("/data/humgen/daskalakislab/aiatrou/Science/EWCE/PTSD3_MAGMA_GENES.txt", header = T)
magma_ptsd <- magma_ptsd$Symbol[which(magma_ptsd$FDR < 0.05)]

magma_mdd <- read.table("/data/humgen/daskalakislab/aiatrou/Science/EWCE/MDDHMVP_MAGMA_GENES.txt", header = T)
magma_mdd <- magma_mdd$Symbol[which(magma_mdd$FDR < 0.05)]

Gene2Modules <- read_csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/Gene2Modules.csv")
Gene2Modules <- as.data.frame(Gene2Modules)
Gene2Modules <- Gene2Modules[,2:ncol(Gene2Modules)]

midnightblue <- as.data.frame(Gene2Modules[Gene2Modules$Module == "midnightblue","Symbol"])
names(midnightblue) <- "midnightblue"
  
TopHubs_control <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/TopHubs_control.RDS")
TopHubs_control$midnightbluemidnightblue <- as.data.frame(midnightblue)

midnightblue$hub <- NA
midnightblue[midnightblue$midnightblue %in% TopHubs_control$midnightblue, "hub"] <- "HUB"
midnightblue[midnightblue$midnightblue %in% magma_ptsd, "hub"] <- "PTSD_MAGMA"
midnightblue[midnightblue$midnightblue %in% magma_mdd, "hub"] <- "MDD_MAGMA"
midnightblue$PTSD_MDD <- NA
midnightblue[(midnightblue$midnightblue %in% magma_ptsd) & (midnightblue$midnightblue %in% magma_mdd), "PTSD_MDD"] <- "PTSD_MDD_MAGMA"



write.table(midnightblue, file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/ModuleHubs/DG_midnightblue.csv", row.names=F, quote=F)
