rm(list = ls())


MDD_mPFC_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/MDD_mPFC.RDS")
PTSD_mPFC_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_mPFC.RDS")
PTSD_MDD_mPFC_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_MDD_mPFC.RDS")
PTSD_vs_MDD_mPFC_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_vs_MDD_mPFC.RDS")

MDD_mPFC_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/MDD/results_MDD_mPFC_MDD.RDS")
PTSD_mPFC_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")
PTSD_MDD_mPFC_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS")
PTSD_vs_MDD_mPFC_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")

colnames(PTSD_vs_MDD_mPFC_Y12_3)[colnames(PTSD_vs_MDD_mPFC_Y12_3) == "beta"] <- "logFC"
colnames(MDD_mPFC_Y12_3)[colnames(MDD_mPFC_Y12_3) == "beta"] <- "logFC"
colnames(PTSD_mPFC_Y12_3)[colnames(PTSD_mPFC_Y12_3) == "beta"] <- "logFC"
colnames(PTSD_MDD_mPFC_Y12_3)[colnames(PTSD_MDD_mPFC_Y12_3) == "beta"] <- "logFC"

# List of Y12_3 data frame names
Y12_3_df_names <- c("PTSD_mPFC_Y12_3", "MDD_mPFC_Y12_3", "PTSD_MDD_mPFC_Y12_3", "PTSD_vs_MDD_mPFC_Y12_3")

