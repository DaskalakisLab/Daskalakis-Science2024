dlpfc_samples <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/DLPFC_Samples_48.RDS")
id_map <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/O771_genotype_id_mapping.csv")

dlpfc_samples <- merge(dlpfc_samples, id_map, by.x="Br_id_opi", by.y="BrNum", all.x=T)

dlpfc_samples <- dlpfc_samples[,c("Br_id_opi", "genotype_ID")]
dlpfc_samples$Br_id_opi <- 0

write.table(dlpfc_samples, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/IDsToKeep/sc48IDs.txt", sep="\t", row.names = F, col.names = F, quote = F)
