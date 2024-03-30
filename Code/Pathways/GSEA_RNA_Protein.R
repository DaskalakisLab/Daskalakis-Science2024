###Science GSEA- ALL GO C5 TERMS AND LIMIT OF 20-500 GENES####

library(fgsea)
library(ggplot2)
library(msigdbr)
library(dplyr)
library(tibble)
library(DOSE)

###GSEA RNA META###

run_GSEA_GO <- function(in_dirs, out_dir, minSize = 20, maxSize = 500) {
  fgsea_sets <- msigdbr(species = "Homo sapiens", category = "C5") %>%
    split(x = .$gene_symbol, f = .$gs_name)
  
  for (dir in in_dirs) {
    df_dx <- readRDS(dir)
    gsea_input <- df_dx %>%
      arrange(dplyr::desc(beta)) %>% 
      dplyr::select(symbol, beta)
    
    ranks <- deframe(gsea_input)
    
    fgseaRes <- fgseaMultilevel(fgsea_sets, stats = ranks, 
                                minSize = minSize, maxSize = maxSize,
                                eps = 0)
    
    # Extract file name without extension and remove "_beta_sd"
    file_name <- tools::file_path_sans_ext(basename(dir))
    file_name <- gsub("_beta_sd$", "", file_name)
    
    out_file <- paste0(out_dir, "GO_", file_name, ".RDS")
    saveRDS(fgseaRes, file = out_file)
  }
}

in_dirs <- c(
  "/path/to/Genes/PTSD_mPFC_beta_sd.RDS",
  "/path/to/Genes/PTSD_DG_beta_sd.RDS",
  "/path/to/Genes/PTSD_CentralAmyg_beta_sd.RDS",
  "/path/to/Genes/MDD_mPFC_beta_sd.RDS",
  "/path/to/Genes/MDD_DG_beta_sd.RDS",
  "/path/to/Genes/MDD_CentralAmyg_beta_sd.RDS"
)

run_GSEA_GO(
  in_dirs = in_dirs,
  out_dir = "path/to/gsea_RNA_META_allGO/"
)

#################################################################################################################################################

###GSEA Protein META###

run_GSEA_GO <- function(in_dirs, out_dir, minSize = 20, maxSize = 500) {
  fgsea_sets <- msigdbr(species = "Homo sapiens", category = "C5") %>%
    split(x = .$gene_symbol, f = .$gs_name)
  
  for (dir in in_dirs) {
    df_dx <- readRDS(dir)
    gsea_input <- df_dx %>%
      arrange(dplyr::desc(beta)) %>% 
      dplyr::select(symbol, beta)
    
    ranks <- deframe(gsea_input)
    
    fgseaRes <- fgseaMultilevel(fgsea_sets, stats = ranks, 
                                minSize = minSize, maxSize = maxSize,
                                eps = 0)
    
    # Extract file name without extension and remove "_beta_sd"
    file_name <- tools::file_path_sans_ext(basename(dir))
    file_name <- gsub("_beta_sd$", "", file_name)
    
    out_file <- paste0(out_dir, "GO_", file_name, ".RDS")
    saveRDS(fgseaRes, file = out_file)
  }
}

in_dirs <- c(
  "/path/to/Proteins/PTSD_mPFC_beta_sd.RDS",
  "/path/to/Proteins/PTSD_DG_beta_sd.RDS",
  "/path/to/Proteins/PTSD_CentralAmyg_beta_sd.RDS",
  "/path/to/Proteins/MDD_mPFC_beta_sd.RDS",
  "/path/to/Proteins/MDD_DG_beta_sd.RDS",
  "/path/to/Proteins/MDD_CentralAmyg_beta_sd.RDS"
)

run_GSEA_GO(
  in_dirs = in_dirs,
  out_dir = "/path/to/result/gsea_Protein_META_allGO/"
)

###########################################################################################################################################
###########################################################################################################################################

###GSEA RNA###

