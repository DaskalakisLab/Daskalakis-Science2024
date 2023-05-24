library(bigreadr)
library(ggplot2)

chea <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/Transcription/ChEA_2022_table.txt")
tf <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/Transcription/ENCODE_TF_ChIP-seq_2015_table.txt")

chea$Type <- "ChEA 2022"
tf$Type <- "Encode TF"

df <- rbind(chea, tf)

df$FDR <- p.adjust(p=df$`P-value`,method="fdr",n=nrow(df))

df <- df[order(df$FDR),]
df$LP <- -log10(df$FDR)

df_top10 <- df[1:10,]

df_top10$Name <- gsub(" .*", "", df_top10$Term)

p <- ggplot(df_top10, aes(x=LP, y=reorder(Name, LP), fill = "red")) + 
  geom_bar(stat="identity") +
  theme(legend.position = "None",
        text=element_text(face = "bold",size=18)) +
  xlab("-log10(adj.P-value)") +
  ylab("")

ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/Transcription/Transcription.png",
       plot = p,
       device = "png",
       units = "in",
       width = 10,
       height = 8)