# List of Y123 data frame names
Y123_df_names <- c("PTSD_mPFC_Y123", "MDD_mPFC_Y123", "PTSD_MDD_mPFC_Y123", "PTSD_vs_MDD_mPFC_Y123")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the Y12_3 data frame names
for (Y12_3_df_name in Y12_3_df_names) {
  # Iterate over the Y123 data frame names
  for (Y123_df_name in Y123_df_names) {
    # Merge the Y12_3 and Y123 data frames based on the "gene" column
    merged_df <- merge(get(Y12_3_df_name), get(Y123_df_name), by = "tx")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(Y12_3_df_name, Y123_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- Y12_3_df_names
colnames(cor_matrix) <- Y123_df_names

# Plot the heatmap
#heatmap(cor_matrix,
#       col = colorRampPalette(c("blue", "white", "red"))(100),
#      main = "Correlation Heatmap",
#     xlab = "Y123 Data Frames",
#    ylab = "Y12_3 Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device



library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)
colnames(melted_cor_matrix) = c("Txs_Y12_3", "Txs_Y123", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Txs_Y12_3, y=Txs_Y123, fill=value)) + 
  geom_tile() +
  geom_text(aes(Txs_Y12_3, Txs_Y123, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))

# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Txs/heatmap_mPFC_tx.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)




MDD_DG_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/MDD_DG.RDS")
PTSD_DG_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_DG.RDS")
PTSD_MDD_DG_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_MDD_DG.RDS")
PTSD_vs_MDD_DG_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_vs_MDD_DG.RDS")

MDD_DG_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/MDD/results_MDD_DG_MDD.RDS")
PTSD_DG_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD/results_PTSD_DG_PTSD.RDS")
PTSD_MDD_DG_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD_MDD/results_PTSD_MDD_DG_PTSD_MDD.RDS")
PTSD_vs_MDD_DG_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")

colnames(PTSD_vs_MDD_DG_Y12_3)[colnames(PTSD_vs_MDD_DG_Y12_3) == "beta"] <- "logFC"
colnames(MDD_DG_Y12_3)[colnames(MDD_DG_Y12_3) == "beta"] <- "logFC"
colnames(PTSD_DG_Y12_3)[colnames(PTSD_DG_Y12_3) == "beta"] <- "logFC"
colnames(PTSD_MDD_DG_Y12_3)[colnames(PTSD_MDD_DG_Y12_3) == "beta"] <- "logFC"

# List of Y12_3 data frame names
Y12_3_df_names <- c("PTSD_DG_Y12_3", "MDD_DG_Y12_3", "PTSD_MDD_DG_Y12_3", "PTSD_vs_MDD_DG_Y12_3")

# List of Y123 data frame names
Y123_df_names <- c("PTSD_DG_Y123", "MDD_DG_Y123", "PTSD_MDD_DG_Y123", "PTSD_vs_MDD_DG_Y123")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the Y12_3 data frame names
for (Y12_3_df_name in Y12_3_df_names) {
  # Iterate over the Y123 data frame names
  for (Y123_df_name in Y123_df_names) {
    # Merge the Y12_3 and Y123 data frames based on the "gene" column
    merged_df <- merge(get(Y12_3_df_name), get(Y123_df_name), by = "tx")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(Y12_3_df_name, Y123_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- Y12_3_df_names
colnames(cor_matrix) <- Y123_df_names

# Plot the heatmap
#heatmap(cor_matrix,
#       col = colorRampPalette(c("blue", "white", "red"))(100),
#      main = "Correlation Heatmap",
#     xlab = "Y123 Data Frames",
#    ylab = "Y12_3 Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device


library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)
colnames(melted_cor_matrix) = c("Txs_Y12_3", "Txs_Y123", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Txs_Y12_3, y=Txs_Y123, fill=value)) + 
  geom_tile() +
  geom_text(aes(Txs_Y12_3, Txs_Y123, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))


# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Txs/heatmap_DG_tx.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)





MDD_CentralAmyg_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/MDD_CentralAmyg.RDS")
PTSD_CentralAmyg_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_CentralAmyg.RDS")
PTSD_MDD_CentralAmyg_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_MDD_CentralAmyg.RDS")
PTSD_vs_MDD_CentralAmyg_Y12_3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/PTSD_vs_MDD_CentralAmyg.RDS")

MDD_CentralAmyg_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")
PTSD_CentralAmyg_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
PTSD_MDD_CentralAmyg_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD_MDD/results_PTSD_MDD_CentralAmyg_PTSD_MDD.RDS")
#PTSD_MDD_CentralAmyg_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/others/results/LimmaResults/RNA/r/Y123/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")

PTSD_vs_MDD_CentralAmyg_Y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Tx/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")

colnames(PTSD_vs_MDD_CentralAmyg_Y12_3)[colnames(PTSD_vs_MDD_CentralAmyg_Y12_3) == "beta"] <- "logFC"
colnames(MDD_CentralAmyg_Y12_3)[colnames(MDD_CentralAmyg_Y12_3) == "beta"] <- "logFC"
colnames(PTSD_CentralAmyg_Y12_3)[colnames(PTSD_CentralAmyg_Y12_3) == "beta"] <- "logFC"
colnames(PTSD_MDD_CentralAmyg_Y12_3)[colnames(PTSD_MDD_CentralAmyg_Y12_3) == "beta"] <- "logFC"

# List of Y12_3 data frame names
Y12_3_df_names <- c("PTSD_CentralAmyg_Y12_3", "MDD_CentralAmyg_Y12_3", "PTSD_MDD_CentralAmyg_Y12_3", "PTSD_vs_MDD_CentralAmyg_Y12_3")

# List of Y123 data frame names
Y123_df_names <- c("PTSD_CentralAmyg_Y123", "MDD_CentralAmyg_Y123", "PTSD_MDD_CentralAmyg_Y123", "PTSD_vs_MDD_CentralAmyg_Y123")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the Y12_3 data frame names
for (Y12_3_df_name in Y12_3_df_names) {
  # Iterate over the Y123 data frame names
  for (Y123_df_name in Y123_df_names) {
    # Merge the Y12_3 and Y123 data frames based on the "gene" column
    merged_df <- merge(get(Y12_3_df_name), get(Y123_df_name), by = "tx")
    
    # Calculate the correlation between the "logFC.x" and "logFC.y" columns
    correlation <- cor(merged_df$logFC.x, merged_df$logFC.y, method = "spearman")
    
    # Store the correlation value
    correlation_values[[paste(Y12_3_df_name, Y123_df_name, sep = "_vs_")]] <- correlation
  }
}

# Print the correlation values
for (key in names(correlation_values)) {
  cat("Correlation between", key, ":", correlation_values[[key]], "\n")
}



# Create a matrix of correlation values
cor_matrix <- matrix(unlist(correlation_values), nrow = 4, byrow = TRUE)

# Set row and column names for the matrix
rownames(cor_matrix) <- Y12_3_df_names
colnames(cor_matrix) <- Y123_df_names

# Plot the heatmap
#heatmap(cor_matrix,
 #       col = colorRampPalette(c("blue", "white", "red"))(100),
  #      main = "Correlation Heatmap",
   #     xlab = "Y123 Data Frames",
    #    ylab = "Y12_3 Data Frames")

# Save and close the plotting device
#dev.off()
# Create a smaller plotting device


library(ggplot2)
library(reshape2)

# Melting your matrix for ggplot
melted_cor_matrix <- melt(cor_matrix)
colnames(melted_cor_matrix) = c("Txs_Y12_3", "Txs_Y123", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Txs_Y12_3, y=Txs_Y123, fill=value)) + 
  geom_tile() +
  geom_text(aes(Txs_Y12_3, Txs_Y123, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))


# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Txs/heatmap_CentralAmyg_tx.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)

