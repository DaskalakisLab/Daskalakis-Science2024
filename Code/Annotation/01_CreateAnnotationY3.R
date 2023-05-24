library(bigreadr)
library(readxl)

demo <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Demographic_merged_R01 years1-4_V4_nd_cs.xlsx", sheet=2)
demo <- as.data.frame(demo)

# 0   1 
# 356 166 
table(demo$`PTSD (yes_no)`)

demo_Y3 <- demo[(demo$R01_Year3==1),]

load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_gene.y123_n688.Rdata")
r01 <- as.data.frame(rse_gene@colData@listData)
rm(rse_gene)

# Removes 3 extra NA rows in demo file
brnums_r01 <- unique(r01$BrNum)
for (i in demo_Y3$BrNum){
  if (!(i %in% brnums_r01)){
    print(i)
  }
}



demo_Y3 <- demo_Y3[demo_Y3$BrNum %in% brnums_r01,]
#demo_Y3 <- demo_Y3[(demo_Y3$`PTSD (yes_no)`==1) | (demo_Y3$`Controls (yes_no)`==1),]

# 50
table(demo_Y3$`PTSD (yes_no)`)
table(demo_Y3$MDD_primary)
demo_Y3 <- demo_Y3[,c("BrNum", "Age", "Sex", "PMI", "PrimaryDx", "PTSD (yes_no)", "MDD_primary", "Controls (yes_no)", "Race", "BMI", "Child trauma (yes_no)_nc", "Adult trauma+military")]

names(demo_Y3) <- c("BrNum", "AgeDeath", "Sex", "PMI", "Dx", "PTSD", "MDD", "Control", "Race", "BMI", "ChildTrauma", "AdultTrauma")

demo_Y3 <- merge(r01[,c("SAMPLE_ID", "BrNum", "Region")], demo_Y3, by="BrNum")

#cell_proportions <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/PTSD_deconvolution_results_with_brains.csv")


#demo_Y3 <- merge(demo_Y3, cell_proportions[,c(1:2, 4:ncol(cell_proportions))], by.x=c("BrNum", "SAMPLE_ID"), by.y=c("BrNum", "RNum"))

ancestry_estimations <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/Y3/GlobalAncestryY3.RDS")
names(ancestry_estimations) <- c("BrNum","IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","ancestryPC1","ancestryPC2","ancestryPC3","ancestryPC4","ancestryPC5")
ancestry_estimations <- ancestry_estimations[,c("BrNum","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","ancestryPC1","ancestryPC2","ancestryPC3","ancestryPC4","ancestryPC5")]

# 9 individuals lost  "Br2765" "Br8667" "Br8582" "Br3983" "Br6588" "Br8492" "Br8518" "Br8665" "Br8741"
demo_Y3 <- merge(demo_Y3, ancestry_estimations, by="BrNum")
names(demo_Y3)[names(demo_Y3)=="SAMPLE_ID"] <-"SampleID"
names(demo_Y3)[names(demo_Y3)=="Region"] <-"Brain_Region"
demo_Y3 <- merge(demo_Y3, r01[,c("RNum","RIN","numReads","numMapped","numUnmapped","overallMapRate",
                                 "concordMapRate","totalMapped","mitoMapped","mitoRate",
                                 "totalAssignedGene","rRNA_rate","per_base_sequence_quality",
                                 "per_tile_sequence_quality","per_base_sequence_content",
                                 "per_sequence_gc_content","per_base_n_content",
                                 "sequence_length_distribution","sequence_duplication_levels",
                                 "overrepresented_sequences","adapter_content")], by.x="SampleID", by.y="RNum")



d <- demo_Y3[!duplicated(demo_Y3$BrNum),]
table(d$PTSD)
table(d$MDD)
table(d$Control)
demo_Y3$Brain_Region <- as.character(demo_Y3$Brain_Region)
demo_Y3$Brain_Region_Protein <- as.character(demo_Y3$Brain_Region)
demo_Y3[demo_Y3$Brain_Region_Protein=="CentralAmyg", "Brain_Region_Protein"] <- "Amygdala"
demo_Y3[demo_Y3$Brain_Region_Protein=="DG", "Brain_Region_Protein"] <- "Hippocampus"

PCA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/PCA/Y3/PCA_Y3.RDS")
PCA <- PCA[,c("BrNum","PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10")]


demo_Y3 <- merge(demo_Y3,PCA,by="BrNum",all.x=T)

#qsvs <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/qSVA/qSVs_Y3.RDS")
#qsvs$SampleID <- rownames(qsvs)
#demo_Y3 <- merge(demo_Y3,qsvs,by="SampleID",all.x=T)
demo_Y3$Male <- 0
demo_Y3[demo_Y3$Sex =="M", "Male"] <- 1
demo_Y3$Female <- 0
demo_Y3[demo_Y3$Sex =="F", "Female"] <- 1

saveRDS(demo_Y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
