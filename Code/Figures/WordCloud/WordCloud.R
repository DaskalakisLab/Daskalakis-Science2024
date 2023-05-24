library(bigreadr)
library(ggplot2)
#install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer", "RCurl", "XML"))
library(wordcloud)
library(tm)

createWordClouds <- function(Gene, out_dir){
  df <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/DATA_for_cloud_v1.csv")
  
  df$CleanedText <- gsub("PTSD_MDD", "PTSD+MDD", df$cat2)
  df$CleanedText <- gsub("CentralAmy", "CeA", df$CleanedText)
  df$CleanedText <- gsub("DG", "HipDG", df$CleanedText)
  df$CleanedText <- gsub("Base", "Female+Male", df$CleanedText)
  df$CleanedText <- gsub("_only", "", df$CleanedText)
  df$CleanedText <- gsub("_", " ", df$CleanedText)
  df$CleanedText <- gsub(";", " ", df$CleanedText)
  df$CleanedText <- gsub(" Prot ", " PROT ", df$CleanedText)
  df$CleanedText <- gsub("Child", "ChildTrauma", df$CleanedText)
  df$CleanedText <- gsub("Methylation", "mDNA/cpg", df$CleanedText)
  df$CleanedText <- gsub("Meth ", "", df$CleanedText)
  
  
  txt <- df[df$gene==Gene,"CleanedText"]
  corp <- Corpus(VectorSource(txt))
  tdm <- TermDocumentMatrix(corp, control = list(wordLengths = c(-Inf, Inf),tolower=F))
  m <- as.matrix(tdm)
  v <- sort(rowSums(m),decreasing=TRUE)
  d <- data.frame(word = names(v),freq=v)
  pdf(file = paste0(out_dir,Gene,".pdf"),
      width = 10,
      height = 10)
  wordcloud(d$word,d$freq,min.freq=1)
  dev.off()
  
}

rna_only <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/RNAOnlyGenes.txt")
for(g in rna_only$Gene){
  createWordClouds(g, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/RNAOnly/")
}
mdna_only <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/mDNAOnlyGenes.txt")
for(g in mdna_only$Gene){
  createWordClouds(g, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/mDNAOnly/")
}
protein_only <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/ProteinOnlyGenes.txt")
for(g in protein_only$Gene){
  createWordClouds(g, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/ProteinOnly/")
}
rna_protein <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/RNAProteinGenes.txt")
for(g in rna_protein$Gene){
  createWordClouds(g, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/RNAProtein/")
}
mdna_rna <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/mDNA_RNAGenes.txt")
for(g in mdna_rna$Gene){
  createWordClouds(g, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/mDNA_RNA/")
}
mdna_protein <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/mDNAProteinGenes.txt")
for(g in mdna_protein$Gene){
  createWordClouds(g, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/mDNAProtein/")
}
top3_omic <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/Top3OmicGenes.txt")
for(g in top3_omic$Gene){
  createWordClouds(g, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/Top3Omic/")
}



plotTotalScore <- function(genes, out){
  ranks <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/RANK_unique_Categories_v1.csv")
  
  sub_ranks <- ranks[ranks$genes %in% genes$Gene,]
  
  p <- ggplot(sub_ranks, aes(x=reorder(genes,-TOTAL), y=TOTAL)) + 
    geom_bar(stat='identity',width=1) +
    xlab("Gene") +
    ylab("Total Score") + 
    theme_classic() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
    
  ggsave(filename = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Barplots/",out),
         plot = p,device = "pdf",width = 20,height = 7,units = "in")
}

plotTotalScore(rna_only, "RNAOnly.pdf")
plotTotalScore(mdna_only, "mDNAOnly.pdf")
plotTotalScore(protein_only, "ProteinOnly.pdf")
plotTotalScore(rna_protein, "RNAProtein.pdf")
plotTotalScore(mdna_rna, "mDNA_RNA.pdf")
plotTotalScore(mdna_protein, "mDNAProtein.pdf")
plotTotalScore(top3_omic, "Top3Omic.pdf")




# createClouds <- function(Gene){
#   pdf(file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/",Gene,"_cloud.pdf"),
#       width = 3,
#       height = 3)
#   res<-rquery.wordcloud(df[df$gene==Gene,"CleanedText"], type ="text", lang = "english")
#   wordcloud(df[df$gene==Gene,"CleanedText"])
#   dev.off()
#   
#   freqTable <- res$freqTable
#   
#   
#   pdf(file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Barplots/",Gene,"_bar.pdf"),
#       width = 5,
#       height = 7)
#   par(mar=c(6,3,3,3))
#   barplot(freqTable$freq, las = 2,
#           names.arg = freqTable$word,
#           col ="lightblue", main =Gene,
#           ylab = "Word frequencies",)
#   dev.off()
# }
# 
# createClouds("FKBP5")
# createClouds("EPHA2")
# 
# barGene <- function(Gene){
#   a <- as.data.frame(table(strsplit(df[df$gene==Gene,"CleanedText"],split = " ")))
#   total <- a[a$Var1=="RNA","Freq"] + a[a$Var1=="Prot","Freq"] + a[a$Var1=="Meth","Freq"]
#   p <- ggplot(a, aes(x=reorder(Var1,-Freq),y=Freq)) + 
#     geom_bar(stat='identity') +
#     theme_classic() +
#     theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
#     xlab("Word Frequencies") +
#     ggtitle(Gene)
#   
#   return(p)
#   
# }
# 
# a <- barGene("FKBP5")
# b <- barGene("EPHA2")
# 
# a
# b
