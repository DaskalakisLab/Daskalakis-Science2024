library(variancePartition)
library(ggplot2)

plot_vp <- function(wd, file){
  out_file <- gsub(".RDS", ".pdf", file)
  vp <- readRDS(paste0(wd,file))
  vp <- sortCols(vp)
  p <- plotVarPart(vp) + ggtitle(gsub(".RDS", "", file))
  if(!dir.exists("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Peptides/VarPartPlots/Y1Y2/")){
    dir.create("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Peptides/VarPartPlots/Y1Y2/",recursive = T)
  }
  ggsave(filename=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Peptides/VarPartPlots/Y1Y2/",out_file),
         plot = p,
         device = "pdf",
         units = "in",
         width = 10,
         height = 5)
}

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Peptides/VarPartFiles/Y1Y2/"
vp_files <- list.files(wd, pattern = "*.RDS")

for (vf in vp_files){
  print(vf)
  plot_vp(wd, vf)
}
