mdd <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFCCorrectedNames/Genes/DLPFC231LogFCSD/MDD/results_MDD_DLPFC_MDD_logFC_sd.RDS")
ptsd <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFCCorrectedNames/Genes/DLPFC231LogFCSD/PTSD/results_PTSD_DLPFC_PTSD_logFC_sd.RDS")
combo <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFCCorrectedNames/Genes/DLPFC231LogFCSD/PTSD_MDD/results_PTSD+MDD_DLPFC_PTSD_MDD_logFC_sd.RDS")

mdd <- mdd[,c("gene","Symbol","logFC","SE","P.Value","adj.P.Val","sd_from_mean")]
names(mdd)[names(mdd)=="sd_from_mean"] <- "logFC_sd_from_mean"

ptsd <- ptsd[,c("gene","Symbol","logFC","SE","P.Value","adj.P.Val","sd_from_mean")]
names(ptsd)[names(ptsd)=="sd_from_mean"] <- "logFC_sd_from_mean"

combo <- combo[,c("gene","Symbol","logFC","SE","P.Value","adj.P.Val","sd_from_mean")]
names(combo)[names(combo)=="sd_from_mean"] <- "logFC_sd_from_mean"

write.csv(mdd,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Full/DLPFC231_MDD.csv",row.names = F,quote = F)
write.csv(ptsd,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Full/DLPFC231_PTSD.csv",row.names = F,quote = F)
write.csv(combo,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Full/DLPFC231_PTSD_MDD.csv",row.names = F,quote = F)

mdd_trimmed <- mdd[mdd$adj.P.Val < 0.05,]
ptsd_trimmed <- ptsd[ptsd$adj.P.Val < 0.05,]
combo_trimmed <- combo[combo$adj.P.Val < 0.05,]

write.csv(mdd_trimmed,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Trimmed/DLPFC231_MDD.csv",row.names = F,quote = F)
write.csv(ptsd_trimmed,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Trimmed/DLPFC231_PTSD.csv",row.names = F,quote = F)
write.csv(combo_trimmed,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S6/Trimmed/DLPFC231_PTSD_MDD.csv",row.names = F,quote = F)

