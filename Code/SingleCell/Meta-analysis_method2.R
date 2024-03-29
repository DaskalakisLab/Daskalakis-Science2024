meta_analyze <- function(b32,b15,bM,bF, celltype,comparison, out_dir){
  # dir.create(out_dir)
  b32 <- readRDS(b32)
  b15 <- readRDS(b15)
  bM <- readRDS(bM)
  bF <- readRDS(bF)
  
  keep.genes1 <- intersect(b32$genes, b15$genes)
  keep.genes2 <- intersect(bM$genes, bF$genes)
  
  keep.genes <- intersect(keep.genes1, keep.genes2)
  
  b32 <- b32[match(keep.genes, b32$genes),]
  b15 <- b15[match(keep.genes, b15$genes),]
  bM <- bM[match(keep.genes, bM$genes),]
  bF <- bF[match(keep.genes, bF$genes),]
  
  print(identical(b32$genes, bF$genes))
  
  # disc$SE <- disc$beta/rep$zval
  # rep$SE <- rep$beta/rep$zval
  
  df <- data.frame(gene=keep.genes, se_b32=b32$SE, se_b15=b15$SE, se_bM=bM$SE, se_bF=bF$SE,
                   fc_b32=b32$logFC, fc_b15=b15$logFC, fc_bM=bM$logFC, fc_bF=bF$logFC)
  
  
  input <- df
  results <- matrix(NA, nrow(input), ncol=9)
  rownames(results)<-keep.genes
  colnames(results)<-c("b","beta","se","zval","pval","ci.lb","ci.ub","tau2","I2")
  for (i in 1:nrow(input)){
    # if(i%%1000==0){
    #   print(i)
    # }
    effe.e<-as.numeric(input[i,6:9])
    sd.e<-as.numeric(c(input[i,2:5]))
    ##meta-analysis
    res <- rma(effe.e, sei=sd.e, method="FE")
    results[i,1:9] <- c(res$b, res$beta, res$se, res$zval, res$pval, res$ci.lb, res$ci.ub, res$tau2, res$I2)
  }
  results <- as.data.frame(results)
  results$FDR <- p.adjust(results$pval, method="fdr", n=nrow(results))
  results$genes <- rownames(results)
  saveRDS(results, file = paste0(out_dir, celltype,"_", comparison, ".RDS"))
  
  res <-  data.frame(gene=keep.genes, fc_b32=b32$logFC, fc_b15=b15$logFC, fc_bM=bM$logFC, fc_bF=bF$logFC, 
                     p_b32=b32$P.Value, p_b15=b15$P.Value, p_bM=bM$P.Value, p_bF=bF$P.Value,
                     fdr_b32=b32$adj.P.Val, fdr_b15=b15$adj.P.Val, fdr_bM=bM$adj.P.Val, fdr_bF=bF$adj.P.Val)
  
  gene_df <- data.frame(genes = res$gene)
  
  # Add columns for sign_logFC for each fc_bxx column
  gene_df$sign_logFC_b32 <- ifelse(res$fc_b32 > 0, 1, -1)
  gene_df$sign_logFC_b15 <- ifelse(res$fc_b15 > 0, 1, -1)
  gene_df$sign_logFC_bM <- ifelse(res$fc_bM > 0, 1, -1)
  gene_df$sign_logFC_bF <- ifelse(res$fc_bF > 0, 1, -1)
  
  # Add columns for p_sig and fdr_sig
  gene_df$p_sig_b32 <- ifelse(res$p_b32 < 0.05, 1, 0)
  gene_df$p_sig_b15 <- ifelse(res$p_b15 < 0.05, 1, 0)
  gene_df$p_sig_bM <- ifelse(res$p_bM < 0.05, 1, 0)
  gene_df$p_sig_bF <- ifelse(res$p_bF < 0.05, 1, 0)
  
  gene_df$fdr_sig_b32 <- ifelse(res$fdr_b32 < 0.05, 1, 0)
  gene_df$fdr_sig_b15 <- ifelse(res$fdr_b15 < 0.05, 1, 0)
  gene_df$fdr_sig_bM <- ifelse(res$fdr_bM < 0.05, 1, 0)
  gene_df$fdr_sig_bF <- ifelse(res$fdr_bF < 0.05, 1, 0)
  
  gene_df$same_sign <- as.integer(
    gene_df$sign_logFC_b32 ==  gene_df$sign_logFC_b15 &  gene_df$sign_logFC_b15 == gene_df$sign_logFC_bM & gene_df$sign_logFC_bM == gene_df$sign_logFC_bF)
  
  results_sup <- merge(results, gene_df, by = "genes")
  results_sup <- results_sup %>% dplyr::select(genes, beta, pval, FDR, tau2, I2, 
                                               sign_logFC_b32,sign_logFC_b15,sign_logFC_bM,sign_logFC_bF,p_sig_b32,p_sig_b15,p_sig_bM,p_sig_bF,fdr_sig_b32,fdr_sig_b15,fdr_sig_bM,fdr_sig_bF,same_sign)
  
  write.csv(results_sup, file = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/2024/January/Meta-analysis/sup_tables/", celltype,"_", comparison, ".csv"), quote = F)
  
}

meta_analyze3 <- function(b32,b15,bF, celltype,comparison, out_dir){
  # dir.create(out_dir)
  b32 <- readRDS(b32)
  b15 <- readRDS(b15)
  bF <- readRDS(bF)
  
  keep.genes1 <- intersect(b32$genes, b15$genes)

  keep.genes <- intersect(keep.genes1, bF$genes)
  
  b32 <- b32[match(keep.genes, b32$genes),]
  b15 <- b15[match(keep.genes, b15$genes),]
  bF <- bF[match(keep.genes, bF$genes),]
  
  print(identical(b32$genes, bF$genes))
  
  # disc$SE <- disc$beta/rep$zval
  # rep$SE <- rep$beta/rep$zval
  
  df <- data.frame(gene=keep.genes, se_b32=b32$SE, se_b15=b15$SE, se_bF=bF$SE,
                   fc_b32=b32$logFC, fc_b15=b15$logFC, fc_bF=bF$logFC)
  
  input <- df
  results <- matrix(NA, nrow(input), ncol=9)
  rownames(results)<-keep.genes
  colnames(results)<-c("b","beta","se","zval","pval","ci.lb","ci.ub","tau2","I2")
  for (i in 1:nrow(input)){
    # if(i%%1000==0){
    #   print(i)
    # }
    effe.e<-as.numeric(input[i,5:7])
    sd.e<-as.numeric(c(input[i,2:4]))
    ##meta-analysis
    res <- rma(effe.e, sei=sd.e, method="FE")
    results[i,1:9] <- c(res$b, res$beta, res$se, res$zval, res$pval, res$ci.lb, res$ci.ub, res$tau2, res$I2)
  }
  results <- as.data.frame(results)
  results$FDR <- p.adjust(results$pval, method="fdr", n=nrow(results))
  results$genes <- rownames(results)
  saveRDS(results, file = paste0(out_dir, celltype,"_", comparison, ".RDS"))
  
  res <-  data.frame(gene=keep.genes, fc_b32=b32$logFC, fc_b15=b15$logFC, fc_bF=bF$logFC, 
                     p_b32=b32$P.Value, p_b15=b15$P.Value, p_bF=bF$P.Value,
                     fdr_b32=b32$adj.P.Val, fdr_b15=b15$adj.P.Val, fdr_bF=bF$adj.P.Val)
  
  gene_df <- data.frame(genes = res$gene)
  
  # Add columns for sign_logFC for each fc_bxx column
  gene_df$sign_logFC_b32 <- ifelse(res$fc_b32 > 0, 1, -1)
  gene_df$sign_logFC_b15 <- ifelse(res$fc_b15 > 0, 1, -1)
  gene_df$sign_logFC_bF <- ifelse(res$fc_bF > 0, 1, -1)
  
  # Add columns for p_sig and fdr_sig
  gene_df$p_sig_b32 <- ifelse(res$p_b32 < 0.05, 1, 0)
  gene_df$p_sig_b15 <- ifelse(res$p_b15 < 0.05, 1, 0)
  gene_df$p_sig_bF <- ifelse(res$p_bF < 0.05, 1, 0)
  
  gene_df$fdr_sig_b32 <- ifelse(res$fdr_b32 < 0.05, 1, 0)
  gene_df$fdr_sig_b15 <- ifelse(res$fdr_b15 < 0.05, 1, 0)
  gene_df$fdr_sig_bF <- ifelse(res$fdr_bF < 0.05, 1, 0)
  
  gene_df$same_sign <- as.integer(
    gene_df$sign_logFC_b32 ==  gene_df$sign_logFC_b15 &  gene_df$sign_logFC_b15 == gene_df$sign_logFC_bF)
  
  results_sup <- merge(results, gene_df, by = "genes")
  results_sup <- results_sup %>% dplyr::select(genes, beta, pval, FDR, tau2, I2, 
                                               sign_logFC_b32,sign_logFC_b15,sign_logFC_bF,p_sig_b32,p_sig_b15,p_sig_bF,fdr_sig_b32,fdr_sig_b15,fdr_sig_bF,same_sign)
  
  write.csv(results_sup, file = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/2024/January/Meta-analysis/sup_tables/", celltype,"_", comparison, ".csv"), quote = F)
  
  
}

library(metafor)

cell_types <- c("Endo", "OPC", "Oligo", "Microglia", "In", "Ex", "Astro")
cell_types2 <- c("Endo", "OPC", "Oligo", "Micro","In_RE", "Ex_RE", "Astro_RE")


for(i in 1:length(cell_types)){
  cell_type = cell_types[i]
  meta_analyze(b32 = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/AJP_results/disc/FIN/MDD/", cell_types[i], ".rds"),
               b15 = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/AJP_results/repl/FIN/MDD/", cell_types[i], ".rds"),
               bM = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/2024/January/Maitra_Nagy/pseudobulk/LimmaResults_M_1cpm10pct_model1/Fine_Clusters/MDD/DEGs_MDD_", cell_types2[i], ".RDS"), 
               bF = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/2024/January/Maitra_Nagy/pseudobulk/LimmaResults_F_1cpm10pct_model1/Fine_Clusters/MDD/DEGs_MDD_", cell_types2[i], ".RDS"), 
               celltype = paste0(cell_type),
               comparison = "4way", 
               out_dir =  "/Volumes/humgen/daskalakislab/aiatrou/Science/2024/January/Meta-analysis/MDD/")
  
}


cell_types <- c("Endo", "OPC", "Oligo", "Microglia", "In", "Ex", "Astro")
cell_types2 <- c("Endo", "OPC", "Oligo", "Micro","In_RE", "Ex_RE", "Astro_RE")


for(i in 1:length(cell_types)){
  cell_type = cell_types[i]
  meta_analyze3(b32 = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/AJP_results/disc/FIN/MDD/", cell_types[i], ".rds"),
               b15 = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/AJP_results/repl/FIN/MDD/", cell_types[i], ".rds"),
               bF = paste0("/Volumes/humgen/daskalakislab/aiatrou/Science/2024/January/Maitra_Nagy/pseudobulk/LimmaResults_F_1cpm10pct_model1/Fine_Clusters/MDD/DEGs_MDD_", cell_types2[i], ".RDS"), 
               celltype = paste0(cell_type),
               comparison = "3way", 
               out_dir =  "/Volumes/humgen/daskalakislab/aiatrou/Science/2024/January/Meta-analysis/MDD/")
  
}
