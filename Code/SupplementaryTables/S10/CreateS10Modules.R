library(bigreadr)

cea_module_colors_rna <- read.csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/Gene2Modules.csv")
cea_module_colors_rna <- cea_module_colors_rna[,c("Module","Gene","Symbol")]

dg_module_colors_rna <- read.csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/Gene2Modules.csv")
dg_module_colors_rna <- dg_module_colors_rna[,c("Module","Gene","Symbol")]

mpfc_module_colors_rna <- read.csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/Gene2Modules.csv")
mpfc_module_colors_rna <- mpfc_module_colors_rna[,c("Module","Gene","Symbol")]

write.csv(cea_module_colors_rna,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/CeAModuleColorsRNA.csv",row.names = F,quote = F)
write.csv(dg_module_colors_rna,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/DGModuleColorsRNA.csv",row.names = F,quote = F)
write.csv(mpfc_module_colors_rna,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/mPFCModuleColorsRNA.csv",row.names = F,quote = F)


cea_module_colors_prot <- read.csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/CentralAmyg/Gene2Modules.csv")
cea_module_colors_prot <- cea_module_colors_prot[,c("Module","Gene","Symbol")]
cea_module_colors_prot$Symbol <- gsub("\\|.*", "", cea_module_colors_prot$Gene)
names(cea_module_colors_prot) <- c("Module", "Proten", "Symbol")

dg_module_colors_prot <- read.csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/Gene2Modules.csv")
dg_module_colors_prot <- dg_module_colors_prot[,c("Module","Gene","Symbol")]
dg_module_colors_prot$Symbol <- gsub("\\|.*", "", dg_module_colors_prot$Gene)
names(dg_module_colors_prot) <- c("Module", "Proten", "Symbol")

mpfc_module_colors_prot <- read.csv("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/mPFC/Gene2Modules.csv")
mpfc_module_colors_prot <- mpfc_module_colors_prot[,c("Module","Gene","Symbol")]
mpfc_module_colors_prot$Symbol <- gsub("\\|.*", "", mpfc_module_colors_prot$Gene)
names(mpfc_module_colors_prot) <- c("Module", "Proten", "Symbol")

write.csv(cea_module_colors_prot,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/CeAModuleColorsPROT.csv",row.names = F,quote = F)
write.csv(dg_module_colors_prot,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/DGModuleColorsPROT.csv",row.names = F,quote = F)
write.csv(mpfc_module_colors_prot,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/mPFCModuleColorsPROT.csv",row.names = F,quote = F)

