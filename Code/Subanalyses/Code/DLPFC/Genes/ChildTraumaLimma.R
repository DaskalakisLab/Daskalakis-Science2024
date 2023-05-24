source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/Subanalyses/Code/RNA/Sub_Limma_functions.R")
sink("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/DLPFC/Genes/ChildTraumaLog.txt")

region <- "DLPFC"

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Genes/VoomDLPFC48.RDS", 
              region = region, 
              dx="PTSD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "gene",
              childtrauma=T,
              covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "ChildTrauma012", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/DLPFC/Genes/DLPFC48/ChildTraumaPTSD/")


limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Genes/VoomDLPFC48.RDS", 
              region = region, 
              dx="MDD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "gene",
              childtrauma=T,
              covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "ChildTrauma012", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/DLPFC/Genes/DLPFC48/ChildTraumaMDD/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Genes/VoomDLPFC48.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = F, 
              ptsd_mdd = T, 
              type = "gene",
              childtrauma=T,
              covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "ChildTrauma012", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/DLPFC/Genes/DLPFC48/ChildTraumaPTSD+MDD/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Genes/VoomDLPFC231.RDS", 
              region = region, 
              dx="PTSD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "gene",
              childtrauma=T,
              covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "ChildTrauma012", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/DLPFC/Genes/DLPFC231/ChildTraumaPTSD/")


limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Genes/VoomDLPFC231.RDS", 
              region = region, 
              dx="MDD", 
              ptsd_vs_mdd = F, 
              ptsd_mdd = F, 
              type = "gene",
              childtrauma=T,
              covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "ChildTrauma012", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/DLPFC/Genes/DLPFC231/ChildTraumaMDD/")

limma_wrapper(anno_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS", 
              voom_file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RNA/Voom/Genes/VoomDLPFC231.RDS", 
              region = region, 
              dx=NULL, 
              ptsd_vs_mdd = F, 
              ptsd_mdd = T, 
              type = "gene",
              childtrauma=T,
              covariates = c("ChildTrauma012","AgeDeath","Sex","PMI","ancestryPC1","ancestryPC2","Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped"), 
              contrast_var = "ChildTrauma012", 
              out_folder = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/DLPFC/Genes/DLPFC231/ChildTraumaPTSD+MDD/")
sink()

