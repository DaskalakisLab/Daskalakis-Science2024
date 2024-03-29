rm(list = ls())


MDD_mPFC_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/MDD_mPFC.RDS")
PTSD_mPFC_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_mPFC.RDS")
PTSD_MDD_mPFC_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_MDD_mPFC.RDS")
PTSD_vs_MDD_mPFC_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_vs_MDD_mPFC.RDS")

MDD_mPFC_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/MDD/results_MDD_mPFC_MDD.RDS")
PTSD_mPFC_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")
PTSD_MDD_mPFC_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS")
PTSD_vs_MDD_mPFC_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")

colnames(PTSD_vs_MDD_mPFC_META)[colnames(PTSD_vs_MDD_mPFC_META) == "beta"] <- "logFC"
colnames(MDD_mPFC_META)[colnames(MDD_mPFC_META) == "beta"] <- "logFC"
colnames(PTSD_mPFC_META)[colnames(PTSD_mPFC_META) == "beta"] <- "logFC"
colnames(PTSD_MDD_mPFC_META)[colnames(PTSD_MDD_mPFC_META) == "beta"] <- "logFC"


# # Subset data frames to only include rows with genes in common_genes
#   df1_common <- df1[df1[[gene_col1]] %in% common_genes,]
#   df2_common <- df2[df2[[gene_col2]] %in% common_genes,]
# 
#   # Find genes that are nominally significant in the subsets
#   df1_nom <- df1_common[[pval_col1]] < 0.05
#   df2_nom <- df2_common[[pval_col2]] < 0.05
# 
#   # [1,1] # of genes that are nominal both in y4 and meta
#   both_nom <- sum(df1_nom & df2_nom)
# List of META data frame names
META_df_names <- c("PTSD_mPFC_META", "MDD_mPFC_META", "PTSD_MDD_mPFC_META", "PTSD_vs_MDD_mPFC_META")

