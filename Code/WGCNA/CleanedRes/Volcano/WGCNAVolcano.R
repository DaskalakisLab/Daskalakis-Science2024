library(ggplot2)
library(ggrepel)

wgcna_volcano <- function(res_file,pres_file,out_name){
  results <- readRDS(res_file)
  PreservationDX <- readRDS(pres_file)
  PreservationDX$colors <- rownames(PreservationDX)
  
  library(stringr)
  colors <- str_sub(rownames(results), 3, -1)
  results$colors <- colors
  
  results <- merge(results, PreservationDX, by = "colors")
  
  
  
  results$lp <- -log10(results$P.Value)
  results$Alpha <- 1
  
  results[(results$P.Value < 0.05) & (results$logFC < 0), "Alpha"] <- 2
  results[(results$P.Value < 0.05) & (results$logFC > 0), "Alpha"] <- 2
  results[(results$adj.P.Val < 0.05) & (results$logFC < 0), "Alpha"] <- 3
  results[(results$adj.P.Val < 0.05) & (results$logFC > 0), "Alpha"] <- 3
  
  a_df <- data.frame(Vals=c(1,2,3), 
                     Alphas=c(0.6,0.75,1))
  
  cols <- unique(results$Alpha)
  a_df <- a_df[a_df$Vals %in% cols,]
  
  results <- results[order(results$P.Value),]
  results$labels <- F
  results$labels[which(results$adj.P.Val <0.05)] <- T
  
  # geom_point(aes(x = logFC, y = lp, colour = factor(Color), size=moduleSize, shape=Preserved)) +
  #   #geom_point(aes(x = logFC, y = lp, colour = factor(Color))) +
  #   geom_text_repel(aes(x = logFC, y = lp, label = ifelse(labels == T, Module,"")),fontface="italic",size=3,max.overlaps=1000) +
  #   scale_color_manual(values=col_df$Colors)+
  #   scale_shape_manual(values=c(1,16))+
  
  
  p<-ggplot(results) +
    geom_point(aes(x = logFC, y = lp, alpha = Alpha, color = colors, size = moduleSize, shape=Preserved)) +
    geom_text_repel(aes(x = logFC, y = lp, label = ifelse(labels == T, colors,"")),size=4,max.overlaps=1000, min.segment.length = 0.5) +
    scale_color_manual(values=sort(colors))+
    scale_alpha_continuous(range = c(0.4,1))+
    scale_shape_manual(values=c(16,1))+
    scale_size_continuous(range= c(3,6))+
    theme_bw()+
    xlab("log2(FC)") +
    ylab("-log10(pvalue)") +
    theme(legend.position = "none",
          plot.title = element_text(hjust = 0.5),
          text = element_text(size = 15))
  
  ggsave(filename = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Volcanos/",out_name,".png"), plot = p, device = "png", width = 6, height = 6, units = "in", dpi = 300)
  
}
  

# CentralAmyg
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/MDD/results_MDD_CentralAmyg_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/PreservationMDD.RDS",
              out_name="RNA/MDD_CentralAmyg")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/PreservationPTSD.RDS",
              out_name="RNA/PTSD_CentralAmyg")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_MDD/results_PTSD_MDD_CentralAmyg_PTSD_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/PreservationPTSD+MDD.RDS",
              out_name="RNA/PTSD_MDD_CentralAmyg")

wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD/results_MDD_CentralAmyg_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/CentralAmyg/PreservationMDD.RDS",
              out_name="Protein/MDD_CentralAmyg")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/CentralAmyg/PreservationPTSD.RDS",
              out_name="Protein/PTSD_CentralAmyg")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD/results_PTSD_MDD_CentralAmyg_PTSD_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/CentralAmyg/PreservationPTSD+MDD.RDS",
              out_name="Protein/PTSD_MDD_CentralAmyg")


# DG
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/MDD/results_MDD_DG_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/PreservationMDD.RDS",
              out_name="RNA/MDD_DG")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD/results_PTSD_DG_PTSD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/PreservationPTSD.RDS",
              out_name="RNA/PTSD_DG")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_MDD/results_PTSD_MDD_DG_PTSD_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/PreservationPTSD+MDD.RDS",
              out_name="RNA/PTSD_MDD_DG")

wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD/results_MDD_DG_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/PreservationMDD.RDS",
              out_name="Protein/MDD_DG")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD/results_PTSD_DG_PTSD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/PreservationPTSD.RDS",
              out_name="Protein/PTSD_DG")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD/results_PTSD_MDD_DG_PTSD_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/PreservationPTSD+MDD.RDS",
              out_name="Protein/PTSD_MDD_DG")


# mPFC
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/MDD/results_MDD_mPFC_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/PreservationMDD.RDS",
              out_name="RNA/MDD_mPFC")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD/results_PTSD_mPFC_PTSD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/PreservationPTSD.RDS",
              out_name="RNA/PTSD_mPFC")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/Limma_Results/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/PreservationPTSD+MDD.RDS",
              out_name="RNA/PTSD_MDD_mPFC")

wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/MDD/results_MDD_mPFC_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/mPFC/PreservationMDD.RDS",
              out_name="Protein/MDD_mPFC")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD/results_PTSD_mPFC_PTSD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/mPFC/PreservationPTSD.RDS",
              out_name="Protein/PTSD_mPFC")
wgcna_volcano(res_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/Limma_Results/PTSD_MDD/results_PTSD_MDD_mPFC_PTSD_MDD.RDS",
              pres_file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/mPFC/PreservationPTSD+MDD.RDS",
              out_name="Protein/PTSD_MDD_mPFC")


