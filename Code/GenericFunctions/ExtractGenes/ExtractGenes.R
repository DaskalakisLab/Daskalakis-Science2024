# Run this line before using the rest of the script
source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenericFunctions/ExtractGenes/ExtractionFunctions/LoadFunctions.R")

# Location of mapping files:
#/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GeneMappings
# Example:
  # RNAGeneMap <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GeneMappings/RNAGeneMap.RDS")


### List of functions ###
# extract_rna_genes()
# Input:
#   gene_name: gene name (symbol or ENSG)
#   year: "Y1Y2", "Y3", "All"
#   save: full path of where to save file (if no save is input then a dataframe is returned)
# Examples:
  # fkbp5_y1y2 <- extract_rna_gene("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
  # fkbp5_y3 <- extract_rna_gene("FKBP5", "Y3")
  # fkbp5_all <- extract_rna_gene("FKBP5", "All")

# extract_rna_exons()
# Input:
#   exon_name: exon name (gene symbol or exon name)
#   year: "Y1Y2", "Y3", "All"
#   save: full path of where to save file (if no save is input then a dataframe is returned)
# Examples:
  # fkbp5_y1y2 <- extract_rna_exon("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
  # fkbp5_y3 <- extract_rna_exon("FKBP5", "Y3")
  # fkbp5_all <- extract_rna_exon("FKBP5", "All")

# extract_rna_jx()
# Input:
#   jx_name: jx name (gene symbol or jx name)
#   year: "Y1Y2", "Y3", "All"
#   save: full path of where to save file (if no save is input then a dataframe is returned)
# Examples:
  # fkbp5_y1y2 <- extract_rna_jx("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
  # fkbp5_y3 <- extract_rna_jx("FKBP5", "Y3")
  # fkbp5_all <- extract_rna_jx("FKBP5", "All")

# extract_rna_tx()
# Input:
#   tx_name: tx name (gene symbol or tx name)
#   year: "Y1Y2", "Y3", "All"
#   save: full path of where to save file (if no save is input then a dataframe is returned)
# Examples:
  # fkbp5_y1y2 <- extract_rna_tx("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
  # fkbp5_y3 <- extract_rna_tx("FKBP5", "Y3")
  # fkbp5_all <- extract_rna_tx("FKBP5", "All")


# extract_prot()
# Input:
#   prot_name: protein name (gene symbol or protein name)
#   year: "Y1Y2", "Y3", "All"
#   save: full path of where to save file (if no save is input then a dataframe is returned)
# Examples:
  # fkbp5_y1y2 <- extract_prot("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
  # fkbp5_y3 <- extract_prot("FKBP5", "Y3")
  # fkbp5_all <- extract_prot("FKBP5", "All")


# extract_pep()
# Input:
#   pep_name: peptide name (gene symbol or peptide name)
#   year: "Y1Y2", "Y3", "All"
#   save: full path of where to save file (if no save is input then a dataframe is returned)
# Examples:
  # fkbp5_y1y2 <- extract_pep("FKBP5", "Y1Y2", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
  # fkbp5_y3 <- extract_pep("FKBP5", "Y3")
  # fkbp5_all <- extract_pep("FKBP5", "All")


# extract_meth()
# *will be updated like the other functions once Y3 data is ready
# Input:
#   meth_name: cpg name (gene symbol or cpg name)
#   save: full path of where to save file (if no save is input then a dataframe is returned)
# Examples:
  # fkbp5_y1y2 <- extract_meth("FKBP5", save="/data/humgen/daskalakislab/dipietro/temp/Science/tests/fkbp5_y1y2.csv")
  # fkbp5_y1y2 <- extract_meth("FKBP5")
