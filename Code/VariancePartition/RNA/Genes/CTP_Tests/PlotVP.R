library(variancePartition)
library(ggplot2)
# options(bitmapType='cairo')

plot_vp <- function(wd, file){
  out_file <- gsub(".RDS", ".tiff", file)
  vp <- readRDS(paste0(wd,file))
  vp <- sortCols(vp)
  p <- plotVarPart(vp)
  ggsave(filename=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CTP_Tests/VarPartPlots/",out_file),
         plot = p,
         device = "tiff",
         units = "in",
         width = 15,
         height = 5,
         dpi = 100,
         compression = "lzw")
}

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CTP_Tests/VarPartFiles/"
vp_files <- list.files(wd, pattern = "*.RDS")

for (vf in vp_files){
  print(vf)
  plot_vp(wd, vf)
}
