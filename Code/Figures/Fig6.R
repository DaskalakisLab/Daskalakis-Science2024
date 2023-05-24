library(readxl)
MAD_genes_nosd_sd2_sd3_v1 <- read_excel("/data/humgen/daskalakislab/aiatrou/Science/Manuscript_panels/Fig7/MAD_genes_nosd_sd2_sd3_v1.xls")
MAD <- MAD_genes_nosd_sd2_sd3_v1[1:262,]
RNA <- MAD$genes[which(MAD$RNA >0)]
mDNA <- MAD$genes[which(MAD$DNA >0)]
Protein <- MAD$genes[which(MAD$PROT >0)]
library(VennDiagram)
myFill <- c("#9AA970", "#3b5a9d", "#D4A9A8")
venn.diagram(
  x = list(RNA, mDNA, Protein),
  category.names = c("RNA" , "mDNA " , "Protein"),
  imagetype = "png",
  filename = '/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/Fig6/VENN.png',
  output=F,
  lwd = 2,
  lty = 1,
  fill = myFill,
  cex = 4,
  cat.cex = 2,
  cat.dist = c(0.055, -0.15, 0.045),
)
