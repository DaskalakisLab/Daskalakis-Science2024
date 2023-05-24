extract_top_correlations_Y1Y2 <- function(wd,file){
  c <- as.data.frame(readRDS(paste0(wd,file)))
  out <- gsub(".RDS", ".txt", file)
  cor_list <- c()
  for (col in names(c)){
    print(col)
    col_df <- c[(c[[col]] > 0.5) & (c[[col]] < 1),]
    if (nrow(col_df) > 0){
      cor_list[[col]] <- c(c(col),rownames(col_df))
    }
    print(rownames(col_df))
  }
  lapply(cor_list, write, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/CorFiles/TopCorrelations/Y1Y2/",out), append=TRUE, ncolumns=1000)
  
}
wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/CorFiles/Y1Y2/"
cor_files <- list.files(wd, pattern = "*.RDS")

for (cf in cor_files){
  extract_top_correlations_Y1Y2(wd,cf)
}

extract_top_correlations_Y3 <- function(wd,file){
  c <- as.data.frame(readRDS(paste0(wd,file)))
  out <- gsub(".RDS", ".txt", file)
  cor_list <- c()
  for (col in names(c)){
    print(col)
    col_df <- c[(c[[col]] > 0.5) & (c[[col]] < 1),]
    if (nrow(col_df) > 0){
      cor_list[[col]] <- c(c(col),rownames(col_df))
    }
    print(rownames(col_df))
  }
  lapply(cor_list, write, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/CorFiles/TopCorrelations/Y3/",out), append=TRUE, ncolumns=1000)
  
}
wd <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/CorFiles/Y3/"
cor_files <- list.files(wd, pattern = "*.RDS")

for (cf in cor_files){
  extract_top_correlations_Y3(wd,cf)
}

