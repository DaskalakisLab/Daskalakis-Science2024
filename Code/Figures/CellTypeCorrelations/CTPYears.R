library(ComplexHeatmap)
library(ggplot2)

cor_all_cell_types <- function(df,region){

  # cor_mat <- as.data.frame(matrix(0,nrow=9,ncol=6))
  # names(cor_mat) <- c("CellType","NeuN_neg Pearson","NeuN_neg Spearman","NeuN_pos Pearson","NeuN_pos Spearman","Region")
  cor_mat <- as.data.frame(matrix(0,nrow=9,ncol=6))
  names(cor_mat) <- c("CellType","NeuN_neg Pearson","NeuN_pos Pearson","NeuN_neg P.Value","NeuN_pos P.Value","Region")
  cor_mat$Region <- region
  
  cor_mat$CellType <- c("Astro",
                        "inhib",
                        "ex",
                        "Oligo",
                        "Micro",
                        "OPC",
                        "Tcell",
                        "Neuronal",
                        "NonNeuronal")
  
  cor_mat[1,2] <- cor.test(df$Astro, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[1,4] <- cor.test(df$Astro, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[1,3] <- cor(df$Astro, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[1,3] <- cor.test(df$Astro, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[1,5] <- cor.test(df$Astro, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[1,5] <- cor(df$Astro, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[2,2] <- cor.test(df$inhib, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[2,4] <- cor.test(df$inhib, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[2,3] <- cor(df$inhib, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[2,3] <- cor.test(df$inhib, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[2,5] <- cor.test(df$inhib, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[2,5] <- cor(df$inhib, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[3,2] <- cor.test(df$ex, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[3,4] <- cor.test(df$ex, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[3,3] <- cor(df$ex, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[3,3] <- cor.test(df$ex, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[3,5] <- cor.test(df$ex, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[3,5] <- cor(df$ex, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[4,2] <- cor.test(df$Oligo, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[4,4] <- cor.test(df$Oligo, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[4,3] <- cor(df$Oligo, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[4,3] <- cor.test(df$Oligo, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[4,5] <- cor.test(df$Oligo, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[4,5] <- cor(df$Oligo, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[5,2] <- cor.test(df$Micro, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[5,4] <- cor.test(df$Micro, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[5,3] <- cor(df$Micro, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[5,3] <- cor.test(df$Micro, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[5,5] <- cor.test(df$Micro, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[5,5] <- cor(df$Micro, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[6,2] <- cor.test(df$OPC, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[6,4] <- cor.test(df$OPC, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[6,3] <- cor(df$OPC, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[6,3] <- cor.test(df$OPC, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[6,5] <- cor.test(df$OPC, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[6,5] <- cor(df$OPC, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[7,2] <- cor.test(df$Tcell, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[7,4] <- cor.test(df$Tcell, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[7,3] <- cor(df$Tcell, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[7,3] <- cor.test(df$Tcell, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[7,5] <- cor.test(df$Tcell, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[7,5] <- cor(df$Tcell, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[8,2] <- cor.test(df$Neuronal, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[8,4] <- cor.test(df$Neuronal, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[8,3] <- cor(df$Neuronal, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[8,3] <- cor.test(df$Neuronal, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[8,5] <- cor.test(df$Neuronal, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[8,5] <- cor(df$Neuronal, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[9,2] <- cor.test(df$NonNeuronal, df$NeuN_neg, method="pearson", use="complete.obs")$estimate
  cor_mat[9,4] <- cor.test(df$NonNeuronal, df$NeuN_neg, method="pearson", use="complete.obs")$p.value
  #cor_mat[9,3] <- cor(df$NonNeuronal, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[9,3] <- cor.test(df$NonNeuronal, df$NeuN_pos, method="pearson", use="complete.obs")$estimate
  cor_mat[9,5] <- cor.test(df$NonNeuronal, df$NeuN_pos, method="pearson", use="complete.obs")$p.value
  #cor_mat[9,5] <- cor(df$NonNeuronal, df$NeuN_pos, method="spearman", use="complete.obs")
  
  return(cor_mat)
}

reformat_cors <- function(cor_df){
  rownames(cor_df) <- cor_df$CellType
  cor_df <- cor_df[,c(2,3)]
  return(cor_df)
}



anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

anno12 <- anno12[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","NeuN_neg","NeuN_pos")]
anno3 <- anno3[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","NeuN_neg","NeuN_pos")]

anno12$Neuronal <- anno12$ex + anno12$inhib
anno12$NonNeuronal <- anno12$Astro + anno12$Oligo + anno12$Micro + anno12$OPC + anno12$Tcell

anno3$Neuronal <- anno3$ex + anno3$inhib
anno3$NonNeuronal <- anno3$Astro + anno3$Oligo + anno3$Micro + anno3$OPC + anno3$Tcell

anno12$Year <- "Y1Y2"
anno3$Year <- "Y3"

anno_cea_12 <- anno12[anno12$Brain_Region=="CentralAmyg",]
anno_dg_12 <- anno12[anno12$Brain_Region=="DG",]
anno_mpfc_12 <- anno12[anno12$Brain_Region=="mPFC",]


cor_cea_12 <- cor_all_cell_types(anno_cea_12,"CentralAmyg")
cor_dg_12 <- cor_all_cell_types(anno_dg_12,"DG")
cor_mpfc_12 <- cor_all_cell_types(anno_mpfc_12,"mPFC")

cor_cea_plot_12 <- reformat_cors(cor_cea_12)
cor_dg_plot_12 <- reformat_cors(cor_dg_12)
cor_mpfc_plot_12 <- reformat_cors(cor_mpfc_12)

cor_12 <- rbind(cor_cea_12,cor_dg_12,cor_mpfc_12)
write.csv(cor_12,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CTPCorrelationsY1Y2.csv",row.names = F,quote=F)

p_cea_12 <- Heatmap(as.matrix(cor_cea_plot_12), heatmap_legend_param = list(title="Correlation"), column_title = "CentralAmyg Y1Y2",cluster_columns = F)
p_dg_12 <- Heatmap(as.matrix(cor_dg_plot_12), heatmap_legend_param = list(title="Correlation"), column_title = "DG Y1Y2",cluster_columns = F)
p_mpfc_12 <- Heatmap(as.matrix(cor_mpfc_plot_12), heatmap_legend_param = list(title="Correlation"), column_title = "mPFC Y1Y2",cluster_columns = F)


png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CorCentralAmyg_Y1Y2.png",width = 8,height = 8,units = "in",res=300)
p_cea_12
dev.off()
png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CorDG_Y1Y2.png",width = 8,height = 8,units = "in",res=300)
p_dg_12
dev.off()
png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CormPFC_Y1Y2.png",width = 8,height = 8,units = "in",res=300)
p_mpfc_12
dev.off()











anno_cea_3 <- anno3[anno3$Brain_Region=="CentralAmyg",]
anno_dg_3 <- anno3[anno3$Brain_Region=="DG",]
anno_mpfc_3 <- anno3[anno3$Brain_Region=="mPFC",]


cor_cea_3 <- cor_all_cell_types(anno_cea_3,"CentralAmyg")
cor_dg_3 <- cor_all_cell_types(anno_dg_3,"DG")
cor_mpfc_3 <- cor_all_cell_types(anno_mpfc_3,"mPFC")

cor_cea_plot_3 <- reformat_cors(cor_cea_3)
cor_dg_plot_3 <- reformat_cors(cor_dg_3)
cor_mpfc_plot_3 <- reformat_cors(cor_mpfc_3)

p_cea_3 <- Heatmap(as.matrix(cor_cea_plot_3), heatmap_legend_param = list(title="Correlation"), column_title = "CentralAmyg Y3",cluster_columns = F)
p_dg_3 <- Heatmap(as.matrix(cor_dg_plot_3), heatmap_legend_param = list(title="Correlation"), column_title = "DG Y3",cluster_columns = F)
p_mpfc_3 <- Heatmap(as.matrix(cor_mpfc_plot_3), heatmap_legend_param = list(title="Correlation"), column_title = "mPFC Y3",cluster_columns = F)

cor_3 <- rbind(cor_cea_3,cor_dg_3,cor_mpfc_3)
write.csv(cor_3,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CTPCorrelationsY3.csv",row.names = F,quote=F)

png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CorCentralAmyg_Y3.png",width = 8,height = 8,units = "in",res=300)
p_cea_3
dev.off()
png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CorDG_Y3.png",width = 8,height = 8,units = "in",res=300)
p_dg_3
dev.off()
png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CormPFC_Y3.png",width = 8,height = 8,units = "in",res=300)
p_mpfc_3
dev.off()

