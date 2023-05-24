library(bigreadr)

smr <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/SMR_matrix_with_score_more_categories_v1.csv")

smr <- smr[,c(1,15:ncol(smr))]

df <- data.frame(Genes=smr$Genes,MDD_AMY_cis_eqtl_RNA=0,MDD_AMY_cis_sqtl_RNA=0,MDD_PFC_cis_eqtl_RNA=0,
                 MDD_PFC_trans_eqtl_RNA=0,MDD_PFC_cis_sqtl_RNA=0,MDD_PFC_trans_sqtl_RNA=0,MDD_PFC_cis_mqtl_mDNA=0,
                 MDD_PFC_cis_pqtl_PROT=0,PTSD_AMY_cis_eqtl_RNA=0,PTSD_AMY_cis_sqtl_RNA=0,PTSD_PFC_cis_eqtl_RNA=0,
                 PTSD_PFC_trans_eqtl_RNA=0,PTSD_PFC_cis_sqtl_RNA=0,PTSD_PFC_trans_sqtl_RNA=0,PTSD_PFC_cis_mqtl_mDNA=0,
                 PTSD_PFC_cis_pqtl_PROT=0,MDD_HIP_cis_eqtl_RNA=0,MDD_HIP_cis_sqtl_RNA=0,PTSD_HIP_cis_eqtl_RNA=0,PTSD_HIP_cis_sqtl_RNA=0)

df[df$Genes %in% smr[smr$MDD_AMY_ceqtl_RNA_gtex8==1,"Genes"], "MDD_AMY_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_AMY_csqtl_RNA_gtex8==1,"Genes"], "MDD_AMY_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_BA9_ceqtl_RNA_gtex8==1,"Genes"], "MDD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_BA24_ceqtl_RNA_gtex8==1,"Genes"], "MDD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_ceqtl_RNA_gtex8==1,"Genes"], "MDD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_ceqtl_RNA_biogen==1,"Genes"], "MDD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_ceqtl_RNA_yang==1,"Genes"], "MDD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_teqtl_RNA_yang==1,"Genes"], "MDD_PFC_trans_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_BA9_csqtl_RNA_gtex8==1,"Genes"], "MDD_PFC_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_BA24_csqtl_RNA_gtex8==1,"Genes"], "MDD_PFC_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_csqtl_RNA_gtex8==1,"Genes"], "MDD_PFC_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_csqtl_RNA_yang==1,"Genes"], "MDD_PFC_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_tsqtl_RNA_yang==1,"Genes"], "MDD_PFC_trans_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_cmqtl_DNA_yang==1,"Genes"], "MDD_PFC_cis_mqtl_mDNA"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_cpqtl_PROT_PV1==1,"Genes"], "MDD_PFC_cis_pqtl_PROT"] <- 1
df[df$Genes %in% smr[smr$MDD_CORT_cpqtl_PROT_PV2==1,"Genes"], "MDD_PFC_cis_pqtl_PROT"] <- 1
df[df$Genes %in% smr[smr$PTSD_AMY_ceqtl_RNA_gtex8==1,"Genes"], "PTSD_AMY_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_AMY_csqtl_RNA_gtex8==1,"Genes"], "PTSD_AMY_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_BA9_ceqtl_RNA_gtex8==1,"Genes"], "PTSD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_BA24_ceqtl_RNA_gtex8==1,"Genes"], "PTSD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_ceqtl_RNA_gtex8==1,"Genes"], "PTSD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_ceqtl_RNA_biogen==1,"Genes"], "PTSD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_ceqtl_RNA_yang==1,"Genes"], "PTSD_PFC_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_teqtl_RNA_yang==1,"Genes"], "PTSD_PFC_trans_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_BA9_csqtl_RNA_gtex8==1,"Genes"], "PTSD_PFC_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_BA24_csqtl_RNA_gtex8==1,"Genes"], "PTSD_PFC_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_csqtl_RNA_gtex8==1,"Genes"], "PTSD_PFC_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_csqtl_RNA_yang==1,"Genes"], "PTSD_PFC_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_tsqtl_RNA_yang==1,"Genes"], "PTSD_PFC_trans_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_cmqtl_DNA_yang==1,"Genes"], "PTSD_PFC_cis_mqtl_mDNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_cpqtl_PROT_PV1==1,"Genes"], "PTSD_PFC_cis_pqtl_PROT"] <- 1
df[df$Genes %in% smr[smr$PTSD_CORT_cpqtl_PROT_PV2==1,"Genes"], "PTSD_PFC_cis_pqtl_PROT"] <- 1
df[df$Genes %in% smr[smr$MDD_HIPPO_ceqtl_RNA_biogen==1,"Genes"], "MDD_HIP_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_HIPPO_ceqtl_RNA_gtex8==1,"Genes"], "MDD_HIP_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$MDD_HIPPO_csqtl_RNA_gtex8==1,"Genes"], "MDD_HIP_cis_sqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_HIPPO_ceqtl_RNA_biogen==1,"Genes"], "PTSD_HIP_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_HIPPO_ceqtl_RNA_gtex8==1,"Genes"], "PTSD_HIP_cis_eqtl_RNA"] <- 1
df[df$Genes %in% smr[smr$PTSD_HIPPO_csqtl_RNA_gtex8==1,"Genes"], "PTSD_HIP_cis_sqtl_RNA"] <- 1

saveRDS(df, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/SMRData/SMRDataForClouds.RDS")
