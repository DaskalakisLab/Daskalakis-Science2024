library(cli)
library(WGCNA)
library(dplyr)
library(limma)

# First function stays the same
# remove y3 function
# Split into me calculation and then preservation after

options(stringsAsFactors = FALSE)
enableWGCNAThreads()

create_formula <- function(covariates){
  form <- formula(paste0("~", paste(covariates, collapse = "+")))
  return(form)
}

chooseTopHubsInEachModule <- function (datExpr, colorh, omitColors , power, type) 
{
  isIndex = FALSE
  modules = names(table(colorh))
  if (!(is.na(omitColors)[1])) 
    modules = modules[!is.element(modules, omitColors)]
  if (is.null(colnames(datExpr))) {
    colnames(datExpr) = 1:dim(datExpr)[2]
    isIndex = TRUE
  }
  hubgenes_list <- list()
  
  for (i in 1:length(modules)) {
    adj = adjacency(datExpr[, colorh == modules[i]], power = power, 
                    type = type)
    hubs <- head(sort(rowSums(adj), decreasing = T), 10)
    hubgenes_list[[i]] <- names(hubs)
  }
  hubgenes_list <- setNames(hubgenes_list, modules)
  
  return(hubgenes_list)
}

calculate_tophubs <- function(datExpr, moduleColors, power.select){
  tophub <- chooseTopHubsInEachModule(
    datExpr, 
    moduleColors, 
    omitColors = "grey", 
    power = power.select, 
    type = "signed")
  # gene_map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GeneMappings/ProteinMap.RDS")
  # for(i in 1:length(tophub)){
  #   tophub[[i]] <- gene_map$symbol[match(tophub[[i]], gene_map$genes)]
  # }
  return(tophub)
}

# WGCNA control
wgcna_control <- function(data, region, out_dir,power.select){
  # setwd(out_dir)
  # Read in phenotype file
  pheno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
  pheno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
  pheno <- plyr::rbind.fill(pheno12,pheno3)
  rm(pheno12,pheno3)
  pheno <- as.data.frame(pheno)
  
  E <- data[, match(pheno$BrNum, colnames(data))]
  E <- E[,colnames(E)[!(is.na(colnames(E)))]]
  
  pheno <- pheno %>%
    filter(Brain_Region==region, Dx == "Control", !(is.na(SampleID)))
  
  # Subset expression to match pheno
  E_ctrl <- E[, match(pheno$BrNum, colnames(E))]
  
  datExpr <- t(E_ctrl)
  
  load(paste0(out_dir,"/moduleColors.RData"))
  
  tophub <- calculate_tophubs(datExpr,moduleColors,power.select)
  saveRDS(tophub, paste0(out_dir,"/TopHubs_control.RDS"))
  
  return(power.select)
}

data_CeA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/Protein/Proteins/CentralAmyg/Expression_Y123_residuals.RDS")
data_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/Protein/Proteins/DG/Expression_Y123_residuals.RDS")
data_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/Protein/Proteins/mPFC/Expression_Y123_residuals.RDS")

wgcna_control(data=data_CeA, 
              region="CentralAmyg", 
              out_dir="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/CentralAmyg",
              power.select=12)

wgcna_control(data=data_DG, 
              region="DG", 
              out_dir="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG",
              power.select=12)

wgcna_control(data=data_mPFC, 
              region="mPFC", 
              out_dir="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/mPFC",
              power.select=12)

