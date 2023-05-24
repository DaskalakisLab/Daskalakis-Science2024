library(bigreadr)
library(ggplot)

ranks <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/RANK_unique_Categories_v1.csv")

p1<-ggplot(ranks, aes(y=TOTAL)) + 
  geom_boxplot() +
  ggtitle("All Genes")

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


ranks_top <- ranks[ranks$genes %in% top_genes,]
p2<-ggplot(ranks_top, aes(y=TOTAL)) + 
  geom_boxplot() +
  ggtitle("Top Genes")

require(gridExtra)
grid.arrange(p1, p2, ncol=2)
