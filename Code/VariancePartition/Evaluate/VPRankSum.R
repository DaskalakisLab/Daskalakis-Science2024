
find_covs_to_use <- function(df){
  median_df <- as.data.frame(apply(df,2,median))
  names(median_df) <- "median"
  median_df$cov <- rownames(median_df)
  median_df <- median_df[rownames(median_df)!="Residuals",]
  
  mean_df <- as.data.frame(apply(df,2,mean))
  names(mean_df) <- "mean"
  mean_df$cov <- rownames(mean_df)
  mean_df <- mean_df[rownames(mean_df)!="Residuals",]
  stat_df <- merge(mean_df, median_df, by="cov")
  rownames(stat_df) <- stat_df$cov
  rm(mean_df, median_df)
  
  baseline_covs <- c("AgeDeath", "Sex", "PMI", "PTSD", 
                     "MDD", "ex", "inhib", "Astro", 
                     "Micro", "Oligo", "OPC", "Tcell")
  cov_sum <- 0
  for (bc in baseline_covs){
    #print(bc)
    cov_sum <- cov_sum + stat_df[bc, "mean"]
  }
  
  covs_to_use <- baseline_covs
  
  if (cov_sum > 0.5){
    print(cov_sum)
    return(covs_to_use)
  }else{
    stat_df <- stat_df[rownames(stat_df)[!(rownames(stat_df) %in% baseline_covs)],]
    stat_df <- stat_df[order(stat_df$median, decreasing = T),]
    for (i in 1:nrow(stat_df)){
      cov_sum <- cov_sum + stat_df[i, "mean"]
      covs_to_use <- append(covs_to_use, rownames(stat_df[i,]))
      if (cov_sum > 0.5){
        print(cov_sum)
        return(covs_to_use)
      }
    }
    print(cov_sum)
    return(covs_to_use)
  }
}



ca_rna <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/FinalizedCovs/VarPartFiles/Y1Y2/CentralAmyg_ctp7.RDS")
find_covs_to_use(ca_rna)

dg_rna <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/FinalizedCovs/VarPartFiles/Y1Y2/DG_ctp7.RDS")
find_covs_to_use(dg_rna)

mpfc_rna <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/VariancePartition/Genes/FinalizedCovs/VarPartFiles/Y1Y2/mPFC_ctp7.RDS")
find_covs_to_use(mpfc_rna)


ca_prot <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/VarPartFiles/Y1Y2/CentralAmyg_ctp7.RDS")
find_covs_to_use(ca_prot)

dg_prot <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/VarPartFiles/Y1Y2/DG_ctp7.RDS")
find_covs_to_use(dg_prot)

mpfc_prot <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/VariancePartition/Proteins/VarPartFiles/Y1Y2/mPFC_ctp7.RDS")
find_covs_to_use(mpfc_prot)






ca_meth <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/VariancePartition/VarPartFiles/Y1Y2/CentralAmyg.RDS")
find_covs_to_use(ca_meth)

dg_meth <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/VariancePartition/VarPartFiles/Y1Y2/DG.RDS")
find_covs_to_use(dg_meth)

mpfc_meth <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/VariancePartition/VarPartFiles/Y1Y2/mPFC.RDS")
find_covs_to_use(mpfc_meth)

