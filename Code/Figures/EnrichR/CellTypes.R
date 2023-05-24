library(bigreadr)
library(ggplot2)


hub1 <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/CellTypes/HuBMAP_ASCT_plus_B_augmented_w_RNAseq_Coexpression_table.txt")
hub2 <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/CellTypes/HuBMAP_ASCTplusB_augmented_2022_table.txt")
allen <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/CellTypes/Allen_Brain_Atlas_up_table.txt")
descartes <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/CellTypes/Descartes_Cell_Types_and_Tissue_2021_table.txt")

hub1$Type <- "HuBMAP_ASCT_plus_B_augmented_w_RNAseq_Coexpression_table"
hub2$Type <- "HuBMAP_ASCTplusB_augmented_2022_table"
allen$Type <- "Allen_Brain_Atlas_up_table"
descartes$Type <- "Descartes_Cell_Types_and_Tissue_2021_table"


df <- rbind(hub1,hub2,allen,descartes)

df$FDR <- p.adjust(p=df$`P-value`,method="fdr",n=nrow(df))

df <- df[order(df$FDR),]
df$LP <- -log10(df$FDR)

df_top10 <- df[1:10,]

df_top10$Name <- gsub("\\(.*", "", df_top10$Term)

p <- ggplot(df_top10, aes(x=LP, y=reorder(Name, LP), fill = "red")) + 
  geom_bar(stat="identity") +
  theme(legend.position = "None",
        text=element_text(face = "bold",size=18)) +
  xlab("-log10(adj.P-value)") +
  ylab("")

ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/EnrichR/CellTypes/CellTypes.png",
       plot = p,
       device = "png",
       units = "in",
       width = 12,
       height = 10)
