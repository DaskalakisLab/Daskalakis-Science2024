library(bigreadr)
library(readxl)
library(dplyr)
library(data.table)




# Read in demographic data and subset to only subjects in years 1-4
demo <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Demographic_merged_R01 years1-4_V4_nd_cs.xlsx", sheet=2)
sc_subjects <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/kleinman_single_cell_n82.brnum2genoID.tab",header=F)
sc_subjects <- sc_subjects$V1

demo <- as.data.frame(demo)
demo <- demo[!(is.na(demo$BrNum)),]
demo[demo=="NA"] <- NA
demo$Year <- NA
demo[(demo$R01_Year1==1),"Year"] <- "1"
demo[(demo$R01_Year2==1),"Year"] <- "2"
demo[(demo$R01_Year3==1),"Year"] <- "3"
demo[(demo$R01_Year4==1),"Year"] <- "4"
demo$SC <- F
demo[demo$BrNum %in% sc_subjects,"SC"] <- T
demo <- demo[(!is.na(demo$Year)) | demo$SC,]
demo[is.na(demo$Year),"Year"] <- "SC"

# Create combined variables where necessary and subset data to variables of interest

demo$Braak <- demo$Braak_R01
demo[is.na(demo$Braak), "Braak"] <- demo[is.na(demo$Braak), "Braak_BU"]
demo[is.na(demo$Braak), "Braak"] <- demo[is.na(demo$Braak), "Braak_Jaffe"]

demo$CERAD <- demo$CERAD_R01
demo[is.na(demo$CERAD), "CERAD"] <- demo[is.na(demo$CERAD), "CERAD_BU"]
demo[is.na(demo$CERAD), "CERAD"] <- demo[is.na(demo$CERAD), "CERAD_Jaffe"]

demo$`Gross Summary` <- demo$`Gross Summary_R01`
demo[is.na(demo$`Gross Summary`), "Gross Summary"] <- demo[is.na(demo$`Gross Summary`), "Gross Summary_BU"]
demo[is.na(demo$`Gross Summary`), "Gross Summary"] <- demo[is.na(demo$`Gross Summary`), "Gross Summary_Jaffe"]

demo$`Lifetime Antipsych` <- demo$`Lifetime Antipsych_R01`
demo[is.na(demo$`Lifetime Antipsych`), "Lifetime Antipsych"] <- demo[is.na(demo$`Lifetime Antipsych`), "Lifetime Antipsych_BU"]
demo[is.na(demo$`Lifetime Antipsych`), "Lifetime Antipsych"] <- demo[is.na(demo$`Lifetime Antipsych`), "Lifetime Antipsych_Jaffe"]

demo$`Lifetime Lithium` <- demo$`Lifetime Lithium_R01`
demo[is.na(demo$`Lifetime Lithium`), "Lifetime Lithium"] <- demo[is.na(demo$`Lifetime Lithium`), "Lifetime Lithium_BU"]
demo[is.na(demo$`Lifetime Lithium`), "Lifetime Lithium"] <- demo[is.na(demo$`Lifetime Lithium`), "Lifetime Lithium_Jaffe"]

demo[!(is.na(demo$`Past Suicide Attempts`)) & (demo$`Past Suicide Attempts`=="None"),"Past Suicide Attempts"] <- "0"

demo <- demo[,c("BrNum","Year","Psychosis","Smoking","Braak","CERAD","Delusions","Famhx MI","Famhx Suicide",
                "Gross Summary","Hallucinations","Lifetime Anticonvulsant","Lifetime Antidepress",
                "Lifetime Antipsych","Lifetime Lithium","Manner Of Death","Past Self Mutilation","Past SI",
                "Past Suicide Attempts","Flashbacks","Intrusive thoughts","Reliving","Flash+intrusive+reliving",
                "Detachment","Dissociation")]



#Convert applicable columns from "Yes"/"No" variables to 0/1 for easier use


