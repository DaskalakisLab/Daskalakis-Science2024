# Step 1: Calculate variance per proteins across all subjects (use na.rm to get variance for all proteins)
# Step 2: Idenitfy top n proteins (start with 500)
# Step 3: Calculate PCA in raw/normalized data (PCs per subject i.e. subjects as cols proteins as rows)
library(stats)
library(dplyr)
library(ggplot2)

calculate_variance <- function(df){
  
  var_df <- as.data.frame(apply(df, 2, var, na.rm=T))
  var_df$Protein <- rownames(var_df)
  names(var_df) <- c("Variance", "Protein")
  #var_df <- as.data.frame(var_df[complete.cases(var_df),])
  
  return(var_df)
}

calculate_PCs <- function(expr){
  var_df <- calculate_variance(expr)
  expr <- expr[ , colSums(is.na(expr))==0]
  var_df <- var_df[var_df$Protein %in% names(expr),]
  var_df <- var_df[order(var_df$Variance, decreasing = T),]
  top_500 <- var_df[1:500,"Protein"]
  
  expr_500 <- expr[, names(expr)[(names(expr)%in% top_500)]]
  PCA <- prcomp(x = expr_500)
  PCs <- as.data.frame(PCA$x)
  return(PCs)
}


expr_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_CentralAmyg_clean_no_GIS.RDS")
expr_ca <- as.data.frame(t(expr_ca))
PC_ca <- calculate_PCs(expr_ca)
PC_ca <- as.data.frame(PC_ca)

expr_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_DG_clean_no_GIS.RDS")
expr_dg <- as.data.frame(t(expr_dg))
PC_dg <- calculate_PCs(expr_dg)
PC_dg <- as.data.frame(PC_dg)

expr_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2Y3/Proteins/CleanedWithSampleIDs/Y1Y2Y3_mPFC_clean_no_GIS.RDS")
expr_mpfc <- as.data.frame(t(expr_mpfc))
PC_mpfc <- calculate_PCs(expr_mpfc)
PC_mpfc <- as.data.frame(PC_mpfc)


saveRDS(PC_ca, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Protein/Proteins/Y1Y2Y3/PCA_CentralAmyg.RDS")
saveRDS(PC_dg, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Protein/Proteins/Y1Y2Y3/PCA_DG.RDS")
saveRDS(PC_mpfc, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Protein/Proteins/Y1Y2Y3/PCA_mPFC.RDS")


#