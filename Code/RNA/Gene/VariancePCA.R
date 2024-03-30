
calculate_variance <- function(expr){
  var_df <- as.data.frame(apply(expr, 2, var, na.rm=T))
  var_df$Gene <- rownames(var_df)
  names(var_df) <- c("Variance", "Gene")
  var_df <- as.data.frame(var_df[complete.cases(var_df),])
  var_df <- var_df[order(var_df$Variance, decreasing = T),]
  
  return(var_df)
}

calculate_PCA <- function(voom_file){
  voom <- readRDS(voom_file)
  expr <- as.data.frame(voom$E)
  expr <- as.data.frame(t(expr))
  var_df <- calculate_variance(expr)
  top_genes <- var_df[1:500, "Gene"]
  
  expr_top <- expr[,top_genes]
  
  PCA <- prcomp(x = expr_top)
  PCs <- as.data.frame(PCA$x)
  PCs$SampleID <- rownames(PCs)
  
  PCs <- PCs %>%
    dplyr::select(SampleID, everything())
  return(PCs)
}


# Years 1 and 2
ca_PCA <- calculate_PCA("/path/to/Genes/batch1/VoomCentralAmyg.RDS")
dg_PCA <- calculate_PCA("/path/to/Genes/batch1/VoomDG.RDS")
mpfc_PCA <- calculate_PCA("/path/to/Genes/batch1/VoommPFC.RDS")

saveRDS(ca_PCA, "/path/to/PCA_CentralAmyg.RDS")
saveRDS(dg_PCA, "/path/to/PCA_DG.RDS")
saveRDS(mpfc_PCA, "/path/to/PCA_mPFC.RDS")


anno <- readRDS("/path/to/Annotation_batch1.RDS")
anno <- anno[, names(anno)[!(names(anno) %in% c("PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7", "PC8", "PC9", "PC10"))]]

ca_PCA <- merge(ca_PCA, anno, by="SampleID", all.x=T)
dg_PCA <- merge(dg_PCA, anno, by="SampleID", all.x=T)
mpfc_PCA <- merge(mpfc_PCA, anno, by="SampleID", all.x=T)

ggplot(ca_PCA, aes(x=PC3,y=PC4, color=Sex)) + geom_point()
ggplot(dg_PCA, aes(x=PC4,y=PC5, color=Dx)) + geom_point()
ggplot(mpfc_PCA, aes(x=PC4,y=PC5, color=Sex)) + geom_point()


