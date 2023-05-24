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
  
  wt_p_Astro <- wilcox.test(anno_ptsd$AstroClean, anno_ctrl$AstroClean, alternative = "two.sided")
  wt_m_Astro <- wilcox.test(anno_mdd$AstroClean, anno_ctrl$AstroClean, alternative = "two.sided")
  wt_mat[1,3] <- wt_p_Astro$statistic
  wt_mat[1,4] <- wt_p_Astro$p.value
  wt_mat[2,3] <- wt_m_Astro$statistic
  wt_mat[2,4] <- wt_m_Astro$p.value
  
  wt_p_inhib <- wilcox.test(anno_ptsd$inhibClean, anno_ctrl$inhibClean, alternative = "two.sided")
  wt_m_inhib <- wilcox.test(anno_mdd$inhibClean, anno_ctrl$inhibClean, alternative = "two.sided")
  wt_mat[3,3] <- wt_p_inhib$statistic
  wt_mat[3,4] <- wt_p_inhib$p.value
  wt_mat[4,3] <- wt_m_inhib$statistic
  wt_mat[4,4] <- wt_m_inhib$p.value
  
  wt_p_ex <- wilcox.test(anno_ptsd$exClean, anno_ctrl$exClean, alternative = "two.sided")
  wt_m_ex <- wilcox.test(anno_mdd$exClean, anno_ctrl$exClean, alternative = "two.sided")
  wt_mat[5,3] <- wt_p_ex$statistic
  wt_mat[5,4] <- wt_p_ex$p.value
  wt_mat[6,3] <- wt_m_ex$statistic
  wt_mat[6,4] <- wt_m_ex$p.value
  
  wt_p_Oligo <- wilcox.test(anno_ptsd$OligoClean, anno_ctrl$OligoClean, alternative = "two.sided")
  wt_m_Oligo <- wilcox.test(anno_mdd$OligoClean, anno_ctrl$OligoClean, alternative = "two.sided")
  wt_mat[7,3] <- wt_p_Oligo$statistic
  wt_mat[7,4] <- wt_p_Oligo$p.value
  wt_mat[8,3] <- wt_m_Oligo$statistic
  wt_mat[8,4] <- wt_m_Oligo$p.value
  
  wt_p_Micro <- wilcox.test(anno_ptsd$MicroClean, anno_ctrl$MicroClean, alternative = "two.sided")
  wt_m_Micro <- wilcox.test(anno_mdd$MicroClean, anno_ctrl$MicroClean, alternative = "two.sided")
  wt_mat[9,3] <- wt_p_Micro$statistic
  wt_mat[9,4] <- wt_p_Micro$p.value
  wt_mat[10,3] <- wt_m_Micro$statistic
  wt_mat[10,4] <- wt_m_Micro$p.value
  
  wt_p_OPC <- wilcox.test(anno_ptsd$OPCClean, anno_ctrl$OPCClean, alternative = "two.sided")
  wt_m_OPC <- wilcox.test(anno_mdd$OPCClean, anno_ctrl$OPCClean, alternative = "two.sided")
  wt_mat[11,3] <- wt_p_OPC$statistic
  wt_mat[11,4] <- wt_p_OPC$p.value
  wt_mat[12,3] <- wt_m_OPC$statistic
  wt_mat[12,4] <- wt_m_OPC$p.value
  
  wt_p_Tcell <- wilcox.test(anno_ptsd$TcellClean, anno_ctrl$TcellClean, alternative = "two.sided")
  wt_m_Tcell <- wilcox.test(anno_mdd$TcellClean, anno_ctrl$TcellClean, alternative = "two.sided")
  wt_mat[13,3] <- wt_p_Tcell$statistic
  wt_mat[13,4] <- wt_p_Tcell$p.value
  wt_mat[14,3] <- wt_m_Tcell$statistic
  wt_mat[14,4] <- wt_m_Tcell$p.value
  
  wt_p_NeuN_neg <- wilcox.test(anno_ptsd$NeuN_negClean, anno_ctrl$NeuN_negClean, alternative = "two.sided")
  wt_m_NeuN_neg <- wilcox.test(anno_mdd$NeuN_negClean, anno_ctrl$NeuN_negClean, alternative = "two.sided")
  wt_mat[15,3] <- wt_p_NeuN_neg$statistic
  wt_mat[15,4] <- wt_p_NeuN_neg$p.value
  wt_mat[16,3] <- wt_m_NeuN_neg$statistic
  wt_mat[16,4] <- wt_m_NeuN_neg$p.value
  
  
  wt_p_NeuN_pos <- wilcox.test(anno_ptsd$NeuN_posClean, anno_ctrl$NeuN_posClean, alternative = "two.sided")
  wt_m_NeuN_pos <- wilcox.test(anno_mdd$NeuN_posClean, anno_ctrl$NeuN_posClean, alternative = "two.sided")
  wt_mat[17,3] <- wt_p_NeuN_pos$statistic
  wt_mat[17,4] <- wt_p_NeuN_pos$p.value
  wt_mat[18,3] <- wt_m_NeuN_pos$statistic
  wt_mat[18,4] <- wt_m_NeuN_pos$p.value
  
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
create_formula <- function(ctp,covariates){
  form <- formula(paste0(ctp,"~", paste(covariates, collapse = "+")))
  return(form)
}

anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

anno12 <- anno12[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","NeuN_neg","NeuN_pos")]
anno3 <- anno3[,c("BrNum","SampleID","Brain_Region","Dx","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","NeuN_neg","NeuN_pos")]


anno12$Year <- "Y1Y2"
anno3$Year <- "Y3"

anno <- rbind(anno12,anno3)
rm(anno12,anno3)

clean_CTPs <- function(anno,ct){
  form <- create_formula(ct, "Year")
  print(form)
  fit<-lm(form, data=anno)
  cleaned <- as.data.frame(fit$residuals)
  names(cleaned) <- paste0(ct,"Clean")
  cleaned <- merge(anno[,c("BrNum","SampleID","Brain_Region")],cleaned,by="row.names",all.x=T)
  cleaned <- cleaned[,names(cleaned)[names(cleaned) != "Row.names"]]
  return(cleaned)
}

Astro_clean <- clean_CTPs(anno, "Astro")
inhib_clean <- clean_CTPs(anno, "inhib")
ex_clean <- clean_CTPs(anno, "ex")
Oligo_clean <- clean_CTPs(anno, "Oligo")
Micro_clean <- clean_CTPs(anno, "Micro")
OPC_clean <- clean_CTPs(anno, "OPC")
Tcell_clean <- clean_CTPs(anno, "Tcell")
NeuN_neg_clean <- clean_CTPs(anno, "NeuN_neg")
NeuN_pos_clean <- clean_CTPs(anno, "NeuN_pos")

anno <- merge(anno,Astro_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,inhib_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,ex_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,Oligo_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,Micro_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,OPC_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,Tcell_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,NeuN_neg_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)
anno <- merge(anno,NeuN_pos_clean,by=c("BrNum","SampleID","Brain_Region"),all.x=T)

rm(Astro_clean,inhib_clean,ex_clean,Oligo_clean,Micro_clean,OPC_clean,Tcell_clean,NeuN_neg_clean,NeuN_pos_clean)

##### Y1Y2

anno_cea <- anno[anno$Brain_Region=="CentralAmyg",]
anno_dg <- anno[anno$Brain_Region=="DG",]
anno_mpfc <- anno[anno$Brain_Region=="mPFC",]

anno_cea_ptsd <- anno_cea[anno_cea$Dx=="PTSD",]
anno_cea_mdd <- anno_cea[anno_cea$Dx=="MDD",]
anno_cea_cntrl <- anno_cea[anno_cea$Dx=="Control",]

anno_dg_ptsd <- anno_dg[anno_dg$Dx=="PTSD",]
anno_dg_mdd <- anno_dg[anno_dg$Dx=="MDD",]
anno_dg_cntrl <- anno_dg[anno_dg$Dx=="Control",]

anno_mpfc_ptsd <- anno_mpfc[anno_mpfc$Dx=="PTSD",]
anno_mpfc_mdd <- anno_mpfc[anno_mpfc$Dx=="MDD",]
anno_mpfc_cntrl <- anno_mpfc[anno_mpfc$Dx=="Control",]


wc_cea <- run_wc_test(anno_ptsd=anno_cea_ptsd, 
                      anno_mdd=anno_cea_mdd,
                      anno_ctrl=anno_cea_cntrl,
                      region="CentralAmyg")

wc_dg <- run_wc_test(anno_ptsd=anno_dg_ptsd, 
                     anno_mdd=anno_dg_mdd,
                     anno_ctrl=anno_dg_cntrl,
                     region="DG")

wc_mpfc <- run_wc_test(anno_ptsd=anno_mpfc_ptsd, 
                       anno_mdd=anno_mpfc_mdd,
                       anno_ctrl=anno_mpfc_cntrl,
                       region="mPFC")

wc <- rbind(wc_cea,wc_dg,wc_mpfc)
write.csv(wc,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/CellTypeCorrelations/CTPwilcoxY1Y2Y3_cleaned.csv",row.names = F,quote = F)
