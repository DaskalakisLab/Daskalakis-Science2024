library(bigreadr)
library(readxl)
library(dplyr)

demo <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Demographic_merged_R01_years1-4_V4_nd.xlsx", sheet=2)
demo <- as.data.frame(demo)
names(demo)
demo[demo=="NA"] <- NA
demo$Year <- NA
demo[(demo$R01_Year1==1),"Year"] <- 1
demo[(demo$R01_Year2==1),"Year"] <- 2
demo[(demo$R01_Year3==1),"Year"] <- 3
demo[(demo$R01_Year4==1),"Year"] <- 4
demo <- demo[!is.na(demo$Year),]


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


count_NAs <- function(df,col){
  missing <- demo[is.na(demo[[col]]),]
  print(nrow(missing))
  print(missing$BrNum)
  return(nrow(missing))
}

first<-T
for (col in names(demo)){
  print(col)
  n_na <- count_NAs(demo, col)
  if (first){
    na_count <- data.frame(Variable=col, n_NA=n_na)
    first<-F
  }else{
    na_count <- rbind(na_count, data.frame(Variable=col, n_NA=n_na))
  }
}

ggplot