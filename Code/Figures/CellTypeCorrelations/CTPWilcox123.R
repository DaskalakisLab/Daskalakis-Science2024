run_wc_test <- function(anno_ptsd, anno_mdd, anno_ctrl,region){

  wt_mat <- as.data.frame(matrix(0,nrow=18,ncol=4))
  names(wt_mat) <- c("CellType","Comparison","W.Statistic","P.Value")
  
  wt_mat$CellType <- c("Astro","Astro",
                       "inhib","inhib",
                       "ex","ex",
                       "Oligo","Oligo",
                       "Micro","Micro",
                       "OPC","OPC",
                       "Tcell","Tcell",
                       "NeuN_neg","NeuN_neg",
                       "NeuN_pos","NeuN_pos")
  wt_mat$Comparison <- rep(c("PTSD vs Control", "MDD vs Control"),9)
  
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
  
  wt_p_NeuN_neg <- wilcox.test(anno_ptsd$NeuN_neg, anno_ctrl$NeuN_neg, alternative = "two.sided")
  wt_m_NeuN_neg <- wilcox.test(anno_mdd$NeuN_neg, anno_ctrl$NeuN_neg, alternative = "two.sided")
  wt_mat[15,3] <- wt_p_NeuN_neg$statistic
  wt_mat[15,4] <- wt_p_NeuN_neg$p.value
  wt_mat[16,3] <- wt_m_NeuN_neg$statistic
  wt_mat[16,4] <- wt_m_NeuN_neg$p.value
  
  
  wt_p_NeuN_pos <- wilcox.test(anno_ptsd$NeuN_pos, anno_ctrl$NeuN_pos, alternative = "two.sided")
  wt_m_NeuN_pos <- wilcox.test(anno_mdd$NeuN_pos, anno_ctrl$NeuN_pos, alternative = "two.sided")
  wt_mat[17,3] <- wt_p_NeuN_pos$statistic
  wt_mat[17,4] <- wt_p_NeuN_pos$p.value
  wt_mat[18,3] <- wt_m_NeuN_pos$statistic
  wt_mat[18,4] <- wt_m_NeuN_pos$p.value
  
  
  wt_mat$Region <- region
  
  wt_mat_ptsd_ctp7 <- wt_mat[(wt_mat$CellType != "NeuN_neg") & (wt_mat$CellType != "NeuN_pos") & (wt_mat$Comparison=="PTSD vs Control"),]
  wt_mat_ptsd_meth <- wt_mat[((wt_mat$CellType == "NeuN_neg") | (wt_mat$CellType == "NeuN_pos")) & (wt_mat$Comparison=="PTSD vs Control"),]
  
  wt_mat_mdd_ctp7 <- wt_mat[(wt_mat$CellType != "NeuN_neg") & (wt_mat$CellType != "NeuN_pos") & (wt_mat$Comparison=="MDD vs Control"),]
  wt_mat_mdd_meth <- wt_mat[((wt_mat$CellType == "NeuN_neg") | (wt_mat$CellType == "NeuN_pos")) & (wt_mat$Comparison=="MDD vs Control"),]
  
  wt_mat_ptsd_ctp7$adj.P.Val <- p.adjust(wt_mat_ptsd_ctp7$P.Value, method="fdr", n=nrow(wt_mat_ptsd_ctp7))
  wt_mat_ptsd_meth$adj.P.Val <- p.adjust(wt_mat_ptsd_meth$P.Value, method="fdr", n=nrow(wt_mat_ptsd_meth))
  wt_mat_mdd_ctp7$adj.P.Val <- p.adjust(wt_mat_mdd_ctp7$P.Value, method="fdr", n=nrow(wt_mat_mdd_ctp7))
  wt_mat_mdd_meth$adj.P.Val <- p.adjust(wt_mat_mdd_meth$P.Value, method="fdr", n=nrow(wt_mat_mdd_meth))
  
  wt_mat_return <- rbind(wt_mat_ptsd_ctp7,wt_mat_ptsd_meth,wt_mat_mdd_ctp7,wt_mat_mdd_meth)
  return(wt_mat_return)
}


anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

