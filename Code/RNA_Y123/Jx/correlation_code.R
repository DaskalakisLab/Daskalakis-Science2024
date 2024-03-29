rm(list = ls())


MDD_mPFC_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/MDD_mPFC.RDS")
PTSD_mPFC_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_mPFC.RDS")
PTSD_MDD_mPFC_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_MDD_mPFC.RDS")
PTSD_vs_MDD_mPFC_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_vs_MDD_mPFC.RDS")

MDD_mPFC_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/MDD/results_MDD_mPFC_MDD.RDS")
PTSD_mPFC_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")
PTSD_MDD_mPFC_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS")
PTSD_vs_MDD_mPFC_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")

colnames(PTSD_vs_MDD_mPFC_old)[colnames(PTSD_vs_MDD_mPFC_old) == "beta"] <- "logFC"
colnames(MDD_mPFC_old)[colnames(MDD_mPFC_old) == "beta"] <- "logFC"
colnames(PTSD_mPFC_old)[colnames(PTSD_mPFC_old) == "beta"] <- "logFC"
colnames(PTSD_MDD_mPFC_old)[colnames(PTSD_MDD_mPFC_old) == "beta"] <- "logFC"

# List of old data frame names
old_df_names <- c("PTSD_mPFC_old", "MDD_mPFC_old", "PTSD_MDD_mPFC_old", "PTSD_vs_MDD_mPFC_old")

# List of new data frame names
new_df_names <- c("PTSD_mPFC_new", "MDD_mPFC_new", "PTSD_MDD_mPFC_new", "PTSD_vs_MDD_mPFC_new")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the old data frame names
for (old_df_name in old_df_names) {
  # Iterate over the new data frame names
  for (new_df_name in new_df_names) {
    # Merge the old and new data frames based on the "gene" column
    merged_df <- merge(get(old_df_name), get(new_df_name), by = "jx")
    
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
colnames(melted_cor_matrix) = c("Jxs_Y12_3", "Jxs_Y123", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Jxs_Y12_3, y=Jxs_Y123, fill=value)) + 
  geom_tile() +
  geom_text(aes(Jxs_Y12_3, Jxs_Y123, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))

# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Jxs/heatmap_mPFC_jx.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)




MDD_DG_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/MDD_DG.RDS")
PTSD_DG_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_DG.RDS")
PTSD_MDD_DG_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_MDD_DG.RDS")
PTSD_vs_MDD_DG_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_vs_MDD_DG.RDS")

MDD_DG_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/MDD/results_MDD_DG_MDD.RDS")
PTSD_DG_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD/results_PTSD_DG_PTSD.RDS")
PTSD_MDD_DG_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD_MDD/results_PTSD_MDD_DG_PTSD_MDD.RDS")
PTSD_vs_MDD_DG_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")

colnames(PTSD_vs_MDD_DG_old)[colnames(PTSD_vs_MDD_DG_old) == "beta"] <- "logFC"
colnames(MDD_DG_old)[colnames(MDD_DG_old) == "beta"] <- "logFC"
colnames(PTSD_DG_old)[colnames(PTSD_DG_old) == "beta"] <- "logFC"
colnames(PTSD_MDD_DG_old)[colnames(PTSD_MDD_DG_old) == "beta"] <- "logFC"

# List of old data frame names
old_df_names <- c("PTSD_DG_old", "MDD_DG_old", "PTSD_MDD_DG_old", "PTSD_vs_MDD_DG_old")

# List of new data frame names
new_df_names <- c("PTSD_DG_new", "MDD_DG_new", "PTSD_MDD_DG_new", "PTSD_vs_MDD_DG_new")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the old data frame names
for (old_df_name in old_df_names) {
  # Iterate over the new data frame names
  for (new_df_name in new_df_names) {
    # Merge the old and new data frames based on the "gene" column
    merged_df <- merge(get(old_df_name), get(new_df_name), by = "jx")
    
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
colnames(melted_cor_matrix) = c("Jxs_Y12_3", "Jxs_Y123", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Jxs_Y12_3, y=Jxs_Y123, fill=value)) + 
  geom_tile() +
  geom_text(aes(Jxs_Y12_3, Jxs_Y123, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))


# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Jxs/heatmap_DG_jx.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)





MDD_CentralAmyg_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/MDD_CentralAmyg.RDS")
PTSD_CentralAmyg_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_CentralAmyg.RDS")
PTSD_MDD_CentralAmyg_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_MDD_CentralAmyg.RDS")
PTSD_vs_MDD_CentralAmyg_old <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/PTSD_vs_MDD_CentralAmyg.RDS")

MDD_CentralAmyg_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")
PTSD_CentralAmyg_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
PTSD_MDD_CentralAmyg_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD_MDD/results_PTSD_MDD_CentralAmyg_PTSD_MDD.RDS")
#PTSD_MDD_CentralAmyg_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/others/results/LimmaResults/RNA/r/Y123/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")

PTSD_vs_MDD_CentralAmyg_new <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Limma_Results/Jx/Y1Y2Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")

colnames(PTSD_vs_MDD_CentralAmyg_old)[colnames(PTSD_vs_MDD_CentralAmyg_old) == "beta"] <- "logFC"
colnames(MDD_CentralAmyg_old)[colnames(MDD_CentralAmyg_old) == "beta"] <- "logFC"
colnames(PTSD_CentralAmyg_old)[colnames(PTSD_CentralAmyg_old) == "beta"] <- "logFC"
colnames(PTSD_MDD_CentralAmyg_old)[colnames(PTSD_MDD_CentralAmyg_old) == "beta"] <- "logFC"

# List of old data frame names
old_df_names <- c("PTSD_CentralAmyg_old", "MDD_CentralAmyg_old", "PTSD_MDD_CentralAmyg_old", "PTSD_vs_MDD_CentralAmyg_old")

# List of new data frame names
new_df_names <- c("PTSD_CentralAmyg_new", "MDD_CentralAmyg_new", "PTSD_MDD_CentralAmyg_new", "PTSD_vs_MDD_CentralAmyg_new")

# Create an empty list to store the correlation values
correlation_values <- list()

# Iterate over the old data frame names
for (old_df_name in old_df_names) {
  # Iterate over the new data frame names
  for (new_df_name in new_df_names) {
    # Merge the old and new data frames based on the "gene" column
    merged_df <- merge(get(old_df_name), get(new_df_name), by = "jx")
    
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
colnames(melted_cor_matrix) = c("Jxs_Y12_3", "Jxs_Y123", "value")

# Creating heatmap with correlation values
heatmap <- ggplot(data = melted_cor_matrix, aes(x=Jxs_Y12_3, y=Jxs_Y123, fill=value)) + 
  geom_tile() +
  geom_text(aes(Jxs_Y12_3, Jxs_Y123, label = round(value, 2)), size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Spearman\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))


# Saving the heatmap to a pdf
ggsave(file = "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Correlations/Correlations_Heatmap/RNA/Jxs/heatmap_CentralAmyg_jx.pdf", plot = heatmap, width = 7, height = 7, dpi = 300)

