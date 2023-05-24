run_wc_test <- function(anno_ptsd, anno_mdd, anno_ctrl,region){
  
  wt_mat <- as.data.frame(matrix(0,nrow=14,ncol=4))
  names(wt_mat) <- c("CellType","Comparison","W.Statistic","P.Value")
  
  wt_mat$CellType <- c("Astro","Astro",
                       "inhib","inhib",
                       "ex","ex",
                       "Oligo","Oligo",
                       "Micro","Micro",
                       "OPC","OPC",
                       "Tcell","Tcell")
  wt_mat$Comparison <- rep(c("PTSD vs Control", "MDD vs Control"),7)
  
  wt_p_Astro <- wilcox.test(anno_ptsd$Astro, anno_ctrl$Astro, alternative = "two.sided")
  wt_m_Astro <- wilcox.test(anno_mdd$Astro, anno_ctrl$Astro, alternative = "two.sided")
  wt_mat[1,3] <- wt_p_Astro$statistic
  wt_mat[1,4] <- wt_p_Astro$p.value
  wt_mat[2,3] <- wt_m_Astro$statistic
  wt_mat[2,4] <- wt_m_Astro$p.value
  
  wt_p_inhib <- wilcox.test(anno_ptsd$inhib, anno_ctrl$inhib, alternative = "two.sided")
  wt_m_inhib <- wilcox.test(anno_mdd$inhib, anno_ctrl$inhib, alternative = "two.sided")
  wt_mat[3,3] <- wt_p_inhib$statistic
  wt_mat[3,4] <- wt_p_inhib$p.value
  wt_mat[4,3] <- wt_m_inhib$statistic
  wt_mat[4,4] <- wt_m_inhib$p.value
  
  wt_p_ex <- wilcox.test(anno_ptsd$ex, anno_ctrl$ex, alternative = "two.sided")
  wt_m_ex <- wilcox.test(anno_mdd$ex, anno_ctrl$ex, alternative = "two.sided")
  wt_mat[5,3] <- wt_p_ex$statistic
  wt_mat[5,4] <- wt_p_ex$p.value
  wt_mat[6,3] <- wt_m_ex$statistic
  wt_mat[6,4] <- wt_m_ex$p.value
  
  wt_p_Oligo <- wilcox.test(anno_ptsd$Oligo, anno_ctrl$Oligo, alternative = "two.sided")
  wt_m_Oligo <- wilcox.test(anno_mdd$Oligo, anno_ctrl$Oligo, alternative = "two.sided")
  wt_mat[7,3] <- wt_p_Oligo$statistic
  wt_mat[7,4] <- wt_p_Oligo$p.value
  wt_mat[8,3] <- wt_m_Oligo$statistic
  wt_mat[8,4] <- wt_m_Oligo$p.value
  
  wt_p_Micro <- wilcox.test(anno_ptsd$Micro, anno_ctrl$Micro, alternative = "two.sided")
  wt_m_Micro <- wilcox.test(anno_mdd$Micro, anno_ctrl$Micro, alternative = "two.sided")
  wt_mat[9,3] <- wt_p_Micro$statistic
  wt_mat[9,4] <- wt_p_Micro$p.value
  wt_mat[10,3] <- wt_m_Micro$statistic
  wt_mat[10,4] <- wt_m_Micro$p.value
  
  wt_p_OPC <- wilcox.test(anno_ptsd$OPC, anno_ctrl$OPC, alternative = "two.sided")
  wt_m_OPC <- wilcox.test(anno_mdd$OPC, anno_ctrl$OPC, alternative = "two.sided")
  wt_mat[11,3] <- wt_p_OPC$statistic
  wt_mat[11,4] <- wt_p_OPC$p.value
  wt_mat[12,3] <- wt_m_OPC$statistic
  wt_mat[12,4] <- wt_m_OPC$p.value
  
  wt_p_Tcell <- wilcox.test(anno_ptsd$Tcell, anno_ctrl$Tcell, alternative = "two.sided")
  wt_m_Tcell <- wilcox.test(anno_mdd$Tcell, anno_ctrl$Tcell, alternative = "two.sided")
  wt_mat[13,3] <- wt_p_Tcell$statistic
  wt_mat[13,4] <- wt_p_Tcell$p.value
  wt_mat[14,3] <- wt_m_Tcell$statistic
  wt_mat[14,4] <- wt_m_Tcell$p.value
  
  
  wt_mat$Region <- region
  
  wt_mat_ptsd <- wt_mat[(wt_mat$Comparison=="PTSD vs Control"),]
  
  wt_mat_mdd <- wt_mat[(wt_mat$Comparison=="MDD vs Control"),]
  
  wt_mat_ptsd$adj.P.Val <- p.adjust(wt_mat_ptsd$P.Value, method="fdr", n=nrow(wt_mat_ptsd))
  wt_mat_mdd$adj.P.Val <- p.adjust(wt_mat_mdd$P.Value, method="fdr", n=nrow(wt_mat_mdd))

  wt_mat_return <- rbind(wt_mat_ptsd,wt_mat_mdd)
  return(wt_mat_return)
}


anno <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")

anno <- anno[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell")]


anno_ptsd <- anno[anno$Dx=="PTSD",]
anno_mdd <- anno[anno$Dx=="MDD",]
anno_cntrl <- anno[anno$Dx=="Control",]

wc <- run_wc_test(anno_ptsd=anno_ptsd, 
                  anno_mdd=anno_mdd,
                  anno_ctrl=anno_cntrl,
                  region="DLPFC")


write.csv(wc,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CTPwilcoxDLPFC231.csv",row.names = F,quote = F)

