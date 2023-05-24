smr <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/SMRDataForClouds.RDS")


df <- as.data.frame(matrix(0,nrow = nrow(smr),ncol=2))
names(df) <- c("gene", "Text")
for (i in 1:nrow(smr)){
  gene <- smr[i,]
  gene_str <- ""
  for(j in 2:ncol(gene)){
    if(gene[[j]]>=1){
      gene_str <- paste(gene_str, names(gene[j]))
    }
  }
  df[i,1] <- gene$Genes
  df[i,2] <- gene_str
}

df$CleanedText <- gsub("_", " ", df$Text)
df$CleanedText <- gsub("^ ", "", df$CleanedText)

all_genes <- df$CleanedText
all_genes <- str_c(all_genes, collapse=" ")



txt <- all_genes
corp <- Corpus(VectorSource(txt))
tdm <- TermDocumentMatrix(corp, control = list(wordLengths = c(-Inf, Inf),tolower=F))
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

pdf(file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/SMR/AllGenesSMR.pdf"),
    width = 10,
    height = 10)

wordcloud(d$word,d$freq,min.freq=1)
dev.off()

#a <- as.data.frame(table(strsplit(all_genes,split = " ")))

p <- ggplot(d, aes(x=reorder(word,-freq),y=freq)) +
  geom_bar(stat='identity') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Word Frequencies") +
  ggtitle("All Genes")

ggsave(filename = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/SMR/AllGenesSMR_Barplot.pdf",
       plot=p,
       device="pdf",
       units="in",
       width=10,
       height=7)