anno12 <- anno12[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","NeuN_neg","NeuN_pos")]
anno3 <- anno3[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","NeuN_neg","NeuN_pos")]


anno12$Year <- "Y1Y2"
anno3$Year <- "Y3"

##### Y1Y2

anno12_cea <- anno12[anno12$Brain_Region=="CentralAmyg",]
anno12_dg <- anno12[anno12$Brain_Region=="DG",]
anno12_mpfc <- anno12[anno12$Brain_Region=="mPFC",]

anno12_cea_ptsd <- anno12_cea[anno12_cea$Dx=="PTSD",]
anno12_cea_mdd <- anno12_cea[anno12_cea$Dx=="MDD",]
anno12_cea_cntrl <- anno12_cea[anno12_cea$Dx=="Control",]

anno12_dg_ptsd <- anno12_dg[anno12_dg$Dx=="PTSD",]
anno12_dg_mdd <- anno12_dg[anno12_dg$Dx=="MDD",]
anno12_dg_cntrl <- anno12_dg[anno12_dg$Dx=="Control",]

anno12_mpfc_ptsd <- anno12_mpfc[anno12_mpfc$Dx=="PTSD",]
anno12_mpfc_mdd <- anno12_mpfc[anno12_mpfc$Dx=="MDD",]
anno12_mpfc_cntrl <- anno12_mpfc[anno12_mpfc$Dx=="Control",]


wc_cea12 <- run_wc_test(anno_ptsd=anno12_cea_ptsd, 
            anno_mdd=anno12_cea_mdd,
            anno_ctrl=anno12_cea_cntrl,
            region="CentralAmyg")

wc_dg12 <- run_wc_test(anno_ptsd=anno12_dg_ptsd, 
            anno_mdd=anno12_dg_mdd,
            anno_ctrl=anno12_dg_cntrl,
            region="DG")

wc_mpfc12 <- run_wc_test(anno_ptsd=anno12_mpfc_ptsd, 
            anno_mdd=anno12_mpfc_mdd,
            anno_ctrl=anno12_mpfc_cntrl,
            region="mPFC")

wc12 <- rbind(wc_cea12,wc_dg12,wc_mpfc12)


### Y3

anno3_cea <- anno3[anno3$Brain_Region=="CentralAmyg",]
anno3_dg <- anno3[anno3$Brain_Region=="DG",]
anno3_mpfc <- anno3[anno3$Brain_Region=="mPFC",]

anno3_cea_ptsd <- anno3_cea[anno3_cea$Dx=="PTSD",]
anno3_cea_mdd <- anno3_cea[anno3_cea$Dx=="MDD",]
anno3_cea_cntrl <- anno3_cea[anno3_cea$Dx=="Control",]

anno3_dg_ptsd <- anno3_dg[anno3_dg$Dx=="PTSD",]
anno3_dg_mdd <- anno3_dg[anno3_dg$Dx=="MDD",]
anno3_dg_cntrl <- anno3_dg[anno3_dg$Dx=="Control",]

anno3_mpfc_ptsd <- anno3_mpfc[anno3_mpfc$Dx=="PTSD",]
anno3_mpfc_mdd <- anno3_mpfc[anno3_mpfc$Dx=="MDD",]
anno3_mpfc_cntrl <- anno3_mpfc[anno3_mpfc$Dx=="Control",]


wc_cea3 <- run_wc_test(anno_ptsd=anno3_cea_ptsd, 
                       anno_mdd=anno3_cea_mdd,
                       anno_ctrl=anno3_cea_cntrl,
                       region="CentralAmyg")

wc_dg3 <- run_wc_test(anno_ptsd=anno3_dg_ptsd, 
                      anno_mdd=anno3_dg_mdd,
                      anno_ctrl=anno3_dg_cntrl,
                      region="DG")

wc_mpfc3 <- run_wc_test(anno_ptsd=anno3_mpfc_ptsd, 
                        anno_mdd=anno3_mpfc_mdd,
                        anno_ctrl=anno3_mpfc_cntrl,
                        region="mPFC")

wc3 <- rbind(wc_cea3,wc_dg3,wc_mpfc3)


write.csv(wc12,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CTPwilcoxY1Y2.csv",row.names = F,quote = F)
write.csv(wc3,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CTPwilcoxY3.csv",row.names = F,quote = F)
