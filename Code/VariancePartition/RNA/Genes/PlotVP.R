library(variancePartition)
library(ggplot2)
# options(bitmapType='cairo')

plot_vp <- function(wd, file){
  out_file <- gsub(".RDS", ".pdf", file)
  vp <- readRDS(paste0(wd,file))
  vp <- sortCols(vp)
  p <- plotVarPart(vp)
  ggsave(filename=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartPlots/Y1Y2/",out_file),
         plot = p,
         device = "pdf",
         units = "in",
         width = 20,
         height = 5)
}

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartFiles/Y1Y2/"
vp_files <- list.files(wd, pattern = "*.RDS")

for (vf in vp_files){
  print(vf)
  plot_vp(wd, vf)
}
