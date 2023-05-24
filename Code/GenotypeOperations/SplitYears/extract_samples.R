library(bigreadr)
library(dplyr)

# Read in file containing BrNums, GenoIDs, and Year
sample_map <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/brnum2genoID_Y1234.tab",header=F)
names(sample_map) <- c("BrNum", "GenoID", "Year")

# Split Y1 and Y2 samples from Y3 samples 
y12_samples <- sample_map[(sample_map$Year=="Y1") | (sample_map$Year=="Y2"),]
y3_samples <- sample_map[sample_map$Year=="Y3",]

y12_samples$IID <- 0
y12_samples <- y12_samples[,c("IID", "GenoID")]

y3_samples$IID <- 0
y3_samples <- y3_samples[,c("IID", "GenoID")]

# Create files to subset genotype data
write.table(y12_samples, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/Y1Y2SampleIDs.txt", sep="\t", row.names = F, col.names = F, quote = F)
write.table(y3_samples, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/Y3SampleIDs.txt", sep="\t", row.names = F, col.names = F, quote = F)


