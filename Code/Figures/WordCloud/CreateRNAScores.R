smr <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/SMRDataForClouds.RDS")

df <- data.frame(Genes=smr$Genes, 
                 MDD_AMY_eqtl_RNA=smr$MDD_AMY_cis_eqtl_RNA, 
                 MDD_AMY_sqtl_RNA=smr$MDD_AMY_cis_sqtl_RNA, 
                 MDD_PFC_eqtl_RNA=smr$MDD_PFC_cis_eqtl_RNA+smr$MDD_PFC_trans_eqtl_RNA, 
                 MDD_PFC_sqtl_RNA=smr$MDD_PFC_cis_sqtl_RNA+smr$MDD_PFC_trans_sqtl_RNA,
                 MDD_HIP_eqtl_RNA=smr$MDD_HIP_cis_eqtl_RNA,
                 MDD_HIP_sqtl_RNA=smr$MDD_HIP_cis_sqtl_RNA,
                 PTSD_AMY_eqtl_RNA=smr$PTSD_AMY_cis_eqtl_RNA, 
                 PTSD_AMY_sqtl_RNA=smr$PTSD_AMY_cis_sqtl_RNA, 
                 PTSD_PFC_eqtl_RNA=smr$PTSD_PFC_cis_eqtl_RNA+smr$PTSD_PFC_trans_eqtl_RNA, 
                 PTSD_PFC_sqtl_RNA=smr$PTSD_PFC_cis_sqtl_RNA+smr$PTSD_PFC_trans_sqtl_RNA,
                 PTSD_HIP_eqtl_RNA=smr$PTSD_HIP_cis_eqtl_RNA,
                 PTSD_HIP_sqtl_RNA=smr$PTSD_HIP_cis_sqtl_RNA)

df$MDD_AMY_RNA_SCORE <- df$MDD_AMY_eqtl_RNA+df$MDD_AMY_sqtl_RNA
df$MDD_PFC_RNA_SCORE <- df$MDD_PFC_eqtl_RNA+df$MDD_PFC_sqtl_RNA
df$MDD_HIP_RNA_SCORE <- df$MDD_HIP_eqtl_RNA+df$MDD_HIP_sqtl_RNA

df$PTSD_AMY_RNA_SCORE <- df$PTSD_AMY_eqtl_RNA+df$PTSD_AMY_sqtl_RNA
df$PTSD_PFC_RNA_SCORE <- df$PTSD_PFC_eqtl_RNA+df$PTSD_PFC_sqtl_RNA
df$PTSD_HIP_RNA_SCORE <- df$PTSD_HIP_eqtl_RNA+df$PTSD_HIP_sqtl_RNA


df$AMY_RNA_SCORE <- df$MDD_AMY_eqtl_RNA+df$MDD_AMY_sqtl_RNA+df$PTSD_AMY_eqtl_RNA+df$PTSD_AMY_sqtl_RNA
df$PFC_RNA_SCORE <- df$MDD_PFC_eqtl_RNA+df$MDD_PFC_sqtl_RNA+df$PTSD_PFC_eqtl_RNA+df$PTSD_PFC_sqtl_RNA
df$HIP_RNA_SCORE <- df$MDD_HIP_eqtl_RNA+df$MDD_HIP_sqtl_RNA+df$PTSD_HIP_eqtl_RNA+df$PTSD_HIP_sqtl_RNA

df$RNA_SCORE <- df$AMY_RNA_SCORE+df$PFC_RNA_SCORE+df$HIP_RNA_SCORE

write.csv(df,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/Categories/SMRBreakdownRNA.csv",row.names = F,quote = F)


