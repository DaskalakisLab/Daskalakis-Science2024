source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Limma_Functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/log.txt")

region <- "DLPFC"

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_sc48.RDS", 
              region = region, 
              dx="PTSD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "tx",
              covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/DLPFC48/PTSD/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_sc48.RDS", 
              region = region, 
              dx="MDD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "tx",
              covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "MDD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/DLPFC48/MDD/")


limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_sc48.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = F, 
              ptsd_mdd = T, 
              type = "tx",
              covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD_MDD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/DLPFC48/PTSD_MDD/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_sc48.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = T, 
              ptsd_mdd = F, 
              type = "tx",
              covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/DLPFC48/PTSD_vs_MDD/")







limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_231.RDS", 
              region = region, 
              dx="PTSD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "tx",
              covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/DLPFC231/PTSD/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_231.RDS", 
              region = region, 
              dx="MDD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "tx",
              covariates = c("MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "MDD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/DLPFC231/MDD/")


limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_231.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = F, 
              ptsd_mdd = T, 
              type = "tx",
              covariates = c("PTSD_MDD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD_MDD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/DLPFC231/PTSD_MDD/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Txs/log2TMM1_DLPFC_231.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = T, 
              ptsd_mdd = F, 
              type = "tx",
              covariates = c("PTSD","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC/Txs/DLPFC231/PTSD_vs_MDD/")
sink()


