library(ggplot2)
library(bigreadr)

ptsd_magma <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/MAGMA/PTSD3_CEll_types_v2.gsa.txt")
mdd_magma <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/MAGMA/MDDHMVP_CEll_types_v2.gsa.txt")

#ptsd_ewce <- readRDS("/data/humgen/daskalakislab/aiatrou/Science/EWCE/broad_res_ptsd.RDS")
#mdd_ewce <- readRDS("/data/humgen/daskalakislab/aiatrou/Science/EWCE/broad_res_mdd.RDS")

#ptsd_ewce <- ptsd_ewce$results
#mdd_ewce <- mdd_ewce$results

ptsd_magma <- ptsd_magma[,c("VARIABLE", "P")]
names(ptsd_magma) <- c("CellType", "P")
#ptsd_magma$Type <- "MAGMA"

mdd_magma <- mdd_magma[,c("VARIABLE", "P")]
names(mdd_magma) <- c("CellType", "P")
#mdd_magma$Type <- "MAGMA"

#ptsd_ewce <- ptsd_ewce[,c("CellType", "p")]
#names(ptsd_ewce) <- c("CellType", "P")
#ptsd_ewce$Type <- "EWCE"

#mdd_ewce <- mdd_ewce[,c("CellType", "p")]
#names(mdd_ewce) <- c("CellType", "P")
#mdd_ewce$Type <- "EWCE"

#df_ptsd <- rbind(ptsd_magma,ptsd_ewce)
#df_mdd <- rbind(mdd_magma,mdd_ewce)

df_ptsd <- ptsd_magma
df_mdd <- mdd_magma

df_ptsd$Significant <- F
df_ptsd$FDR <- p.adjust(df_ptsd$P, method = "fdr", n = nrow(df_ptsd))
df_ptsd[df_ptsd$P < 0.05, "Significant"] <- "Nominal"
df_ptsd[df_ptsd$FDR < 0.05, "Significant"] <- T
df_ptsd$LP <- -log10(df_ptsd$FDR)
df_ptsd$Name <- df_ptsd$CellType

df_mdd$Significant <- F
df_mdd$FDR <- p.adjust(df_mdd$P, method = "fdr", n = nrow(df_mdd))
df_mdd[df_mdd$P < 0.05, "Significant"] <- "Nominal"
df_mdd[df_mdd$FDR < 0.05, "Significant"] <- T
df_mdd$LP <- -log10(df_mdd$FDR)
df_mdd$Name <- df_mdd$CellType


p_ptsd <- ggplot(df_ptsd, aes(x=LP, y=reorder(Name, LP), fill = Significant)) + 
  geom_bar(stat="identity") + 
  scale_fill_manual(values=c("grey", "#F05D5E")) +
  xlab("-log10(adj.P-value)") +
  ylab("") +
  labs(fill= "Significant") +
  theme_bw() +
  theme(text=element_text(face = "bold",size=18))
  

p_mdd <- ggplot(df_mdd, aes(x=LP, y=reorder(Name, LP), fill = Significant)) + 
  geom_bar(stat="identity") + 
  scale_fill_manual(values=c("grey","#0F7173")) +
  xlab("-log10(adj.P-value)") +
  ylab("") +
  labs(fill= "Significant") +
  theme_bw() +
  theme(text=element_text(face = "bold",size=18))

ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/SupS4/PTSD.png",
       plot = p_ptsd,
       device = "png",
       units = "in",
       width = 7,
       height = 8)

ggsave(filename="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/SupS4/MDD.png",
       plot = p_mdd,
       device = "png",
       units = "in",
       width = 7,
       height = 8)




