library(data.table)
library(dplyr)
library(ggplot2)
library(ggrepel)

trim_labels <- function(df){
  
  df$idx <- rownames(df)
  df$genelabels <- F
  df_no_dup <- df %>% distinct %>% group_by(symbol) %>% top_n(-1, pval)
  df_no_dup <- df_no_dup[!duplicated(df_no_dup$symbol),]
  df_no_dup <- df_no_dup[!(is.na(df_no_dup$symbol)),]
  df_no_dup <- df_no_dup[order(df_no_dup$pval),]
  
  idx_list <- df_no_dup$idx[which(df_no_dup$FDR < 0.05 & df_no_dup$sd_from_mean > 3)[1:5]]
  idx_list <- c(idx_list, df_no_dup$idx[which(df_no_dup$FDR < 0.05 & df_no_dup$sd_from_mean < -3)[1:5]])
  
  idx_list <- idx_list[!is.na(idx_list)]
  
  df[idx_list, "genelabels"] <- T
  
  return(df)
}

plot_volcano <- function(mpfc_file, dg_file, cea_file, col_df, nudge, title, out_file){
  # mpfc_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Exons/PTSD_mPFC.RDS"
  # dg_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Exons/PTSD_DG.RDS"
  # cea_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Exons/PTSD_CentralAmyg.RDS"
  # col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
  #                      Colors=c("grey95", "#e8deeb", "#783564", "#d2d6e4" ,"#2e677f", "#dfe4d2", "#5C6449"))
  # title <- "Exons"
  # nudge <- 1.5
  
  results_mPFC = readRDS(mpfc_file)
  results_DG = readRDS(dg_file)
  results_CeA = readRDS(cea_file)
  
  results_mPFC <- trim_labels(results_mPFC)
  results_DG <- trim_labels(results_DG)
  results_CeA <- trim_labels(results_CeA)
  
  results_mPFC$region <- "mPFC"
  results_DG$region <- "DG" 
  results_CeA$region <- "CeA"
  
  input <- rbind(results_mPFC, results_DG, results_CeA)
  
  results <- input
  results$lp <- -log10(results$pval)
  results$Color <- 1
  
  results[(results$pval < 0.05) &  (results$region == "CeA") , "Color"] <- 2
  results[(results$FDR < 0.05) & (results$region == "CeA") & (abs(results$sd_from_mean) < 3) , "Color"] <- 2
  results[(results$FDR < 0.05) & (results$region == "CeA") & (abs(results$sd_from_mean) > 3) , "Color"] <- 3
  
  results[(results$pval < 0.05) &  (results$region == "DG") , "Color"] <- 4
  results[(results$FDR < 0.05) & (results$region == "DG") & (abs(results$sd_from_mean) < 3) , "Color"] <- 4
  results[(results$FDR < 0.05) & (results$region == "DG") & (abs(results$sd_from_mean) > 3) , "Color"] <- 5
  
  results[(results$pval < 0.05) &  (results$region == "mPFC") , "Color"] <- 6
  results[(results$FDR < 0.05) & (results$region == "mPFC") & (abs(results$sd_from_mean) < 3) , "Color"] <- 6
  results[(results$FDR < 0.05) & (results$region == "mPFC") & (abs(results$sd_from_mean) > 3) , "Color"] <- 7
  
  
  # col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
  #                      Colors=c("grey95", "#d0cfe7", "#7577be", "#ddeedd" ,"#77be75", "#e7d0cf", "#D4A9A8"))
  
  cols <- unique(results$Color)
  col_df <- col_df[col_df$Vals %in% cols,]
  
  
  results$Shape <- 1
  
  results[(results$pval < 0.05) &  (results$region == "CeA") , "Shape"] <- 2
  results[(results$FDR < 0.05) &  (results$region == "CeA") , "Shape"] <- 3
  results[(results$pval < 0.05) &  (results$region == "DG") , "Shape"] <- 4
  results[(results$FDR < 0.05) &  (results$region == "DG") , "Shape"] <- 5
  results[(results$pval < 0.05) &  (results$region == "mPFC") , "Shape"] <- 6
  results[(results$FDR < 0.05) &  (results$region == "mPFC") , "Shape"] <- 7
  
  results$symbol[grep("H4C1", results$protein)] <- "H4Cx"
  sh_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
                      Shapes=c(20, 1, 16,0,15, 5,18))
  
  shs <- unique(results$Shape)
  sh_df <- sh_df[sh_df$Vals %in% shs,]
  
  
  
  results <- results[order(results$pval),]
  # results$genelabels <- F
  # results$genelabels[which(results$FDR < 0.05 & results$beta > 0 & results$region == "CeA")[1:5]] <- T
  # results$genelabels[which(results$FDR < 0.05 & results$beta < 0 & results$region == "CeA")[1:5]] <- T
  # results$genelabels[which(results$FDR < 0.05 & results$beta > 0 & results$region == "mPFC")[1:5]] <- T
  # results$genelabels[which(results$FDR < 0.05 & results$beta < 0 & results$region == "mPFC")[1:5]] <- T
  # results$genelabels[which(results$FDR < 0.05 & results$beta > 0 & results$region == "DG")[1:5]] <- T
  # results$genelabels[which(results$FDR < 0.05 & results$beta < 0 & results$region == "DG")[1:5]] <- T
  # 
  
  
  
  
  
  p<-ggplot(results) +
    geom_point(aes(x = beta, y = lp, colour = factor(Color), shape = factor(Shape)),size=3.5, alpha = 0.8) +
    geom_text_repel(data= filter(results, beta > 0), 
                    aes(x = beta, y = lp, color = factor(Color),
                        label = ifelse(genelabels == T, symbol,"")),fontface="bold.italic",size=5,
                    min.segment.length = unit(0, 'lines'), seed = 42, 
                    box.padding = 1,
                    segment.color = "grey30",
                    direction     = "y",
                    hjust         = "left", max.overlaps = Inf, nudge_x = nudge - filter(results, beta > 0)$beta) +
    geom_text_repel(data= filter(results, beta < 0), 
                    aes(x = beta, y = lp, color = factor(Color),
                        label = ifelse(genelabels == T, symbol,"")),fontface="bold.italic",size=5,
                    min.segment.length = unit(0, 'lines'), seed = 42, box.padding = 1,
                    segment.color = "grey30",
                    direction     = "y",
                    hjust         = "left", max.overlaps = Inf, nudge_x = -nudge - filter(results, beta < 0)$beta)+
    # geom_text_repel(aes(x = beta, y = lp, label = ifelse(genelabels == T, symbol,"")),fontface="italic",size=5,max.overlaps=Inf, 
    #                 box.padding = unit(0.5, "lines"), min.segment.length = Inf)+
    scale_color_manual(values=col_df$Colors)+
    scale_shape_manual(values=sh_df$Shapes )+
    xlab("beta") +
    ylab("-log10(pvalue)") +
    ggtitle(title)+
    theme_classic()+
    # scale_x_continuous(breaks = seq(-2, 2, by=1), limits=c(-2, 2))+
    # scale_y_continuous(breaks = seq(0, 10, by=2), limits=c(0,10))+
    theme(legend.position = "none",
          plot.title = element_text(color="black", size=14, face="bold", hjust = 0.5),
          text = element_text(size = 10,face="bold"), 
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10)
    )
  
  ggsave(filename = out_file,plot = p, device = "png", width = 9, height = 9, units = "in", dpi = 300, bg = "transparent")
  
}

