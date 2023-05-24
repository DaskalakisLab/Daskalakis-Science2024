# Function to produce volcano plots from output of run_limma
# Input:
#   results: limma results
#   out_folder: location to save .tiff files
#   dx: Dx of interest
#   contrast: contrast variable from analysis
#   region: brain region of analysis
plot_volcano <- function(results_file, title, out, labs=F){
  results <- readRDS(results_file)
  results$lp <- -log10(results$pval)
  results$Color <- 1
  
  results[(results$pval < 0.05) & (results$beta < 0), "Color"] <- 2
  results[(results$pval < 0.05) & (results$beta > 0), "Color"] <- 3
  results[(results$FDR < 0.05) & (results$beta < 0), "Color"] <- 4
  results[(results$FDR < 0.05) & (results$beta > 0), "Color"] <- 5
  
  col_df <- data.frame(Vals=c(1,2,3,4,5), 
                       Colors=c("grey","lightblue","pink","blue","red"))
  
  cols <- unique(results$Color)
  col_df <- col_df[col_df$Vals %in% cols,]
  
  results <- results[order(results$pval),]
  results$genelabels <- F
  results$genelabels[1:30] <- T
  if(labs){
    results[results$symbol=="FKBP5", "genelabels"] <- T
    #results[results$symbol=="NR3C1", "genelabels"] <- T
    #results[results$symbol=="NR3C2", "genelabels"] <- T
    #results[results$symbol=="CRH", "genelabels"] <- T
    #results[results$symbol=="CRHR1", "genelabels"] <- T
    #results[results$symbol=="CRHR2", "genelabels"] <- T
  }
  
  p<-ggplot(results) +
    geom_point(aes(x = beta, y = lp, colour = factor(Color))) +
    geom_text_repel(aes(x = beta, y = lp, label = ifelse(genelabels == T, symbol,"")),fontface="italic",size=3,max.overlaps=1000) +
    scale_color_manual(values=col_df$Colors)+
    xlab("beta") +
    ylab("-log10(pvalue)") +
    ggtitle(title)+
    theme(legend.position = "none",
          plot.title = element_text(hjust = 0.5),
          text = element_text(size = 20,face="bold")
    )
  
  ggsave(filename=out,
         plot = p,
         device = "pdf",
         units = "in",
         width = 9,
         height = 12)
  #return(p)
}

plot_volc_dir <- function(direct, type, labs=F){
  
  res_files <- list.files(direct,pattern = ".RDS")
  for (rf in res_files){
    print(rf)
    out <- gsub(".RDS",".pdf",rf)
    title <- gsub(".RDS","",rf)
    title <- gsub("_"," ",title)
    title <- paste(type, title)
    plot_volcano(results_file=paste0(direct,rf), 
                 title=title, 
                 out=paste0(direct,out),
                 labs=labs)
  }
  
}

plot_volc_dir("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/", "Baseline Gene", labs=T)
plot_volc_dir("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Exons/", "Baseline Exon")
plot_volc_dir("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/", "Baseline Jx")
plot_volc_dir("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/", "Baseline Tx")




