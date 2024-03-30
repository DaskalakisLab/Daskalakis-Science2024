# Rerun Limma for gene data batch1 and batch2
# Add sign of logfc for batch1 and batch2 to meta results
library(metafor)

# meta_analyze <- function(batch1_file, batch2_file, outfile, type){
#   batch1 <- readRDS(batch1_file)
#   batch2 <- readRDS(batch2_file)
#   
#   if(type=="peptide"){
#     names(batch1)[names(batch1)=="peptide"] <- "peptide_full"
#     names(batch2)[names(batch2)=="peptide"] <- "peptide_full"
#     
#     batch1$peptide <- gsub("\\|\\dx.*", "", batch1$peptide_full)
#     batch2$peptide <- gsub("\\|\\dx.*", "", batch2$peptide_full)
#   }
#   
#   keep.genes <- intersect(batch1[[type]], batch2[[type]])
#   batch1 <- batch1[match(keep.genes, batch1[[type]]),]
#   batch2 <- batch2[match(keep.genes, batch2[[type]]),]
#   print(identical(batch1[[type]], batch2[[type]]))
#   
#   if(type=="gene"){
#     df <- data.frame(gene=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
#                      fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
#   }
#   if(type=="protein"){
#     df <- data.frame(protein=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
#                      fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
#   }
#   if(type=="peptide"){
#     df <- data.frame(peptide=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
#                      fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
#   }
#   if(type=="exon"){
#     df <- data.frame(exon=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
#                      fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
#   }
#   if(type=="jx"){
#     df <- data.frame(jx=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
#                      fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
#   }
#   if(type=="tx"){
#     df <- data.frame(tx=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
#                      fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
#   }
#   if(type=="meth"){
#     df <- data.frame(meth=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
#                      fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
#   }
#   
#   met=function(x) {
#     y=rma(as.numeric(x[c("fc_batch1","fc_batch2")]), sei=as.numeric(x[c("se_batch1","se_batch2")]), method = "FE")
#     y=c(y$b,y$beta,y$se,y$zval,y$pval,y$ci.lb,y$ci.ub,y$tau2,y$I2)
#     y
#   }
#   
#   results=data.frame(t(apply(df,1,met)))
#   rownames(results)=df[[type]]
#   colnames(results)=c("b","beta","se","zval","pval","ci.lb","ci.ub","tau2","I2")
#   results[[type]] <- rownames(results)
#   results <-  merge(results,batch1[,c(type,"symbol")],by=type,all.x=T)
#   
#   
#   results$FDR <- p.adjust(results$pval, method="fdr", n=nrow(results))
#   saveRDS(results, outfile)
#   
# }


meta_analyze <- function(batch1_file, batch2_file, outfile, type){
  batch1 <- readRDS(batch1_file)
  batch2 <- readRDS(batch2_file)
  
  if(type=="peptide"){
    names(batch1)[names(batch1)=="peptide"] <- "peptide_full"
    names(batch2)[names(batch2)=="peptide"] <- "peptide_full"
    
    batch1$peptide <- gsub("\\|\\dx.*", "", batch1$peptide_full)
    batch2$peptide <- gsub("\\|\\dx.*", "", batch2$peptide_full)
  }
  
  keep.genes <- intersect(batch1[[type]], batch2[[type]])
  batch1 <- batch1[match(keep.genes, batch1[[type]]),]
  batch2 <- batch2[match(keep.genes, batch2[[type]]),]
  print(identical(batch1[[type]], batch2[[type]]))
  
  if(type=="gene"){
    df <- data.frame(gene=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
                     fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
  }
  if(type=="protein"){
    df <- data.frame(protein=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
                     fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
  }
  if(type=="peptide"){
    df <- data.frame(peptide=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
                     fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
  }
  if(type=="exon"){
    df <- data.frame(exon=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
                     fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
  }
  if(type=="jx"){
    df <- data.frame(jx=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
                     fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
  }
  if(type=="tx"){
    df <- data.frame(tx=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
                     fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
  }
  if(type=="meth"){
    df <- data.frame(meth=batch1[[type]], symbol=batch1$symbol, se_batch1=batch1$SE, se_batch2=batch2$SE,
                     fc_batch1=batch1$logFC, fc_batch2=batch2$logFC)
  }
  
  input <- df
  results <- matrix(NA, nrow(input), ncol=9)
  rownames(results)<-df[[type]]
  colnames(results)<-c("b","beta","se","zval","pval","ci.lb","ci.ub","tau2","I2")
  for (i in 1:nrow(input)){
    # if(i%%1000==0){
    #   print(i)
    # }
    effe.e<-as.numeric(c(input[i,5],input[i,6]))
    sd.e<-as.numeric(c(input[i,3],input[i,4]))
    ##meta-analysis
    res <- rma(effe.e, sei=sd.e, method="FE")
    results[i,1:9] <- c(res$b, res$beta, res$se, res$zval, res$pval, res$ci.lb, res$ci.ub, res$tau2, res$I2)
  }
  results <- as.data.frame(results)
  results[[type]] <- rownames(results)
  head(results)
  results <- merge(results,batch1[,c(type,"symbol")],by=type,all.x=T)
  results$FDR <- p.adjust(results$pval, method="fdr", n=nrow(results))
  saveRDS(results, outfile)
  
}
