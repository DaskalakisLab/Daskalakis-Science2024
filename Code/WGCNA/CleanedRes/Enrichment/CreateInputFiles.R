library(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
annEPIC <- getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)

extract_meth <- function(wd, analysis, annEPIC){
  res_files <- list.files(wd,pattern = ".RDS")
  res_files <- res_files[!grepl("PTSD_vs_MDD", res_files)]
  for (rf in res_files){
    if(grepl("CentralAmyg", rf)){
      region <- "CentralAmyg"
    }else if(grepl("DG", rf)){
      region <- "DG"
    }else if(grepl("mPFC", rf)){
      region <- "mPFC"
    }
    if(grepl("PTSD_MDD", rf) | grepl("PTSD\\+MDD", rf)){
      disease <- "PTSD_MDD"
    }else if(grepl("PTSD", rf)){
      disease <- "PTSD"
    }else if(grepl("MDD", rf)){
      disease <- "MDD"
    }
    df <- readRDS(paste0(wd,rf))
    df_fdr <- df[df$FDR < 0.05,]
    if(nrow(df_fdr)>0){
      fdr_genes <- unique(unlist(strsplit(annEPIC$UCSC_RefGene_Name[match(df_fdr$meth[df_fdr$FDR<.05],annEPIC$Name)],split=";")))
      type <- paste0(analysis,"_Methylation_",gsub(".RDS","",rf))
      fdr_genes <- c(type, fdr_genes)
      lapply(fdr_genes, write, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/", disease, "/", region, "/", type, ".txt"), append=TRUE, ncolumns=1000)
    }
  }
}

extract_meth(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Methylation/", analysis="Baseline", annEPIC=annEPIC)
extract_meth(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Methylation/", analysis="ChildTrauma", annEPIC=annEPIC)
extract_meth(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/SexSpecific/Methylation/", analysis="SexSpecific", annEPIC=annEPIC)
extract_meth(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Methylation/", analysis="Suicide", annEPIC=annEPIC)

extract_genes <- function(wd, analysis){
  res_files <- list.files(wd,pattern = ".RDS")
  res_files <- res_files[!grepl("PTSD_vs_MDD", res_files)]
  for (rf in res_files){
    if(grepl("CentralAmyg", rf)){
      region <- "CentralAmyg"
    }else if(grepl("DG", rf)){
      region <- "DG"
    }else if(grepl("mPFC", rf)){
      region <- "mPFC"
    }
    if(grepl("PTSD_MDD", rf) | grepl("PTSD\\+MDD", rf)){
      disease <- "PTSD_MDD"
    }else if(grepl("PTSD", rf)){
      disease <- "PTSD"
    }else if(grepl("MDD", rf)){
      disease <- "MDD"
    }
    df <- readRDS(paste0(wd,rf))
    df_fdr <- df[df$FDR < 0.05,]
    if (nrow(df_fdr > 0)){
      fdr_genes <- df_fdr$symbol
      fdr_genes <- fdr_genes[!(is.na(fdr_genes))]
      fdr_genes <- unique(fdr_genes)
      fdr_genes <- unique(unlist(strsplit(fdr_genes,split="; ")))
      type <- paste0(analysis,"_",gsub(".RDS","",rf))
      fdr_genes <- c(type, fdr_genes)
      lapply(fdr_genes, write, paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/", disease, "/", region, "/", type, ".txt"), append=TRUE, ncolumns=1000)
      
    }
  }
}

extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Exons/", analysis="Baseline_RNA_Exons")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Exons/", analysis="ChildTrauma_RNA_Exons")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/SexSpecific/RNA/Exons/", analysis="SexSpecific_RNA_Exons")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Exons/", analysis="Suicide_RNA_Exons")

extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Genes/", analysis="Baseline_RNA_Genes")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Genes/", analysis="ChildTrauma_RNA_Genes")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/SexSpecific/RNA/Genes/", analysis="SexSpecific_RNA_Genes")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Genes/", analysis="Suicide_RNA_Genes")

extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Jxs/", analysis="Baseline_RNA_Jxs")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Jxs/", analysis="ChildTrauma_RNA_Jxs")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/SexSpecific/RNA/Jxs/", analysis="SexSpecific_RNA_Jxs")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Jxs/", analysis="Suicide_RNA_Jxs")

extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/Txs/", analysis="Baseline_RNA_Txs")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/RNA/Txs/", analysis="ChildTrauma_RNA_Txs")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/SexSpecific/RNA/Txs/", analysis="SexSpecific_RNA_Txs")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/RNA/Txs/", analysis="Suicide_RNA_Txs")

extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Proteins/", analysis="Baseline_Protein_Proteins")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Proteins/", analysis="ChildTrauma_Protein_Proteins")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/SexSpecific/Protein/Proteins/", analysis="SexSpecific_Protein_Proteins")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Proteins/", analysis="Suicide_Protein_Proteins")

extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/Protein/Peptides/", analysis="Baseline_Protein_Peptides")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/ChildTrauma/Protein/Peptides/", analysis="ChildTrauma_Protein_Peptides")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/SexSpecific/Protein/Peptides/", analysis="SexSpecific_Protein_Peptides")
extract_genes(wd="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Suicide/Protein/Peptides/", analysis="Suicide_Protein_Peptides")

