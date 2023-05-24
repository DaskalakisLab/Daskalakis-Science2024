CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorFiles/Y1Y2/CentralAmyg.RDS")
CentralAmyg <- as.data.frame(CentralAmyg)

DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorFiles/Y1Y2/DG.RDS")
DG <- as.data.frame(DG)

mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/CorFiles/Y1Y2/mPFC.RDS")
mPFC <- as.data.frame(mPFC)


print_correlated_pairs <- function(df){
  for(col in names(df)){
    if (nrow(df[(df[[col]] > 0.9) & (df[[col]] < 1),]) > 0){
      print(paste0(col, ": "))
      print(rownames(df[(df[[col]] > 0.9) & (df[[col]] < 1),]))
    }
  }
}

print_correlated_pairs(CentralAmyg)
print_correlated_pairs(DG)
print_correlated_pairs(mPFC)
