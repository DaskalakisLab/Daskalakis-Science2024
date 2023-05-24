smr <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/SMRDataForClouds.RDS")

df <- data.frame(Genes=smr$Genes, RNA=0, Prot=0, mDNA=0)
rna_cols <- names(smr)[endsWith(names(smr),"RNA")]
prot_cols <- names(smr)[endsWith(names(smr),"PROT")]
mdna_cols <- names(smr)[endsWith(names(smr),"mDNA")]

rna_cols <- rna_cols[!(grepl("AMY", rna_cols)) & !(grepl("HIP", rna_cols))]
prot_cols <- prot_cols[!(grepl("AMY", prot_cols)) & !(grepl("HIP", prot_cols))]
mdna_cols <- mdna_cols[!(grepl("AMY", mdna_cols)) & !(grepl("HIP", mdna_cols))]

for(g in df$Genes){
  for(rc in rna_cols){
    if(smr[smr$Genes==g, rc]==1){
      df[df$Genes==g, "RNA"] <- 1
    }
  }
  for(pc in prot_cols){
    if(smr[smr$Genes==g, pc]==1){
      df[df$Genes==g, "Prot"] <- 1
    }
  }
  for(mc in mdna_cols){
    if(smr[smr$Genes==g, mc]==1){
      df[df$Genes==g, "mDNA"] <- 1
    }
  }
}

df$RNA_only <- 0
df$Prot_only <- 0
df$mDNA_only <- 0
df$RNA_Prot <- 0
df$RNA_mDNA <- 0
df$Prot_mDNA <- 0
df$RNA_Prot_mDNA <- 0



df[(df$RNA==1)&(df$Prot==0)&(df$mDNA==0), "RNA_only"] <- 1
df[(df$RNA==0)&(df$Prot==1)&(df$mDNA==0), "Prot_only"] <- 1
df[(df$RNA==0)&(df$Prot==0)&(df$mDNA==1), "mDNA_only"] <- 1
df[(df$RNA==1)&(df$Prot==1)&(df$mDNA==0), "RNA_Prot"] <- 1
df[(df$RNA==1)&(df$Prot==0)&(df$mDNA==1), "RNA_mDNA"] <- 1
df[(df$RNA==0)&(df$Prot==1)&(df$mDNA==1), "Prot_mDNA"] <- 1
df[(df$RNA==1)&(df$Prot==1)&(df$mDNA==1), "RNA_Prot_mDNA"] <- 1
df$Total <- df$RNA + df$Prot + df$mDNA


write.csv(df,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/Categoreis/SMRBreakdownPFCOnly.csv",row.names = F,quote = F)


