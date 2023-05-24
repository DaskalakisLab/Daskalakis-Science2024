library(stringr)

# FKBP5 Extraction

#### Protein
# Proteins
format_prot_data <- function(fname){
  df <- readRDS(fname)
  df$Protein <- rownames(df)
  df$Symbol <- gsub("\\|.*", "", df$Protein)
  df <- df[,c("Protein", "Symbol")]
  rownames(df) <- NULL
  return(df)
}

ca_prot_12 <- format_prot_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_CentralAmyg_clean_no_GIS.RDS")
dg_prot_12 <- format_prot_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_DG_clean_no_GIS.RDS")
mpfc_prot_12 <- format_prot_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Proteins/CleanedWithSampleIDs/Y1Y2_mPFC_clean_no_GIS.RDS")

ca_prot_3 <- format_prot_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_CentralAmyg_clean_no_GIS.RDS")
dg_prot_3 <- format_prot_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_DG_clean_no_GIS.RDS")
mpfc_prot_3 <- format_prot_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Proteins/CleanedWithSampleIDs/Y3_mPFC_clean_no_GIS.RDS")

prot_map <- rbind(ca_prot_12,dg_prot_12,mpfc_prot_12,
                  ca_prot_3,dg_prot_3,mpfc_prot_3)
prot_map <- prot_map[!duplicated(prot_map),]

fkpb5_prot <- prot_map[str_detect(prot_map$Protein, "FKBP5"), ]
saveRDS(fkpb5_prot, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_Protein.RDS")

rm(list=ls())

# Peptides
format_pep_data <- function(fname){
  df <- readRDS(fname)
  df$Peptide <- rownames(df)
  df$Symbol <- gsub("\\|.*", "", df$Peptide)
  df <- df[,c("Peptide", "Symbol")]
  rownames(df) <- NULL
  return(df)
}

ca_pep_12 <- format_pep_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_CentralAmyg_clean_no_GIS.RDS")
dg_pep_12 <- format_pep_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_DG_clean_no_GIS.RDS")
mpfc_pep_12 <- format_pep_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y1Y2/Peptides/CleanWithSampleIDs/Y1Y2_mPFC_clean_no_GIS.RDS")

ca_pep_3 <- format_pep_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_CentralAmyg_clean_no_GIS.RDS")
dg_pep_3 <- format_pep_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_DG_clean_no_GIS.RDS")
mpfc_pep_3 <- format_pep_data("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/TamporNormalized/Y3/Peptides/CleanWithSampleIDs/Y3_mPFC_clean_no_GIS.RDS")

pep_map <- rbind(ca_pep_12,dg_pep_12,mpfc_pep_12,
                 ca_pep_3,dg_pep_3,mpfc_pep_3)

pep_map <- pep_map[!duplicated(pep_map),]

fkpb5_pep <- pep_map[str_detect(pep_map$Peptide, "FKBP5"), ]
saveRDS(fkpb5_pep, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ToExtract/FKBP5_Peptide.RDS")

