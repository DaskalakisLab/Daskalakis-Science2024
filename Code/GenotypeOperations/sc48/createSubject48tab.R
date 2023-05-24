library(bigreadr)
library(dplyr)

demo <- fread2("/data/humgen/daskalakislab/aiatrou/Science/Pheno_Demo/cellranger_metrics.csv")
demo <- as.data.frame(demo)

artemis_br <- unique(demo$br_id)
artemis_br <- artemis_br[order(artemis_br)]

brnum_map <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/kleinman_single_cell_n82.brnum2genoID.tab", header=F)
names(brnum_map) <- c("BrNum", "IID")

brnum_map <- brnum_map[brnum_map$BrNum %in% artemis_br,]

brnum_map$FID <- 0
brnum_map <- brnum_map[, c("FID", "IID")]

write.table(brnum_map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/sc48/sc48_subjects.txt", row.names = F, col.names = F, quote = F)
write.table(brnum_map,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/sc48_PlinkFormat/BrNum_mapping.txt", row.names = F, col.names = F, quote = F)
