#BiocManager::install("variancePartition")
library(variancePartition)
library(ggplot2)

plot_cor <- function(wd, file){

  out_file <- gsub(".RDS", ".tiff", file)
  C <- readRDS(paste0(wd,file))
  tiff(filename = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/CorPlots/Y1Y2/",out_file),
       width = 10,height = 8,units = "in",compression = "lzw", res = 100)
  plotCorrMatrix(C)
  # ggsave(filename=paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/CorPlots/Y1Y2/",out_file),
  #        plot = p,
  #        device = "tiff",
  #        units = "in",
  #        width = 15,
  #        height = 10,
  #        dpi = 100,
  #        compression = "lzw")
  dev.off()
}

wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/CorFiles/Y1Y2/"
cor_files <- list.files(wd, pattern = "*.RDS")

for (cf in cor_files){
  print(cf)
  plot_cor(wd, cf)
}
