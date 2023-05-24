library(bigreadr)
library(readxl)

demo <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Demographic_merged_R01 years1-4_V4_nd_cs.xlsx", sheet=2)
demo <- as.data.frame(demo)

# 0   1 
# 356 166 
table(demo$`PTSD (yes_no)`)

DLPFC_Samples_231 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/SampleMap/DLPFC_Samples_231.RDS")

demo_231 <- demo[demo$BrNum %in% DLPFC_Samples_231$Br_id_opi,]

load("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Bulk/RNAseq_Collection_Moods-PTSD_geneRSE.Rdata")
r01 <- as.data.frame(rse_gene@colData@listData)
r01 <- r01[r01$BrNum %in% DLPFC_Samples_231$Br_id_opi,]
r01 <- r01[r01$Region=="DLPFC",]

# 50
table(demo_231$`PTSD (yes_no)`)
table(demo_231$MDD_primary)
demo_231 <- demo_231[,c("BrNum", "Age", "Sex", "PMI", "PrimaryDx", "PTSD (yes_no)", "MDD_primary", "Controls (yes_no)", "Race", "BMI", "Child trauma (yes_no)_nc", "Adult trauma+military")]

names(demo_231) <- c("BrNum", "AgeDeath", "Sex", "PMI", "Dx", "PTSD", "MDD", "Control", "Race", "BMI", "ChildTrauma", "AdultTrauma")

demo_231 <- merge(r01[,c("SAMPLE_ID", "BrNum", "Region")], demo_231, by="BrNum")

#cell_proportions <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CellProportions/RNA/PTSD_deconvolution_results_with_brains.csv")


#demo_231 <- merge(demo_231, cell_proportions[,c(1:2, 4:ncol(cell_proportions))], by.x=c("BrNum", "SAMPLE_ID"), by.y=c("BrNum", "RNum"))

ancestry_estimations <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/DLPFC231/GlobalAncestryDLPFC231.RDS")
names(ancestry_estimations) <- c("BrNum","IID","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","ancestryPC1","ancestryPC2","ancestryPC3","ancestryPC4","ancestryPC5")
ancestry_estimations <- ancestry_estimations[,c("BrNum","bestpop","europe","oceania","africa","americas","cs_asia","e_asia","ancestryPC1","ancestryPC2","ancestryPC3","ancestryPC4","ancestryPC5")]


# 9 individuals lost  "Br2765" "Br8667" "Br8582" "Br3983" "Br6588" "Br8492" "Br8518" "Br8665" "Br8741"
demo_231 <- merge(demo_231, ancestry_estimations, by="BrNum")
names(demo_231)[names(demo_231)=="SAMPLE_ID"] <-"SampleID"
names(demo_231)[names(demo_231)=="Region"] <-"Brain_Region"
demo_231 <- merge(demo_231, r01[,c("RNum","RIN","mitoMapped")], by.x="SampleID", by.y="RNum")



d <- demo_231[!duplicated(demo_231$BrNum),]
table(d$PTSD)
table(d$MDD)
demo_231$Brain_Region <- as.character(demo_231$Brain_Region)


#qsvs <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/qSVA/qSVs_Y1Y2.RDS")
#qsvs$SampleID <- rownames(qsvs)
#demo_231 <- merge(demo_231,qsvs,by="SampleID",all.x=T)
demo_231$Male <- 0
demo_231[demo_231$Sex =="M", "Male"] <- 1
demo_231$Female <- 0
demo_231[demo_231$Sex =="F", "Female"] <- 1


saveRDS(demo_231, "~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")