gene_col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
                          Colors=c("grey95", "#e8deeb", "#a9709a", "#d2d6e4" ,"#709aa9", "#dfe4d2", "#9aa970"))
exon_col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
                          Colors=c("grey95", "#e8deeb", "#783564", "#d2d6e4" ,"#2e677f", "#dfe4d2", "#5C6449"))
jx_col_df <- data.frame(Vals=c(1,2,3,4,5,6,7),
                        Colors=c("grey95", "#e8deeb", "#804797", "#cecabf" ,"#9f843e", "#dfe4d2", "#607d75"))
tx_col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
                        Colors=c("grey95", "#e8deeb", "#b55bae", "#cecabf" ,"#b6bf51", "#d0dcdd", "#76979A"))
prot_col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
                          Colors=c("grey95", "#d2d3ea", "#7577be", "#d3ead2" ,"#77be75", "#e4c5c6", "#BE7577"))
pep_col_df <- data.frame(Vals=c(1,2,3,4,5,6,7),
                         Colors=c("grey95", "#d0cfe7", "#7577be", "#ddeedd" ,"#77be75", "#e7d0cf", "#D4A9A8"))
meth_col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
                          Colors=c("grey95", "#ddefd4", "#5a9d3b", "#c6d1ea" ,"#3b5a9d", "#e7d0cf", "#9d3b5a"))

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/PTSD_CentralAmyg_beta_sd.RDS",
             col_df = gene_col_df,
             nudge = 1.8,
             title = "Genes",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/RNA_Genes_PTSD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Exons/PTSD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Exons/PTSD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Exons/PTSD_CentralAmyg_beta_sd.RDS",
             col_df = exon_col_df,
             nudge = 1.5,
             title = "Exons",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/RNA_Exons_PTSD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Jxs/PTSD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Jxs/PTSD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Jxs/PTSD_CentralAmyg_beta_sd.RDS",
             col_df = jx_col_df,
             nudge = 2,
             title = "Jxs",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/RNA_Jxs_PTSD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Txs/PTSD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Txs/PTSD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Txs/PTSD_CentralAmyg_beta_sd.RDS",
             col_df = tx_col_df,
             nudge = 0.5,
             title = "Txs",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/RNA_Txs_PTSD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/PTSD_CentralAmyg_beta_sd.RDS",
             col_df = prot_col_df,
             nudge = 1,
             title = "Proteins",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/Proteins_PTSD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Peptides/PTSD_mPFCcc_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Peptides/PTSD_DGcc_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Peptides/PTSD_CentralAmygcc_beta_sd.RDS",
             col_df = pep_col_df,
             nudge = 1,
             title = "Peptides",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/Peptides_PTSD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Methylation/PTSD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Methylation/PTSD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Methylation/PTSD_CentralAmyg_beta_sd.RDS",
             col_df = meth_col_df,
             nudge = 1,
             title = "Methylation",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/Methylation_PTSD.png")




