library(data.table)
library(dplyr)
library(ggplot2)
library(ggrepel)

trim_labels <- function(df){
  
  df$idx <- rownames(df)
  df$genelabels <- F
  df_no_dup <- df %>% distinct %>% group_by(Symbol) %>% top_n(-1, P.Value)
  df_no_dup <- df_no_dup[!duplicated(df_no_dup$Symbol),]
  df_no_dup <- df_no_dup[!(is.na(df_no_dup$Symbol)),]
  df_no_dup <- df_no_dup[order(df_no_dup$P.Value),]
  
  idx_list <- df_no_dup$idx[which(df_no_dup$adj.P.Val < 0.05 & df_no_dup$sd_from_mean > 3)[1:5]]
  idx_list <- c(idx_list, df_no_dup$idx[which(df_no_dup$adj.P.Val < 0.05 & df_no_dup$sd_from_mean < -3)[1:5]])
  
  idx_list <- idx_list[!is.na(idx_list)]
  
  df[idx_list, "genelabels"] <- T
  
  return(df)
}

plot_volcano <- function(dlpfc_file, col_df, nudge, title, out_file){
  # mpfc_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Exons/PTSD_mPFC.RDS"
  # dg_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Exons/PTSD_DG.RDS"
  # cea_file <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Exons/PTSD_CentralAmyg.RDS"
  # col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
  #                      Colors=c("grey95", "#e8deeb", "#783564", "#d2d6e4" ,"#2e677f", "#dfe4d2", "#5C6449"))
  # title <- "Exons"
  # nudge <- 1.5
  
  results = readRDS(dlpfc_file)
  
  results <- trim_labels(results)
  
  
  results$region <- "DLPFC"
  results$lp <- -log10(results$P.Value)
  results$Color <- 1
  
  results[(results$P.Value < 0.05) &  (results$region == "DLPFC") , "Color"] <- 2
  results[(results$adj.P.Val < 0.05) & (results$region == "DLPFC") & (abs(results$sd_from_mean) < 3) , "Color"] <- 2
  results[(results$adj.P.Val < 0.05) & (results$region == "DLPFC") & (abs(results$sd_from_mean) > 3) , "Color"] <- 3
  
  
  # col_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
  #                      Colors=c("grey95", "#d0cfe7", "#7577be", "#ddeedd" ,"#77be75", "#e7d0cf", "#D4A9A8"))
  
  cols <- unique(results$Color)
  col_df <- col_df[col_df$Vals %in% cols,]
  
  
  results$Shape <- 1
  
  results[(results$P.Value < 0.05) &  (results$region == "DLPFC") , "Shape"] <- 2
  results[(results$adj.P.Val < 0.05) &  (results$region == "DLPFC") , "Shape"] <- 3
  
  
  #results$Symbol[grep("H4C1", results$protein)] <- "H4Cx"
  sh_df <- data.frame(Vals=c(1,2,3,4,5,6,7), 
                      Shapes=c(20, 1, 16,0,15, 5,18))
  
  shs <- unique(results$Shape)
  sh_df <- sh_df[sh_df$Vals %in% shs,]
  
  
  
  results <- results[order(results$P.Value),]
  # results$genelabels <- F
  # results$genelabels[which(results$adj.P.Val < 0.05 & results$logFC > 0 & results$region == "CeA")[1:5]] <- T
  # results$genelabels[which(results$adj.P.Val < 0.05 & results$logFC < 0 & results$region == "CeA")[1:5]] <- T
  # results$genelabels[which(results$adj.P.Val < 0.05 & results$logFC > 0 & results$region == "mPFC")[1:5]] <- T
  # results$genelabels[which(results$adj.P.Val < 0.05 & results$logFC < 0 & results$region == "mPFC")[1:5]] <- T
  # results$genelabels[which(results$adj.P.Val < 0.05 & results$logFC > 0 & results$region == "DG")[1:5]] <- T
  # results$genelabels[which(results$adj.P.Val < 0.05 & results$logFC < 0 & results$region == "DG")[1:5]] <- T
  # 
  
  
  
  
  
  p<-ggplot(results) +
    geom_point(aes(x = logFC, y = lp, colour = factor(Color), shape = factor(Shape)),size=3.5, alpha = 0.8) +
    geom_text_repel(data= filter(results, logFC > 0), 
                    aes(x = logFC, y = lp, color = factor(Color),
                        label = ifelse(genelabels == T, Symbol,"")),fontface="bold.italic",size=5,
                    min.segment.length = unit(0, 'lines'), seed = 42, 
                    box.padding = 1,
                    segment.color = "grey30",
                    direction     = "y",
                    hjust         = "left", max.overlaps = Inf, nudge_x = nudge - filter(results, logFC > 0)$logFC) +
    geom_text_repel(data= filter(results, logFC < 0), 
                    aes(x = logFC, y = lp, color = factor(Color),
                        label = ifelse(genelabels == T, Symbol,"")),fontface="bold.italic",size=5,
                    min.segment.length = unit(0, 'lines'), seed = 42, box.padding = 1,
                    segment.color = "grey30",
                    direction     = "y",
                    hjust         = "left", max.overlaps = Inf, nudge_x = -nudge - filter(results, logFC < 0)$logFC)+
    # geom_text_repel(aes(x = logFC, y = lp, label = ifelse(genelabels == T, Symbol,"")),fontface="italic",size=5,max.overlaps=Inf, 
    #                 box.padding = unit(0.5, "lines"), min.segment.length = Inf)+
    scale_color_manual(values=col_df$Colors)+
    scale_shape_manual(values=sh_df$Shapes )+
    xlab("log2FC") +
    ylab("-log10(P.Value)") +
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
                          Colors=c("grey95", "#d2d6e4" ,"#709aa9", "#dfe4d2", "#9aa970", "#e8deeb", "#a9709a"))

plot_volcano(dlpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFCCorrectedNames/Genes/DLPFC231LogFCSD/PTSD/results_PTSD_DLPFC_PTSD_logFC_sd.RDS",
             col_df = gene_col_df,
             nudge = 1.8,
             title = "Genes",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/DLPFCVolcanos/RNA_Genes_PTSD.png")

plot_volcano(dlpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFCCorrectedNames/Genes/DLPFC231LogFCSD/MDD/results_MDD_DLPFC_MDD_logFC_sd.RDS",
             col_df = gene_col_df,
             nudge = 1.8,
             title = "Genes",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/DLPFCVolcanos/RNA_Genes_MDD.png")
plot_volcano(dlpfc_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFCCorrectedNames/Genes/DLPFC231LogFCSD/PTSD_MDD/results_PTSD+MDD_DLPFC_PTSD_MDD_logFC_sd.RDS",
             col_df = gene_col_df,
             nudge = 1.8,
             title = "Genes",
             out_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/DLPFCVolcanos/RNA_Genes_PTSD_MDD.png")
