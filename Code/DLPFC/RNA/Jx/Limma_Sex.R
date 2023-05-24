source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/RNA/Limma_Functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/log231.txt")

region <- "DLPFC"

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Jxs/VoomDLPFC231.RDS", 
              region = region, 
              dx="PTSD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "jx",
              sex = "M",
              covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/PTSD_Male/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Jxs/VoomDLPFC231.RDS", 
              region = region, 
              dx="MDD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "jx",
              sex = "M",
              covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "MDD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/MDD_Male/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Jxs/VoomDLPFC231.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = F, 
              ptsd_mdd = T, 
              type = "jx",
              sex = "M",
              covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD_MDD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/PTSD_MDD_Male/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Jxs/VoomDLPFC231.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = T, 
              ptsd_mdd = F, 
              type = "jx",
              sex = "M",
              covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/PTSD_vs_MDD_Male/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Jxs/VoomDLPFC231.RDS", 
              region = region, 
              dx="PTSD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "jx",
              sex = "F",
              covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/PTSD_Female/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Jxs/VoomDLPFC231.RDS", 
              region = region, 
              dx="MDD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "jx",
              sex = "F",
              covariates = c("MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "MDD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/MDD_Female/")


limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Jxs/VoomDLPFC231.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = F, 
              ptsd_mdd = T, 
              type = "jx",
              sex = "F",
              covariates = c("PTSD_MDD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD_MDD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/PTSD_MDD_Female/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Jxs/VoomDLPFC231.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = T, 
              ptsd_mdd = F, 
              type = "jx",
              sex = "F",
              covariates = c("PTSD","AgeDeath","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "PTSD", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC/Jxs/DLPFC231/PTSD_vs_MDD_Female/")
sink()
