# To do on server use: module load R/testversions/4.2.0

library(variancePartition)
library(ggplot2)

varpart_Y3 <- function(info, vall, form, out_file, multi_region=F){
  mat <- vall$E
  mat <- as.data.frame(mat)
  if (multi_region){
    info$mPFC <- 0
    info[info$Brain_Region=="mPFC","mPFC"] <- 1
    info$CentralAmyg <- 0
    info[info$Brain_Region=="CentralAmyg","CentralAmyg"] <- 1
    info$DG <- 0
    info[info$Brain_Region=="DG","DG"] <- 1
  }
  mat <- mat[,names(mat) %in% info$SampleID]
  varPart <- fitExtractVarPartModel( mat, form, info, colinearityCutoff=1)
  vp <- sortCols(varPart)
  saveRDS(vp, out_file)
}

# All Brain Regions Together
#############################
# Ancestry Estimates
form_ancestry_est_all_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+europe+americas+cs_asia+e_asia+
  RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_ancestry_est_ptsd_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+PTSD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+europe+americas+cs_asia+e_asia+
  RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_ancestry_est_mdd_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+europe+americas+cs_asia+e_asia+
  RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17


# Ancestry PCs
form_ancestry_pc_all_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+ancestryPC1+
  ancestryPC2+ancestryPC3+ancestryPC4+ancestryPC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_ancestry_pc_ptsd_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+PTSD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+ancestryPC1+
  ancestryPC2+ancestryPC3+ancestryPC4+ancestryPC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_ancestry_pc_mdd_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+ancestryPC1+
  ancestryPC2+ancestryPC3+ancestryPC4+ancestryPC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17


# Genetic PCs
form_genetic_pc_all_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+PC1+
  PC2+PC3+PC4+PC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_genetic_pc_ptsd_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+PTSD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+PC1+
  PC2+PC3+PC4+PC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_genetic_pc_mdd_all <- ~ (1|BrNum)+AgeDeath+(1|Sex)+mPFC+DG+PMI+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+PC1+
  PC2+PC3+PC4+PC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17



# Split Brain Regions
#############################
# Ancestry Estimates
form_ancestry_est_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+europe+americas+cs_asia+e_asia+
  RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_ancestry_est_ptsd_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+europe+americas+cs_asia+e_asia+
  RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_ancestry_est_mdd_split <- ~ AgeDeath+(1|Sex)+PMI+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+europe+americas+cs_asia+e_asia+
  RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17


# Ancestry PCs
form_ancestry_pc_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+ancestryPC1+
  ancestryPC2+ancestryPC3+ancestryPC4+ancestryPC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_ancestry_pc_ptsd_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+ancestryPC1+
  ancestryPC2+ancestryPC3+ancestryPC4+ancestryPC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_ancestry_pc_mdd_split <- ~ AgeDeath+(1|Sex)+PMI+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+ancestryPC1+
  ancestryPC2+ancestryPC3+ancestryPC4+ancestryPC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17


# Genetic PCs
form_genetic_pc_all_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+PC1+
  PC2+PC3+PC4+PC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_genetic_pc_ptsd_split <- ~ AgeDeath+(1|Sex)+PMI+PTSD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+PC1+
  PC2+PC3+PC4+PC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17

form_genetic_pc_mdd_split <- ~ AgeDeath+(1|Sex)+PMI+MDD+BMI+Astro+Macro+Micro+Mural+Oligo+OPC+Excit+Inhib+PC1+
  PC2+PC3+PC4+PC5+RIN+qSV1+qSV2+qSV3+qSV4+qSV6+qSV7+qSV8+qSV9+qSV10+qSV11+qSV12+qSV13+qSV14+qSV15+qSV16+qSV17


