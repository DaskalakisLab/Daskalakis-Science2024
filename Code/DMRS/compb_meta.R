library(ENmix)
library(minfi)
library(stringr)
source("/data/humgen/daskalakislab/aiatrou/Science/Manuscript_panels/Methylation/combp_mod_meta.R")
pathRes <-"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Methylation/"
pathResult <- "/data/humgen/daskalakislab/aiatrou/Science/Manuscript_panels/Methylation/DMR_META_p0001/"
dir.create(pathResult, recursive = T)
setwd(pathResult)
pathMo <-"/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Methylation/"

files_meta <- list.files(pathRes, pattern = "beta_sd.RDS", recursive = TRUE)
files_meta <- files_meta[c(1:5, 9)]

files <- list.files(pathMo,pattern = "annotation",recursive = TRUE)
files <- files[grep("discovery",files)]
# dir.create(pathResult)

getCorrectName <- function(dict,files)
{
  List <- matrix(NA,length(files),1)
  
  for (ikey in 1:nrow(dict))
  {
    key <- dict[ikey,1]
    wordReplace <- dict[ikey,2]
    List[grep(key,files),1] <- wordReplace
  }
  List
}

dictbetaPath <- cbind(c("discovery"),
                      c("/data/humgen/daskalakislab/jajoo/TACC/DNAmethylation/NormalizedDatadiscovery/"))

betaPathList <- getCorrectName(dictbetaPath,files)

dictbetaRegion <- cbind(c("CentralAmy","DG","mPFC"),c("Amy","Hipp","mPFC"))
betaRegionList <- getCorrectName(dictbetaRegion,files)

files <- files[c(7:9, 16:18)]

for (ilimma in 1:length(files)){
  print(files[ilimma])
  print(files_meta[ilimma])
  
  
  expr <- readRDS(paste0(pathMo,gsub("annotation","expression",files[ilimma])))
  grset <- makeGenomicRatioSetFromMatrix(mat = as.matrix(expr), 
                                         array = "IlluminaHumanMethylationEPIC", annotation = "ilm10b4.hg19", 
                                         what = "M")
  
  manifest <- as.data.frame(grset@rowRanges)
  manifest$meth <- rownames(manifest)
  
  limma <- readRDS(paste0(pathRes, files_meta[ilimma]))
  limma <- merge(limma, manifest,by = "meth" )
  compb_input <- limma %>% dplyr::select(seqnames, start, end, pval, meth)
  colnames(compb_input) <- c("chr", "start", "end", "p", "probe")
  compb_input$chr <- str_replace(compb_input$chr , pattern = "chr", replacement = "")
  
  combp_mod(compb_input,dist.cutoff=1000,bin.size=310,seed=0.001,
            region_plot=FALSE,mht_plot=TRUE,nCores=23,verbose=TRUE )
  
  
}
