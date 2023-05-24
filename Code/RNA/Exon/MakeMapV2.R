library(SummarizedExperiment)

# Load data file
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_exon.y123_n688.Rdata")

a1=rowRanges(rse_exon)
a1=as.data.frame(a1)

first=T
for (i in 1:nrow(a1)){
  print(i)
  
  exons <- strsplit(a1[i,"exon_libdID"],split = ";")[[1]]
  symbols <- rep(rep(a1[i,"Symbol"]), length(exons))
  exonIDs <-rep(rep(a1[i,"exon_gencodeID"]), length(exons))
  idx <- rep(i, length(exons))
  if(first){
    df <- data.frame(exon=exons, symbol=symbols, exon_gencodeID=exonIDs, idx=idx)
    first=F
  }else{
    df2 <- data.frame(exon=exons, symbol=symbols, exon_gencodeID=exonIDs, idx=idx)
    df <- rbind(df,df2)
  }
}

saveRDS(df, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/exon_map_with_index_updated.RDS")

#exon_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/exon_map_with_index.RDS")
#exon_map[is.na(exon_map$symbol), "symbol"] <- exon_map[is.na(exon_map$symbol), "exon"]
#saveRDS(exon_map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/exon_map_with_index.RDS")