run_GSEA_GO <- function(in_dirs, out_dir, minSize = 20, maxSize = 500) {
  fgsea_sets <- msigdbr(species = "Homo sapiens", category = "C5") %>%
    split(x = .$gene_symbol, f = .$gs_name)
  
  for (dir in in_dirs) {
    df_dx <- readRDS(dir)
    gsea_input <- df_dx %>%
      arrange(dplyr::desc(beta)) %>% 
      dplyr::select(symbol, beta)
    
    ranks <- deframe(gsea_input)
    
    fgseaRes <- fgseaMultilevel(fgsea_sets, stats = ranks, 
                                minSize = minSize, maxSize = maxSize,
                                eps = 0)
    
    # Extract file name without extension and remove "_beta_sd"
    file_name <- tools::file_path_sans_ext(basename(dir))
    file_name <- gsub("_beta_sd$", "", file_name)
    
    out_file <- paste0(out_dir, "GO_", file_name, ".RDS")
    saveRDS(fgseaRes, file = out_file)
  }
}

in_dirs <- c(
  "/path/to/rep/PTSD_mPFC.RDS",
  "/path/to/rep/PTSD_DG.RDS",
  "/path/to/rep/PTSD_CentralAmyg.RDS",
  "/path/to/rep/MDD_mPFC.RDS",
  "/path/to/rep/MDD_DG.RDS",
  "/path/to/rep/MDD_CentralAmyg.RDS"
)

run_GSEA_GO(
  in_dirs = in_dirs,
  out_dir = "/path/to/result/gsea_RNA_allGO/"
)

#################################################################################################################################################

###GSEA Protein###

run_GSEA_GO <- function(in_dirs, out_dir, minSize = 20, maxSize = 500) {
  fgsea_sets <- msigdbr(species = "Homo sapiens", category = "C5") %>%
    split(x = .$gene_symbol, f = .$gs_name)
  
  for (dir in in_dirs) {
    df_dx <- readRDS(dir)
    gsea_input <- df_dx %>%
      arrange(dplyr::desc(B)) %>% 
      dplyr::select(symbol, B)
    
    ranks <- deframe(gsea_input)
    
    fgseaRes <- fgseaMultilevel(fgsea_sets, stats = ranks, 
                                minSize = minSize, maxSize = maxSize,
                                eps = 0)
    
    # Extract file name without extension and remove "_beta_sd"
    file_name <- tools::file_path_sans_ext(basename(dir))
    file_name <- gsub("_beta_sd$", "", file_name)
    
    out_file <- paste0(out_dir, "GO_", file_name, ".RDS")
    saveRDS(fgseaRes, file = out_file)
  }
}

in_dirs <- c(
  "/path/to/Proteins/PTSD/results_PTSD_mPFC_PTSD.RDS",
  "/path/to/Proteins/PTSD/results_PTSD_DG_PTSD.RDS",
  "/path/to/Proteins/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
  "/path/to/Proteins/MDD/results_MDD_mPFC_MDD.RDS",
  "/path/to/Proteins/MDD/results_MDD_DG_MDD.RDS",
  "/path/to/Proteins/MDD/results_MDD_CentralAmyg_MDD.RDS"
)

run_GSEA_GO(
  in_dirs = in_dirs,
  out_dir = "/path/to/result/gsea_Protein_allGO/"
)

################################################################################################################################

###GSEA RNA BU in vmPFC###

run_GSEA_GO <- function(in_dirs, out_dir, minSize = 20, maxSize = 500) {
  fgsea_sets <- msigdbr(species = "Homo sapiens", category = "C5") %>%
    split(x = .$gene_symbol, f = .$gs_name)
  
  for (dir in in_dirs) {
    df_dx <- readRDS(dir)
    gsea_input <- df_dx %>%
      arrange(dplyr::desc(B)) %>% 
      dplyr::select(symbol, B)
    
    ranks <- deframe(gsea_input)
    
    fgseaRes <- fgseaMultilevel(fgsea_sets, stats = ranks, 
                                minSize = minSize, maxSize = maxSize,
                                eps = 0)
    
    # Extract file name without extension and remove "_beta_sd"
    file_name <- tools::file_path_sans_ext(basename(dir))
    file_name <- gsub("_beta_sd$", "", file_name)
    
    out_file <- paste0(out_dir, "GO_", file_name, ".RDS")
    saveRDS(fgseaRes, file = out_file)
  }
}

