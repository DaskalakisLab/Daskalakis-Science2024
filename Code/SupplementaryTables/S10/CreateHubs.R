CeAHubs_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/CentralAmyg/TopHubs_control.RDS")
CeAHubs_RNA <- as.data.frame(CeAHubs_RNA)

DGHubs_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/DG/TopHubs_control.RDS")
DGHubs_RNA <- as.data.frame(DGHubs_RNA)

mPFCHubs_RNA <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/RNA/mPFC/TopHubs_control.RDS")
mPFCHubs_RNA <- as.data.frame(mPFCHubs_RNA)




CeAHubs_PROT <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/CentralAmyg/TopHubs_control.RDS")
CeAHubs_PROT <- as.data.frame(CeAHubs_PROT)

DGHubs_PROT <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/TopHubs_control.RDS")
DGHubs_PROT <- as.data.frame(DGHubs_PROT)

mPFCHubs_PROT <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/mPFC/TopHubs_control.RDS")
mPFCHubs_PROT <- as.data.frame(mPFCHubs_PROT)



write.csv(CeAHubs_RNA, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/CeAHubsRNA.csv",row.names = F,quote = F)
write.csv(DGHubs_RNA, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/DGHubsRNA.csv",row.names = F,quote = F)
write.csv(mPFCHubs_RNA, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/mPFCHubsRNA.csv",row.names = F,quote = F)

write.csv(CeAHubs_PROT, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/CeAHubsPROT.csv",row.names = F,quote = F)
write.csv(DGHubs_PROT, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/DGHubsPROT.csv",row.names = F,quote = F)
write.csv(mPFCHubs_PROT, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SupplementaryTables/S10/mPFCHubsPROT.csv",row.names = F,quote = F)