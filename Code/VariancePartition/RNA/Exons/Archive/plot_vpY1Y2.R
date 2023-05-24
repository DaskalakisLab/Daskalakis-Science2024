library(variancePartition)
library(ggplot2)

plot_vp <- function(wd, file){
  out_file <- gsub(".RDS", ".tiff", file)
  vp <- readRDS(paste0(wd,file))
  p <- plotVarPart(vp)
  if (!dir.exists("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartPlots/Y1Y2/")){
    dir.create("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartPlots/Y1Y2/", recursive=T)
  }
  ggsave(filename=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartPlots/Y1Y2/",out_file),
         plot = p,
         device = "tiff",
         units = "in",
         width = 15,
         height = 5,
         dpi = 100,
         compression = "lzw")
}

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Exons/VarPartFiles/Y1Y2/"
vp_files <- list.files(wd, pattern = "*.RDS")

for (vf in vp_files){
  print(vf)
  plot_vp(wd, vf)
}
