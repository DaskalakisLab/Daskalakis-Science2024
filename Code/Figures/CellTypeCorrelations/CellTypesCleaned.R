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
  
  cor_mat[1,2] <- cor.test(df$AstroClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[1,4] <- cor.test(df$AstroClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[1,3] <- cor(df$Astro, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[1,3] <- cor.test(df$AstroClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[1,5] <- cor.test(df$AstroClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[1,5] <- cor(df$Astro, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[2,2] <- cor.test(df$inhibClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[2,4] <- cor.test(df$inhibClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[2,3] <- cor(df$inhib, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[2,3] <- cor.test(df$inhibClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[2,5] <- cor.test(df$inhibClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[2,5] <- cor(df$inhib, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[3,2] <- cor.test(df$exClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[3,4] <- cor.test(df$exClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[3,3] <- cor(df$ex, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[3,3] <- cor.test(df$exClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[3,5] <- cor.test(df$exClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[3,5] <- cor(df$ex, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[4,2] <- cor.test(df$OligoClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[4,4] <- cor.test(df$OligoClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[4,3] <- cor(df$Oligo, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[4,3] <- cor.test(df$OligoClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[4,5] <- cor.test(df$OligoClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[4,5] <- cor(df$Oligo, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[5,2] <- cor.test(df$MicroClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[5,4] <- cor.test(df$MicroClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[5,3] <- cor(df$Micro, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[5,3] <- cor.test(df$MicroClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[5,5] <- cor.test(df$MicroClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[5,5] <- cor(df$Micro, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[6,2] <- cor.test(df$OPCClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[6,4] <- cor.test(df$OPCClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[6,3] <- cor(df$OPC, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[6,3] <- cor.test(df$OPCClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[6,5] <- cor.test(df$OPCClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[6,5] <- cor(df$OPC, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[7,2] <- cor.test(df$TcellClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[7,4] <- cor.test(df$TcellClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[7,3] <- cor(df$Tcell, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[7,3] <- cor.test(df$TcellClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[7,5] <- cor.test(df$TcellClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[7,5] <- cor(df$Tcell, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[8,2] <- cor.test(df$NeuronalClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[8,4] <- cor.test(df$NeuronalClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[8,3] <- cor(df$Neuronal, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[8,3] <- cor.test(df$NeuronalClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[8,5] <- cor.test(df$NeuronalClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[8,5] <- cor(df$Neuronal, df$NeuN_pos, method="spearman", use="complete.obs")
  
  cor_mat[9,2] <- cor.test(df$NonNeuronalClean, df$NeuN_negClean, method="pearson", use="complete.obs")$estimate
  cor_mat[9,4] <- cor.test(df$NonNeuronalClean, df$NeuN_negClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[9,3] <- cor(df$NonNeuronal, df$NeuN_neg, method="spearman", use="complete.obs")
  cor_mat[9,3] <- cor.test(df$NonNeuronalClean, df$NeuN_posClean, method="pearson", use="complete.obs")$estimate
  cor_mat[9,5] <- cor.test(df$NonNeuronalClean, df$NeuN_posClean, method="pearson", use="complete.obs")$p.value
  #cor_mat[9,5] <- cor(df$NonNeuronal, df$NeuN_pos, method="spearman", use="complete.obs")
  
  return(cor_mat)
}

reformat_cors <- function(cor_df){
  rownames(cor_df) <- cor_df$CellType
  cor_df <- cor_df[,c(2,3)]
  return(cor_df)
}
create_formula <- function(ctp,covariates){
  form <- formula(paste0(ctp,"~", paste(covariates, collapse = "+")))
  return(form)
}


anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

anno12 <- anno12[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","NeuN_neg","NeuN_pos")]
anno3 <- anno3[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","NeuN_neg","NeuN_pos")]


anno12$Year <- "Y1Y2"
anno3$Year <- "Y3"

anno12$Neuronal <- anno12$ex + anno12$inhib
anno12$NonNeuronal <- anno12$Astro + anno12$Oligo + anno12$Micro + anno12$OPC + anno12$Tcell

anno3$Neuronal <- anno3$ex + anno3$inhib
anno3$NonNeuronal <- anno3$Astro + anno3$Oligo + anno3$Micro + anno3$OPC + anno3$Tcell

anno <- rbind(anno12,anno3)
rm(anno12,anno3)

clean_CTPs <- function(anno,ct){
  form <- create_formula(ct, "Year")
  print(form)
  fit<-lm(form, data=anno)
  cleaned <- as.data.frame(fit$residuals)
  names(cleaned) <- paste0(ct,"Clean")
  cleaned <- merge(anno[,c("BrNum","SampleID","Brain_Region")],cleaned,by="row.names",all.x=T)
  cleaned <- cleaned[,names(cleaned)[names(cleaned) != "Row.names"]]
  return(cleaned)
}

Astro_clean <- clean_CTPs(anno, "Astro")
inhib_clean <- clean_CTPs(anno, "inhib")
ex_clean <- clean_CTPs(anno, "ex")
Oligo_clean <- clean_CTPs(anno, "Oligo")
Micro_clean <- clean_CTPs(anno, "Micro")
OPC_clean <- clean_CTPs(anno, "OPC")
Tcell_clean <- clean_CTPs(anno, "Tcell")
NeuN_neg_clean <- clean_CTPs(anno, "NeuN_neg")
NeuN_pos_clean <- clean_CTPs(anno, "NeuN_pos")
Neuronal_clean <- clean_CTPs(anno, "Neuronal")
NonNeuronal_clean <- clean_CTPs(anno, "NonNeuronal")

anno <- merge(anno,Astro_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,inhib_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,ex_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,Oligo_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,Micro_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,OPC_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,Tcell_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,NeuN_neg_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,NeuN_pos_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,Neuronal_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,NonNeuronal_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)

rm(Astro_clean,inhib_clean,ex_clean,Oligo_clean,Micro_clean,OPC_clean,
   Tcell_clean,NeuN_neg_clean,NeuN_pos_clean,Neuronal_clean,NonNeuronal_clean)
#

anno_cea <- anno[anno$Brain_Region=="CentralAmyg",]
anno_dg <- anno[anno$Brain_Region=="DG",]
anno_mpfc <- anno[anno$Brain_Region=="mPFC",]


cor_cea <- cor_all_cell_types(anno_cea,"CentralAmyg")
cor_dg <- cor_all_cell_types(anno_dg,"DG")
cor_mpfc <- cor_all_cell_types(anno_mpfc,"mPFC")

cor_cea_plot <- reformat_cors(cor_cea)
cor_dg_plot <- reformat_cors(cor_dg)
cor_mpfc_plot <- reformat_cors(cor_mpfc)

cor_df <- rbind(cor_cea,cor_dg,cor_mpfc)
write.csv(cor_df,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CTPCorrelationsY1Y2Y3_cleaned.csv",row.names = F,quote=F)


p_cea <- Heatmap(as.matrix(cor_cea_plot), heatmap_legend_param = list(title="Correlation"), column_title = "CentralAmyg",cluster_columns = F)
p_dg <- Heatmap(as.matrix(cor_dg_plot), heatmap_legend_param = list(title="Correlation"), column_title = "DG",cluster_columns = F)
p_mpfc <- Heatmap(as.matrix(cor_mpfc_plot), heatmap_legend_param = list(title="Correlation"), column_title = "mPFC",cluster_columns = F)


png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CorCentralAmyg_cleaned.png",width = 8,height = 8,units = "in",res=300)
p_cea
dev.off()
png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CorDG_cleaned.png",width = 8,height = 8,units = "in",res=300)
p_dg
dev.off()
png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CormPFC_cleaned.png",width = 8,height = 8,units = "in",res=300)
p_mpfc
dev.off()