info_dir <- "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/InfoFiles/Y3/"
info_files <- list.files(info_dir)
for (f in info_files){
  fname <- gsub(".RDS", "", f)
  fname <- strsplit(fname,split = "_")[[1]]
  dx <- fname[1]
  region <- fname[2]
  info <- readRDS(paste0(info_dir, f))
  print(paste(dx,region))
  
  if ((dx == "All" & region == "All")){
    print(f)
    vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_all_regions.RDS")
    print("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_all_regions.RDS")
    out_ancestry_est <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_est_",dx, "_", region, ".RDS")
    out_ancestry_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_pc_",dx, "_", region, ".RDS")
    out_genetic_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/genetic_pc_",dx, "_", region, ".RDS")
    
    print(out_ancestry_est)
    print(out_ancestry_pc)
    print(out_genetic_pc)
    if (!file.exists(out_ancestry_est)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_est_all_all, out_file = out_ancestry_est, multi_region = T)
    }
    if (!file.exists(out_ancestry_pc)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_pc_all_all, out_file = out_ancestry_pc, multi_region = T)
    }
    if (!file.exists(out_genetic_pc)){
      varpart_Y3(info = info, vall = vall, form = form_genetic_pc_all_all, out_file = out_genetic_pc, multi_region = T)
    }
    
  }else if (dx == "All" & region != "All"){
    print(f)
    vall <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_", region, ".RDS"))
    print(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_", region, ".RDS"))
    out_ancestry_est <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_est_",dx, "_", region, ".RDS")
    out_ancestry_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_pc_",dx, "_", region, ".RDS")
    out_genetic_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/genetic_pc_",dx, "_", region, ".RDS")
    
    print(out_ancestry_est)
    print(out_ancestry_pc)
    print(out_genetic_pc)
    if (!file.exists(out_ancestry_est)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_est_all_split, out_file = out_ancestry_est, multi_region = F)
    }
    if (!file.exists(out_ancestry_pc)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_pc_all_split, out_file = out_ancestry_pc, multi_region = F)
    }
    if (!file.exists(out_genetic_pc)){
      varpart_Y3(info = info, vall = vall, form = form_genetic_pc_all_split, out_file = out_genetic_pc, multi_region = F)
    }
    
  }else if (dx == "PTSD" & region == "All"){
    print(f)
    vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_all_regions.RDS")
    print("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_all_regions.RDS")
    out_ancestry_est <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_est_",dx, "_", region, ".RDS")
    out_ancestry_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_pc_",dx, "_", region, ".RDS")
    out_genetic_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/genetic_pc_",dx, "_", region, ".RDS")
    
    print(out_ancestry_est)
    print(out_ancestry_pc)
    print(out_genetic_pc)
    
    if (!file.exists(out_ancestry_est)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_est_ptsd_all, out_file = out_ancestry_est, multi_region = T)
    }
    if (!file.exists(out_ancestry_pc)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_pc_ptsd_all, out_file = out_ancestry_pc, multi_region = T)
    }
    if (!file.exists(out_genetic_pc)){
      varpart_Y3(info = info, vall = vall, form = form_genetic_pc_ptsd_all, out_file = out_genetic_pc, multi_region = T)
    }
    
  }else if (dx == "MDD" & region == "All"){
    print(f)
    vall <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_all_regions.RDS")
    print("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_all_regions.RDS")
    out_ancestry_est <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_est_",dx, "_", region, ".RDS")
    out_ancestry_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_pc_",dx, "_", region, ".RDS")
    out_genetic_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/genetic_pc_",dx, "_", region, ".RDS")
    
    print(out_ancestry_est)
    print(out_ancestry_pc)
    print(out_genetic_pc)
    if (!file.exists(out_ancestry_est)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_est_mdd_all, out_file = out_ancestry_est, multi_region = T)
    }
    if (!file.exists(out_ancestry_pc)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_pc_mdd_all, out_file = out_ancestry_pc, multi_region = T)
    }
    if (!file.exists(out_genetic_pc)){
      varpart_Y3(info = info, vall = vall, form = form_genetic_pc_mdd_all, out_file = out_genetic_pc, multi_region = T)
    }
    
  }else if (dx == "PTSD" & region != "All"){
    print(f)
    vall <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_", region, ".RDS"))
    print(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_", region, ".RDS"))
    out_ancestry_est <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_est_",dx, "_", region, ".RDS")
    out_ancestry_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_pc_",dx, "_", region, ".RDS")
    out_genetic_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/genetic_pc_",dx, "_", region, ".RDS")
    
    print(out_ancestry_est)
    print(out_ancestry_pc)
    print(out_genetic_pc)
    if (!file.exists(out_ancestry_est)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_est_ptsd_split, out_file = out_ancestry_est, multi_region = F)
    }
    if (!file.exists(out_ancestry_pc)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_pc_ptsd_split, out_file = out_ancestry_pc, multi_region = F)
    }
    if (!file.exists(out_genetic_pc)){
      varpart_Y3(info = info, vall = vall, form = form_genetic_pc_ptsd_split, out_file = out_genetic_pc, multi_region = F)
    }
    
  }else if (dx == "MDD" & region != "All"){
    print(f)
    vall <- readRDS(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_", region, ".RDS"))
    print(paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Voom_Y3_", region, ".RDS"))
    out_ancestry_est <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_est_",dx, "_", region, ".RDS")
    out_ancestry_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/ancestry_pc_",dx, "_", region, ".RDS")
    out_genetic_pc <- paste0("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/VarPartFiles/Y3/genetic_pc_",dx, "_", region, ".RDS")
    
    print(out_ancestry_est)
    print(out_ancestry_pc)
    print(out_genetic_pc)
    if (!file.exists(out_ancestry_est)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_est_mdd_split, out_file = out_ancestry_est, multi_region = F)
    }
    if (!file.exists(out_ancestry_pc)){
      varpart_Y3(info = info, vall = vall, form = form_ancestry_pc_mdd_split, out_file = out_ancestry_pc, multi_region = F)
    }
    if (!file.exists(out_genetic_pc)){
      varpart_Y3(info = info, vall = vall, form = form_genetic_pc_mdd_split, out_file = out_genetic_pc, multi_region = F)
    }
  }
}


