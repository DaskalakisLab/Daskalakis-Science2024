library(bigreadr)
library(readxl)

demo <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Demographic_merged_R01 years1-4_V4_nd_cs.xlsx", sheet=2)
demo <- as.data.frame(demo)

# 0   1 
# 356 166 
table(demo$`PTSD (yes_no)`)

DLPFC_Samples_48 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/DLPFC_Samples_48.RDS")

demo_sc48 <- demo[demo$BrNum %in% DLPFC_Samples_48$Br_id_opi,]

load("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_geneRSE.Rdata")
r01 <- as.data.frame(rse_gene@colData@listData)
r01 <- r01[r01$BrNum %in% DLPFC_Samples_48$Br_id_opi,]
r01 <- r01[r01$Region=="DLPFC",]

# 50
table(demo_sc48$`PTSD (yes_no)`)
table(demo_sc48$MDD_primary)
demo_sc48 <- demo_sc48[,c("BrNum", "Age", "Sex", "PMI", "PrimaryDx", "PTSD (yes_no)", "MDD_primary", "Controls (yes_no)", "Race", "BMI", "Child trauma (yes_no)_nc", "Adult trauma+military")]

names(demo_sc48) <- c("BrNum", "AgeDeath", "Sex", "PMI", "Dx", "PTSD", "MDD", "Control", "Race", "BMI", "ChildTrauma", "AdultTrauma")

demo_sc48 <- merge(r01[,c("SAMPLE_ID", "BrNum", "Region")], demo_sc48, by="BrNum")

#cell_proportions <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/PTSD_deconvolution_results_with_brains.csv")


#demo_sc48 <- merge(demo_sc48, cell_proportions[,c(1:2, 4:ncol(cell_proportions))], by.x=c("BrNum", "SAMPLE_ID"), by.y=c("BrNum", "RNum"))

ancestry_estimations <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/sc48DLPFC/GlobalAncestrySC48DLPFC.RDS")
names(ancestry_estimations) <- c("BrNum","IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","ancestryPC1","ancestryPC2","ancestryPC3","ancestryPC4","ancestryPC5")
ancestry_estimations <- ancestry_estimations[,c("BrNum","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","ancestryPC1","ancestryPC2","ancestryPC3","ancestryPC4","ancestryPC5")]


# 9 individuals lost  "Br2765" "Br8667" "Br8582" "Br3983" "Br6588" "Br8492" "Br8518" "Br8665" "Br8741"
demo_sc48 <- merge(demo_sc48, ancestry_estimations, by="BrNum")
names(demo_sc48)[names(demo_sc48)=="SAMPLE_ID"] <-"SampleID"
names(demo_sc48)[names(demo_sc48)=="Region"] <-"Brain_Region"
demo_sc48 <- merge(demo_sc48, r01[,c("RNum","RIN","mitoMapped")], by.x="SampleID", by.y="RNum")



d <- demo_sc48[!duplicated(demo_sc48$BrNum),]
table(d$PTSD)
table(d$MDD)
demo_sc48$Brain_Region <- as.character(demo_sc48$Brain_Region)


#qsvs <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/qSVA/qSVs_Y1Y2.RDS")
#qsvs$SampleID <- rownames(qsvs)
#demo_sc48 <- merge(demo_sc48,qsvs,by="SampleID",all.x=T)
demo_sc48$Male <- 0
demo_sc48[demo_sc48$Sex =="M", "Male"] <- 1
demo_sc48$Female <- 0
demo_sc48[demo_sc48$Sex =="F", "Female"] <- 1


saveRDS(demo_sc48, "~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS")