# List of MEGA data frame names
MEGA_df_names <- c("PTSD_mPFC_MEGA", "MDD_mPFC_MEGA", "PTSD_MDD_mPFC_MEGA", "PTSD_vs_MDD_mPFC_MEGA")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the META data frame names
for (META_df_name in META_df_names) {
  # Iterate over the MEGA data frame names
  for (MEGA_df_name in MEGA_df_names) {
    # Merge the META and MEGA data frames based on the "gene" column
    merged_df <- merge(get(META_df_name), get(MEGA_df_name), by = "gene")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(META_df_name, MEGA_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- META_df_names
colnames(cor_matrix) <- MEGA_df_names

# Plot the heatmap
#heatmap(cor_matrix,
#       col = colorRampPalette(c("blue", "white", "red"))(100),
#      main = "Correlation Heatmap",
#     xlab = "MEGA Data Frames",
#    ylab = "META Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device



library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)
colnames(melted_cor_matrix) = c("Genes_META", "Genes_MEGA", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Genes_META, y=Genes_MEGA, fill=value)) + 
  geom_tile() +
  geom_text(aes(Genes_META, Genes_MEGA, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))

# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Genes/heatmap_mPFC_gene.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)




MDD_DG_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/MDD_DG.RDS")
PTSD_DG_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_DG.RDS")
PTSD_MDD_DG_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_MDD_DG.RDS")
PTSD_vs_MDD_DG_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_vs_MDD_DG.RDS")

MDD_DG_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/MDD/results_MDD_DG_MDD.RDS")
PTSD_DG_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD/results_PTSD_DG_PTSD.RDS")
PTSD_MDD_DG_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
PTSD_vs_MDD_DG_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")

colnames(PTSD_vs_MDD_DG_META)[colnames(PTSD_vs_MDD_DG_META) == "beta"] <- "logFC"
colnames(MDD_DG_META)[colnames(MDD_DG_META) == "beta"] <- "logFC"
colnames(PTSD_DG_META)[colnames(PTSD_DG_META) == "beta"] <- "logFC"
colnames(PTSD_MDD_DG_META)[colnames(PTSD_MDD_DG_META) == "beta"] <- "logFC"

# List of META data frame names
META_df_names <- c("PTSD_DG_META", "MDD_DG_META", "PTSD_MDD_DG_META", "PTSD_vs_MDD_DG_META")

# List of MEGA data frame names
MEGA_df_names <- c("PTSD_DG_MEGA", "MDD_DG_MEGA", "PTSD_MDD_DG_MEGA", "PTSD_vs_MDD_DG_MEGA")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the META data frame names
for (META_df_name in META_df_names) {
  # Iterate over the MEGA data frame names
  for (MEGA_df_name in MEGA_df_names) {
    # Merge the META and MEGA data frames based on the "gene" column
    merged_df <- merge(get(META_df_name), get(MEGA_df_name), by = "gene")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(META_df_name, MEGA_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- META_df_names
colnames(cor_matrix) <- MEGA_df_names

# Plot the heatmap
#heatmap(cor_matrix,
#       col = colorRampPalette(c("blue", "white", "red"))(100),
#      main = "Correlation Heatmap",
#     xlab = "MEGA Data Frames",
#    ylab = "META Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device


library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)
colnames(melted_cor_matrix) = c("Genes_META", "Genes_MEGA", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Genes_META, y=Genes_MEGA, fill=value)) + 
  geom_tile() +
  geom_text(aes(Genes_META, Genes_MEGA, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))


# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Genes/heatmap_DG_gene.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)





MDD_CentralAmyg_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/MDD_CentralAmyg.RDS")
PTSD_CentralAmyg_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_CentralAmyg.RDS")
PTSD_MDD_CentralAmyg_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_MDD_CentralAmyg.RDS")
PTSD_vs_MDD_CentralAmyg_META <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/PTSD_vs_MDD_CentralAmyg.RDS")

MDD_CentralAmyg_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")
PTSD_CentralAmyg_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
#PTSD_MDD_CentralAmyg_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
PTSD_MDD_CentralAmyg_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/others/results/LimmaResults/RNA/Genes/MEGA/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")

PTSD_vs_MDD_CentralAmyg_MEGA <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")

colnames(PTSD_vs_MDD_CentralAmyg_META)[colnames(PTSD_vs_MDD_CentralAmyg_META) == "beta"] <- "logFC"
colnames(MDD_CentralAmyg_META)[colnames(MDD_CentralAmyg_META) == "beta"] <- "logFC"
colnames(PTSD_CentralAmyg_META)[colnames(PTSD_CentralAmyg_META) == "beta"] <- "logFC"
colnames(PTSD_MDD_CentralAmyg_META)[colnames(PTSD_MDD_CentralAmyg_META) == "beta"] <- "logFC"

# List of META data frame names
META_df_names <- c("PTSD_CentralAmyg_META", "MDD_CentralAmyg_META", "PTSD_MDD_CentralAmyg_META", "PTSD_vs_MDD_CentralAmyg_META")

# List of MEGA data frame names
MEGA_df_names <- c("PTSD_CentralAmyg_MEGA", "MDD_CentralAmyg_MEGA", "PTSD_MDD_CentralAmyg_MEGA", "PTSD_vs_MDD_CentralAmyg_MEGA")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the META data frame names
for (META_df_name in META_df_names) {
  # Iterate over the MEGA data frame names
  for (MEGA_df_name in MEGA_df_names) {
    # Merge the META and MEGA data frames based on the "gene" column
    merged_df <- merge(get(META_df_name), get(MEGA_df_name), by = "gene")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(META_df_name, MEGA_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- META_df_names
colnames(cor_matrix) <- MEGA_df_names

# Plot the heatmap
#heatmap(cor_matrix,
 #       col = colorRampPalette(c("blue", "white", "red"))(100),
  #      main = "Correlation Heatmap",
   #     xlab = "MEGA Data Frames",
    #    ylab = "META Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device


library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)
colnames(melted_cor_matrix) = c("Genes_META", "Genes_MEGA", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Genes_META, y=Genes_MEGA, fill=value)) + 
  geom_tile() +
  geom_text(aes(Genes_META, Genes_MEGA, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))


# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Genes/heatmap_CentralAmyg_gene.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)

