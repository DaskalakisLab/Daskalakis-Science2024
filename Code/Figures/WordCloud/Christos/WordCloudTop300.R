genes <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Top300_with_scores.csv")

library(stringr)

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

df <- df[df$gene %in% genes$genes,]

all_genes <- df$CleanedText
all_genes <- str_c(all_genes, collapse=" ")



txt <- all_genes
corp <- Corpus(VectorSource(txt))
tdm <- TermDocumentMatrix(corp, control = list(wordLengths = c(-Inf, Inf),tolower=F))
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

pdf(file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/Christos/Top300.pdf"),
    width = 10,
    height = 10)

wordcloud(d$word,d$freq,min.freq=1)
dev.off()

a <- as.data.frame(table(strsplit(all_genes,split = " ")))
total <- a[a$Var1=="RNA","Freq"] + a[a$Var1=="Prot","Freq"] + a[a$Var1=="Meth","Freq"]
p <- ggplot(a, aes(x=reorder(Var1,-Freq),y=Freq)) +
  geom_bar(stat='identity') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Word Frequencies") +
  ggtitle("Select Genes")

ggsave(filename = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/Christos/Top300_Barplot.pdf",
       plot=p,
       device="pdf",
       units="in",
       width=10,
       height=7)



