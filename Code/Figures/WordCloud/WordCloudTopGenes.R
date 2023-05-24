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

rna_only <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/RNAOnlyGenes.txt")
mdna_only <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/mDNAOnlyGenes.txt")
protein_only <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/ProteinOnlyGenes.txt")
rna_protein <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/RNAProteinGenes.txt")
mdna_rna <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/mDNA_RNAGenes.txt")
mdna_protein <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/mDNAProteinGenes.txt")
top3_omic <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/TopGenes/Top3OmicGenes.txt")

top_genes <- c(rna_only$Gene, mdna_only$Gene, protein_only$Gene, 
               rna_protein$Gene, mdna_rna$Gene, mdna_protein$Gene,
               top3_omic$Gene)

df <- df[df$gene %in% top_genes,]


top_txt <- df$CleanedText
top_txt <- str_c(top_txt, collapse=" ")

txt <- top_txt
corp <- Corpus(VectorSource(txt))
tdm <- TermDocumentMatrix(corp, control = list(wordLengths = c(-Inf, Inf),tolower=F))
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

pdf(file = paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Clouds/TopGenes.pdf"),
    width = 10,
    height = 10)

wordcloud(d$word,d$freq,min.freq=1)
dev.off()




a <- as.data.frame(table(strsplit(top_txt,split = " ")))
total <- a[a$Var1=="RNA","Freq"] + a[a$Var1=="Prot","Freq"] + a[a$Var1=="Meth","Freq"]
p <- ggplot(a, aes(x=reorder(Var1,-Freq),y=Freq)) +
  geom_bar(stat='identity') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Word Frequencies") +
  ggtitle("Top Genes")
p