in_dirs <- c(
  "/path/to/BU/PTSD/results_PTSD_vmPFC_PTSD.RDS",
  "/path/to/BU/MDD/results_MDD_vmPFC_MDD.RDS"
)

run_GSEA_GO(
  in_dirs = in_dirs,
  out_dir = "/path/to/result/gsea_RNA_BU_allGO/"
)

#################################################################################################################################################

###GSEA Protein MEGA###

run_GSEA_GO <- function(in_dirs, out_dir, minSize = 20, maxSize = 500) {
  fgsea_sets <- msigdbr(species = "Homo sapiens", category = "C5") %>%
    split(x = .$gene_symbol, f = .$gs_name)
  
  for (dir in in_dirs) {
    df_dx <- readRDS(dir)
    gsea_input <- df_dx %>%
      arrange(dplyr::desc(B)) %>% 
      dplyr::select(symbol, B)
    
    ranks <- deframe(gsea_input)
    
    fgseaRes <- fgseaMultilevel(fgsea_sets, stats = ranks, 
                                minSize = minSize, maxSize = maxSize,
                                eps = 0)
    
    # Extract file name without extension and remove "_beta_sd"
    file_name <- tools::file_path_sans_ext(basename(dir))
    file_name <- gsub("_beta_sd$", "", file_name)
    
    out_file <- paste0(out_dir, "GO_", file_name, ".RDS")
    saveRDS(fgseaRes, file = out_file)
  }
}

in_dirs <- c(
  "/path/to/Proteins/discovery/PTSD/results_PTSD_mPFC_PTSD.RDS",
  "/path/to/Proteins/discovery/PTSD/results_PTSD_DG_PTSD.RDS",
  "/path/to/Proteins/discovery/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
  "/path/to/Proteins/discovery/MDD/results_MDD_mPFC_MDD.RDS",
  "/path/to/Proteins/discovery/MDD/results_MDD_DG_MDD.RDS",
  "/path/to/Proteins/discovery/MDD/results_MDD_CentralAmyg_MDD.RDS"
)

run_GSEA_GO(
  in_dirs = in_dirs,
  out_dir = "/path/to/result/gsea_Protein_MEGA_allGO/"
)

###########################################################################################################################################

###GSEA RNA MEGA###

run_GSEA_GO <- function(in_dirs, out_dir, minSize = 20, maxSize = 500) {
  fgsea_sets <- msigdbr(species = "Homo sapiens", category = "C5") %>%
    split(x = .$gene_symbol, f = .$gs_name)
  
  for (dir in in_dirs) {
    df_dx <- readRDS(dir)
    gsea_input <- df_dx %>%
      arrange(dplyr::desc(B)) %>% 
      dplyr::select(symbol, B)
    
    ranks <- deframe(gsea_input)
    
    fgseaRes <- fgseaMultilevel(fgsea_sets, stats = ranks, 
                                minSize = minSize, maxSize = maxSize,
                                eps = 0)
    
    # Extract file name without extension and remove "_beta_sd"
    file_name <- tools::file_path_sans_ext(basename(dir))
    file_name <- gsub("_beta_sd$", "", file_name)
    
    out_file <- paste0(out_dir, "GO_", file_name, ".RDS")
    saveRDS(fgseaRes, file = out_file)
  }
}

in_dirs <- c(
  "/path/to/Gene/discovery/PTSD/results_PTSD_mPFC_PTSD.RDS",
  "/path/to/Gene/discovery/PTSD/results_PTSD_DG_PTSD.RDS",
  "/path/to/Gene/discovery/PTSD/results_PTSD_CentralAmyg_PTSD.RDS",
  "/path/to/Gene/discovery/MDD/results_MDD_mPFC_MDD.RDS",
  "/path/to/Gene/discovery/MDD/results_MDD_DG_MDD.RDS",
  "/path/to/Gene/discovery/MDD/results_MDD_CentralAmyg_MDD.RDS"
)

run_GSEA_GO(
  in_dirs = in_dirs,
  out_dir = "/path/to/result/gsea_RNA_MEGA_allGO/"
)

#####################################################################################################################################
#####################################################################################################################################
