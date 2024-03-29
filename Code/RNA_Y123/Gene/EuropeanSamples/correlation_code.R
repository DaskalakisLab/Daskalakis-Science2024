rm(list = ls())


MDD_mPFC_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/MDD/results_MDD_mPFC_MDD.RDS")
PTSD_mPFC_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD/results_PTSD_mPFC_PTSD.RDS")
PTSD_MDD_mPFC_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS")
PTSD_vs_MDD_mPFC_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")

MDD_mPFC_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/MDD/results_MDD_mPFC_MDD.RDS")
PTSD_mPFC_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")
PTSD_MDD_mPFC_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS")
PTSD_vs_MDD_mPFC_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")


old_df_names <- c("PTSD_mPFC_EU", "MDD_mPFC_EU", "PTSD_MDD_mPFC_EU", "PTSD_vs_MDD_mPFC_EU")

# List of new data frame names
new_df_names <- c("PTSD_mPFC_123", "MDD_mPFC_123", "PTSD_MDD_mPFC_123", "PTSD_vs_MDD_mPFC_123")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the old data frame names
for (old_df_name in old_df_names) {
  # Iterate over the new data frame names
  for (new_df_name in new_df_names) {
    # Merge the old and new data frames based on the "gene" column
    merged_df <- merge(get(old_df_name), get(new_df_name), by = "gene")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(old_df_name, new_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- old_df_names
colnames(cor_matrix) <- new_df_names

# Plot the heatmap
#heatmap(cor_matrix,
#       col = colorRampPalette(c("blue", "white", "red"))(100),
#      main = "Correlation Heatmap",
#     xlab = "New Data Frames",
#    ylab = "Old Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device



library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() +
  geom_text(aes(Var1, Var2, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))

# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/EuropeanSamples/heatmap_mPFC_gene.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)




MDD_DG_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/MDD/results_MDD_DG_MDD.RDS")
PTSD_DG_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD/results_PTSD_DG_PTSD.RDS")
PTSD_MDD_DG_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD_MDD/results_PTSD_MDD_DG_PTSD_MDD.RDS")
PTSD_vs_MDD_DG_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")

MDD_DG_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/MDD/results_MDD_DG_MDD.RDS")
PTSD_DG_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD/results_PTSD_DG_PTSD.RDS")
PTSD_MDD_DG_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
PTSD_vs_MDD_DG_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")

# List of old data frame names
old_df_names <- c("PTSD_DG_EU", "MDD_DG_EU", "PTSD_MDD_DG_EU", "PTSD_vs_MDD_DG_EU")

# List of new data frame names
new_df_names <- c("PTSD_DG_123", "MDD_DG_123", "PTSD_MDD_DG_123", "PTSD_vs_MDD_DG_123")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the old data frame names
for (old_df_name in old_df_names) {
  # Iterate over the new data frame names
  for (new_df_name in new_df_names) {
    # Merge the old and new data frames based on the "gene" column
    merged_df <- merge(get(old_df_name), get(new_df_name), by = "gene")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(old_df_name, new_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- old_df_names
colnames(cor_matrix) <- new_df_names

# Plot the heatmap
#heatmap(cor_matrix,
#       col = colorRampPalette(c("blue", "white", "red"))(100),
#      main = "Correlation Heatmap",
#     xlab = "New Data Frames",
#    ylab = "Old Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device


library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() +
  geom_text(aes(Var1, Var2, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))


# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/EuropeanSamples/heatmap_DG_gene.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)





MDD_CentralAmyg_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/MDD/results_MDD_CentralAmyg_MDD.RDS")
PTSD_CentralAmyg_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
PTSD_MDD_CentralAmyg_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD_MDD/results_PTSD_MDD_CentralAmyg_PTSD_MDD.RDS")
PTSD_vs_MDD_CentralAmyg_EU <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/LimmaResults/RNA/Genes/Y1Y2Y3/EuropeanSamples/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")

MDD_CentralAmyg_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")
PTSD_CentralAmyg_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
#PTSD_MDD_CentralAmyg_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
PTSD_MDD_CentralAmyg_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/others/results/LimmaResults/RNA/Genes/Y123/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")

PTSD_vs_MDD_CentralAmyg_123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Gene/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")

# List of old data frame names
old_df_names <- c("PTSD_CentralAmyg_EU", "MDD_CentralAmyg_EU", "PTSD_MDD_CentralAmyg_EU", "PTSD_vs_MDD_CentralAmyg_EU")

# List of new data frame names
new_df_names <- c("PTSD_CentralAmyg_123", "MDD_CentralAmyg_123", "PTSD_MDD_CentralAmyg_123", "PTSD_vs_MDD_CentralAmyg_123")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the old data frame names
for (old_df_name in old_df_names) {
  # Iterate over the new data frame names
  for (new_df_name in new_df_names) {
    # Merge the old and new data frames based on the "gene" column
    merged_df <- merge(get(old_df_name), get(new_df_name), by = "gene")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(old_df_name, new_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- old_df_names
colnames(cor_matrix) <- new_df_names

# Plot the heatmap
#heatmap(cor_matrix,
 #       col = colorRampPalette(c("blue", "white", "red"))(100),
  #      main = "Correlation Heatmap",
   #     xlab = "New Data Frames",
    #    ylab = "Old Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device


library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() +
  geom_text(aes(Var1, Var2, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))


# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/EuropeanSamples/heatmap_CentralAmyg_gene.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)

