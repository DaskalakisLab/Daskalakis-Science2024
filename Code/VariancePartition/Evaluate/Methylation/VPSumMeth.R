library(ggplot2)
library(ggpubr)

plot_rna_vp <- function(df, title){
  median_df <- as.data.frame(apply(df,2,median))
  names(median_df) <- "median"
  median_df$cov <- rownames(median_df)
  median_df <- median_df[rownames(median_df)!="Residuals",]
  
  mean_df <- as.data.frame(apply(df,2,mean))
  names(mean_df) <- "mean"
  mean_df$cov <- rownames(mean_df)
  mean_df <- mean_df[rownames(mean_df)!="Residuals",]
  stat_df <- merge(mean_df, median_df, by="cov")
  rownames(stat_df) <- stat_df$cov
  rm(mean_df, median_df)
  
  baseline_covs <- c("PTSD","MDD","AgeDeath","Sex","PMI","NeuN_neg","NeuN_pos","ancestryPC1","ancestryPC2")
  
  baseline_sum <- 0
  for (bc in baseline_covs){
    baseline_sum <- baseline_sum+stat_df[stat_df$cov==bc, "mean"]
  }
  
  sum_df <- as.data.frame(matrix(0,nrow = 8, ncol=2))
  names(sum_df) <- c("Covs", "SumVP")
  
  sum_df[1,1] <- "Baseline (Dx,Age,Sex,PMI,Neurons,APC1-2)"
  sum_df[1,2] <- baseline_sum
  
  stat_df_non_base <- stat_df[stat_df$cov %in% c("ancestryPC3","Meth_PC1","Meth_PC2","Meth_PC3","Meth_PC4","Meth_PC5","Smoking"),]
  stat_df_non_base <- stat_df_non_base[order(stat_df_non_base$median, decreasing = T),]
  
  i <- 2
  total_sum <- baseline_sum
  sum_name <- "Baseline"
  for (c in stat_df_non_base$cov){
    total_sum <- total_sum + stat_df_non_base[stat_df_non_base$cov==c,"mean"]
    sum_name <-  paste0(sum_name,"+",c)
    sum_df[i,1] <- sum_name
    sum_df[i,2] <- total_sum
    i <- i+1
  }
  
  p <- ggplot(sum_df, aes(x=Covs, y=SumVP)) + 
    geom_point() + 
    xlab("Covariates") +
    ylab("Sum Variance Explained (Mean)") +
    scale_y_continuous(limits = c(0,.5)) +
    theme(axis.text.x = element_text(angle = 90, vjust = .5, hjust=1)) +
    ggtitle(title)
  
  return(p)
}

ca_rna <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/VariancePartition/VarPartFiles/Y1Y2/CentralAmyg_neuron.RDS")
dg_rna <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/VariancePartition/VarPartFiles/Y1Y2/DG_neuron.RDS")
mpfc_rna <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/VariancePartition/VarPartFiles/Y1Y2/mPFC_neuron.RDS")


p_ca <- plot_rna_vp(ca_rna, "CentralAmyg Methylation")
p_dg <- plot_rna_vp(dg_rna, "DG Methylation")
p_mpfc <- plot_rna_vp(mpfc_rna, "mPFC Methylation")

figure <- ggarrange(p_ca, p_dg, p_mpfc,
                    labels = c("A", "B", "C"),
                    ncol = 3, nrow = 1)
figure
ggsave(filename = "/data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Evaluate/Methylation/plots/SumVP_Methylation_neuron.pdf",
       plot = figure,
       device = "pdf",
       width = 15,
       height = 8)