############################################################################################################################################


plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/MDD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/MDD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Genes/MDD_CentralAmyg_beta_sd.RDS",
             col_df = gene_col_df,
             nudge = 1.8,
             title = "Genes",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/RNA_Genes_MDD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Exons/MDD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Exons/MDD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Exons/MDD_CentralAmyg_beta_sd.RDS",
             col_df = exon_col_df,
             nudge = 1.5,
             title = "Exons",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/RNA_Exons_MDD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Jxs/MDD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Jxs/MDD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Jxs/MDD_CentralAmyg_beta_sd.RDS",
             col_df = jx_col_df,
             nudge = 2,
             title = "Jxs",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/RNA_Jxs_MDD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Txs/MDD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Txs/MDD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/RNA/Txs/MDD_CentralAmyg_beta_sd.RDS",
             col_df = tx_col_df,
             nudge = 0.5,
             title = "Txs",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/RNA_Txs_MDD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/MDD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/MDD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Proteins/MDD_CentralAmyg_beta_sd.RDS",
             col_df = prot_col_df,
             nudge = 1,
             title = "Proteins",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/Proteins_MDD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Peptides/MDD_mPFCcc_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Peptides/MDD_DGcc_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/Peptides/MDD_CentralAmygcc_beta_sd.RDS",
             col_df = pep_col_df,
             nudge = 1,
             title = "Peptides",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/Peptides_MDD.png")

plot_volcano(mpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Methylation/MDD_mPFC_beta_sd.RDS",
             dg_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Methylation/MDD_DG_beta_sd.RDS",
             cea_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Methylation/MDD_CentralAmyg_beta_sd.RDS",
             col_df = meth_col_df,
             nudge = 1,
             title = "Methylation",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BulkVolcanos/BetaSD/Methylation_MDD.png")