convert_to_numeric <- function(demo, col){
  demo[!(is.na(demo[[col]])) & (demo[[col]]=="Yes"), col] <- 1
  demo[!(is.na(demo[[col]])) & (demo[[col]]=="No"), col] <- 0
  demo[!(is.na(demo[[col]])) & (demo[[col]]=="Unknown"), col] <- NA
  demo[!(is.na(demo[[col]])) & (demo[[col]]=="Not Filled in"), col] <- NA
  demo[!(is.na(demo[[col]])) & (demo[[col]]=="not filled in"), col] <- NA
  demo[[col]] <- as.numeric(demo[[col]])
  
  return(demo)
}

demo[is.na(demo$`Past Suicide Attempts`), "Past Suicide Attempts"] <- "Unknown"

demo <- convert_to_numeric(demo, "Psychosis")
demo <- convert_to_numeric(demo, "Smoking")
demo <- convert_to_numeric(demo, "Delusions")
demo <- convert_to_numeric(demo, "Famhx MI")
demo <- convert_to_numeric(demo, "Famhx Suicide")
demo <- convert_to_numeric(demo, "Hallucinations")
demo <- convert_to_numeric(demo, "Lifetime Anticonvulsant")
demo <- convert_to_numeric(demo, "Lifetime Antidepress")
demo <- convert_to_numeric(demo, "Lifetime Antipsych")
demo <- convert_to_numeric(demo, "Lifetime Lithium")
demo <- convert_to_numeric(demo, "Past Self Mutilation")
demo <- convert_to_numeric(demo, "Past SI")
demo <- convert_to_numeric(demo, "Flashbacks")
demo <- convert_to_numeric(demo, "Intrusive thoughts")
demo <- convert_to_numeric(demo, "Reliving")
demo <- convert_to_numeric(demo, "Flash+intrusive+reliving")
demo <- convert_to_numeric(demo, "Detachment")
demo <- convert_to_numeric(demo, "Dissociation")


# Examine missingness per variable and create a missingness data frame for plotting

count_NAs <- function(df,col){
  missing <- demo[is.na(demo[[col]]),]
  y1_count <- nrow(missing[missing$Year=="1",])
  y2_count <- nrow(missing[missing$Year=="2",])
  y3_count <- nrow(missing[missing$Year=="3",])
  y4_count <- nrow(missing[missing$Year=="4",])
  sc_count <- nrow(missing[missing$Year=="SC",])
  print(nrow(missing))
  print(missing$BrNum)
  return(c(nrow(missing), y1_count, y2_count, y3_count, y4_count, sc_count))
}

first<-T
for (col in names(demo)){
  print(col)
  n_na <- count_NAs(demo, col)
  if (first){
    na_count <- data.frame(Variable=col, n_NA_total=n_na[1], 
                           n_NA_Y1=n_na[2], n_NA_Y2=n_na[3], 
                           n_NA_Y3=n_na[4], n_NA_Y4=n_na[5],
                           n_NA_SC=n_na[6])
    first<-F
  }else{
    na_count <- rbind(na_count, data.frame(Variable=col, n_NA_total=n_na[1], 
                                           n_NA_Y1=n_na[2], n_NA_Y2=n_na[3], 
                                           n_NA_Y3=n_na[4], n_NA_Y4=n_na[5],
                                           n_NA_SC=n_na[6]))
  }
}


# Plot missingness
library(ggplot2)
long_na <- melt(setDT(na_count), id.vars = c("Variable","n_NA_total"), variable.name = "Year", value.name = "Count")
ggplot(long_na, aes(x=Variable, y=Count, fill=Year)) + 
  geom_bar(stat = "identity") +
  geom_text(inherit.aes=F, aes(x=Variable, y=n_NA_total, label = n_NA_total), vjust=-.3, check_overlap = TRUE) +
  scale_y_continuous(limits=c(0,180)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


# Merge with annotation file and save

anno_y12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno_y12 <- merge(anno_y12, demo, by="BrNum", all.x = T)
saveRDS(anno_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")

anno_y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
anno_y3 <- merge(anno_y3, demo, by="BrNum", all.x = T)
saveRDS(anno_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")






