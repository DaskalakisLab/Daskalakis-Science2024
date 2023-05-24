library(bigreadr)
library(ggplot2)

go <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/Ontologies/GO_Biological_Process_2021_table.txt")
go <- go[order(go$`P-value`),]
go$LP <- -log10(go$`Adjusted P-value`)
go <- go[1:10,]
go$Name <- gsub(" \\(.*", "", go$Term)

syngo <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/Ontologies/SynGO_2022_table.txt")
syngo <- syngo[order(syngo$`P-value`),]
syngo$LP <- -log10(syngo$`Adjusted P-value`)
syngo <- syngo[1:10,]
syngo$Significant <- "Nominal"
syngo[syngo$`Adjusted P-value` < 0.05, "Significant"] <- "FDR"
syngo$Name <- gsub(" \\(.*", "", syngo$Term)



p_go <- ggplot(go, aes(x=LP, y=reorder(Name, LP), fill = "red")) + 
  geom_bar(stat="identity") +
  theme(legend.position = "None",
        text=element_text(face = "bold",size=18)) +
  xlab("-log10(adj.P-value)") +
  ylab("")
p_go

ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/Ontologies/GO_Bio.png",
       plot = p_go,
       device = "png",
       units = "in",
       width = 10,
       height = 8)


p_syngo <- ggplot(syngo, aes(x=LP, y=reorder(Name, LP), fill = Significant)) + 
  geom_bar(stat="identity") +
  theme(text=element_text(face = "bold",size=18)) +
  xlab("-log10(adj.P-value)") +
  ylab("")
p_syngo

ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/Ontologies/SynGO.png",
       plot = p_syngo,
       device = "png",
       units = "in",
       width = 20,
       height = 8)
