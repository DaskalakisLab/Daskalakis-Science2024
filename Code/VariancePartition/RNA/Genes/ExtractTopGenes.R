prep_vp <- function(df){
  df <- as.data.frame(df)
  df$genes <- rownames(df)
  
  gene_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/RNA_Gene_Map.RDS")
  df <- merge(df, gene_map, by="genes", all.x=T)
  names(df) <- gsub("`", "", names(df))
  
  return(df)
}

extract_top_n_genes <- function(df, col, n){
  
  df <- df[order(df[[col]], decreasing = T),]
  df <- df[1:n,c(col, "symbol")]
  df$Rank <- 1:n
  
  df_return <- as.data.frame(matrix(NA,nrow=n,ncol=4))
  names(df_return) <- c("Var", "Gene", "VP", "Rank")
  df_return$VP <- df[[col]]
  df_return$Gene <- df$symbol
  df_return$Var <- col
  df_return$Rank <- df$Rank
  return(df_return)
  
}

run_extraction <- function(df, n){
  
  cols <- names(df)
  cols <- cols[!(cols %in% c("genes", "symbol"))]
  
  first=T
  for (col in cols){
    print(col)
    if (first){
      top_df <- extract_top_n_genes(df,col,n)
      first = F
    }else{
      top_df <- rbind(top_df, extract_top_n_genes(df,col,n))
    }
  }
  
  return(top_df)
  
}


mPFC_ae <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/VarPartFiles/Y1Y2/mPFC_ae.RDS")
mPFC_ae <- prep_vp(mPFC_ae)
top_mPFC <- run_extraction(mPFC_ae,10)
saveRDS(top_mPFC, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/TopGenes/top_mPFC_ae.RDS")



