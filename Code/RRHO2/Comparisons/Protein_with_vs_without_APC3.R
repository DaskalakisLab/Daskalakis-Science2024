source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenericFunctions/RRHO2.R")

# PTSD
Y1Y2_PTSD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
Y1Y2_PTSD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
Y3_PTSD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
Y3_PTSD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_CentralAmyg_v1, Y1Y2_PTSD_CentralAmyg_v2, "Y1Y2 PTSD Central Amygdala with APC3", "Y1Y2 PTSD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_CA.pdf")
plot_heatmap_multi(Y3_PTSD_CentralAmyg_v1, Y3_PTSD_CentralAmyg_v2, "Y3 PTSD Central Amygdala with APC3", "Y3 PTSD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y3_CA.pdf")
plot_heatmap_multi(Y1Y2_PTSD_CentralAmyg_v1, Y3_PTSD_CentralAmyg_v1, "Y1Y2 PTSD Central Amygdala with APC3", "Y3 PTSD Central Amygdala with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_Y3_CA_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_CentralAmyg_v2, Y3_PTSD_CentralAmyg_v2, "Y3 PTSD Central Amygdala witout APC3", "Y3 PTSD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_Y3_CA_without.pdf")


Y1Y2_PTSD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
Y1Y2_PTSD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
Y3_PTSD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD/results_PTSD_DG_PTSD.RDS")
Y3_PTSD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD/results_PTSD_DG_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_DG_v1, Y1Y2_PTSD_DG_v2, "Y1Y2 PTSD DG with APC3", "Y1Y2 PTSD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_DG.pdf")
plot_heatmap_multi(Y3_PTSD_DG_v1, Y3_PTSD_DG_v2, "Y3 PTSD DG with APC3", "Y3 PTSD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y3_DG.pdf")
plot_heatmap_multi(Y1Y2_PTSD_DG_v1, Y3_PTSD_DG_v1, "Y1Y2 PTSD DG with APC3", "Y3 PTSD DG with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_Y3_DG_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_DG_v2, Y3_PTSD_DG_v2, "Y3 PTSD DG witout APC3", "Y3 PTSD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_Y3_DG_without.pdf")


Y1Y2_PTSD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
Y1Y2_PTSD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
Y3_PTSD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")
Y3_PTSD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_mPFC_v1, Y1Y2_PTSD_mPFC_v2, "Y1Y2 PTSD mPFC with APC3", "Y1Y2 PTSD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_mPFC.pdf")
plot_heatmap_multi(Y3_PTSD_mPFC_v1, Y3_PTSD_mPFC_v2, "Y3 PTSD mPFC with APC3", "Y3 PTSD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y3_mPFC.pdf")
plot_heatmap_multi(Y1Y2_PTSD_mPFC_v1, Y3_PTSD_mPFC_v1, "Y1Y2 PTSD mPFC with APC3", "Y3 PTSD mPFC with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_Y3_mPFC_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_mPFC_v2, Y3_PTSD_mPFC_v2, "Y3 PTSD mPFC witout APC3", "Y3 PTSD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD/Y1Y2_Y3_mPFC_without.pdf")




#############################
# MDD
Y1Y2_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
Y1Y2_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
Y3_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")
Y3_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")

plot_heatmap_multi(Y1Y2_MDD_CentralAmyg_v1, Y1Y2_MDD_CentralAmyg_v2, "Y1Y2 MDD Central Amygdala with APC3", "Y1Y2 MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_CA.pdf")
plot_heatmap_multi(Y3_MDD_CentralAmyg_v1, Y3_MDD_CentralAmyg_v2, "Y3 MDD Central Amygdala with APC3", "Y3 MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y3_CA.pdf")
plot_heatmap_multi(Y1Y2_MDD_CentralAmyg_v1, Y3_MDD_CentralAmyg_v1, "Y1Y2 MDD Central Amygdala with APC3", "Y3 MDD Central Amygdala with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_Y3_CA_with.pdf")
plot_heatmap_multi(Y1Y2_MDD_CentralAmyg_v2, Y3_MDD_CentralAmyg_v2, "Y3 MDD Central Amygdala witout APC3", "Y3 MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_Y3_CA_without.pdf")


Y1Y2_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
Y1Y2_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
Y3_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/MDD/results_MDD_DG_MDD.RDS")
Y3_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/MDD/results_MDD_DG_MDD.RDS")

plot_heatmap_multi(Y1Y2_MDD_DG_v1, Y1Y2_MDD_DG_v2, "Y1Y2 MDD DG with APC3", "Y1Y2 MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_DG.pdf")
plot_heatmap_multi(Y3_MDD_DG_v1, Y3_MDD_DG_v2, "Y3 MDD DG with APC3", "Y3 MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y3_DG.pdf")
plot_heatmap_multi(Y1Y2_MDD_DG_v1, Y3_MDD_DG_v1, "Y1Y2 MDD DG with APC3", "Y3 MDD DG with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_Y3_DG_with.pdf")
plot_heatmap_multi(Y1Y2_MDD_DG_v2, Y3_MDD_DG_v2, "Y3 MDD DG witout APC3", "Y3 MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_Y3_DG_without.pdf")


Y1Y2_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
Y1Y2_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
Y3_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/MDD/results_MDD_mPFC_MDD.RDS")
Y3_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/MDD/results_MDD_mPFC_MDD.RDS")

plot_heatmap_multi(Y1Y2_MDD_mPFC_v1, Y1Y2_MDD_mPFC_v2, "Y1Y2 MDD mPFC with APC3", "Y1Y2 MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_mPFC.pdf")
plot_heatmap_multi(Y3_MDD_mPFC_v1, Y3_MDD_mPFC_v2, "Y3 MDD mPFC with APC3", "Y3 MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y3_mPFC.pdf")
plot_heatmap_multi(Y1Y2_MDD_mPFC_v1, Y3_MDD_mPFC_v1, "Y1Y2 MDD mPFC with APC3", "Y3 MDD mPFC with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_Y3_mPFC_with.pdf")
plot_heatmap_multi(Y1Y2_MDD_mPFC_v2, Y3_MDD_mPFC_v2, "Y3 MDD mPFC witout APC3", "Y3 MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/MDD/Y1Y2_Y3_mPFC_without.pdf")


################################
# PTSD + MDD
Y1Y2_PTSD_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
Y1Y2_PTSD_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
Y3_PTSD_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
Y3_PTSD_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_MDD_CentralAmyg_v1, Y1Y2_PTSD_MDD_CentralAmyg_v2, "Y1Y2 PTSD+MDD Central Amygdala with APC3", "Y1Y2 PTSD+MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_CA.pdf")
plot_heatmap_multi(Y3_PTSD_MDD_CentralAmyg_v1, Y3_PTSD_MDD_CentralAmyg_v2, "Y3 PTSD+MDD Central Amygdala with APC3", "Y3 PTSD+MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y3_CA.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_CentralAmyg_v1, Y3_PTSD_MDD_CentralAmyg_v1, "Y1Y2 PTSD+MDD Central Amygdala with APC3", "Y3 PTSD+MDD Central Amygdala with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_Y3_CA_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_CentralAmyg_v2, Y3_PTSD_MDD_CentralAmyg_v2, "Y3 PTSD+MDD Central Amygdala witout APC3", "Y3 PTSD+MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_Y3_CA_without.pdf")


Y1Y2_PTSD_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
Y1Y2_PTSD_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
Y3_PTSD_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
Y3_PTSD_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_MDD_DG_v1, Y1Y2_PTSD_MDD_DG_v2, "Y1Y2 PTSD+MDD DG with APC3", "Y1Y2 PTSD+MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_DG.pdf")
plot_heatmap_multi(Y3_PTSD_MDD_DG_v1, Y3_PTSD_MDD_DG_v2, "Y3 PTSD+MDD DG with APC3", "Y3 PTSD+MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y3_DG.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_DG_v1, Y3_PTSD_MDD_DG_v1, "Y1Y2 PTSD+MDD DG with APC3", "Y3 PTSD+MDD DG with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_Y3_DG_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_DG_v2, Y3_PTSD_MDD_DG_v2, "Y3 PTSD+MDD DG witout APC3", "Y3 PTSD+MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_Y3_DG_without.pdf")


Y1Y2_PTSD_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")
Y1Y2_PTSD_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")
Y3_PTSD_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")
Y3_PTSD_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_MDD_mPFC_v1, Y1Y2_PTSD_MDD_mPFC_v2, "Y1Y2 PTSD+MDD mPFC with APC3", "Y1Y2 PTSD+MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_mPFC.pdf")
plot_heatmap_multi(Y3_PTSD_MDD_mPFC_v1, Y3_PTSD_MDD_mPFC_v2, "Y3 PTSD+MDD mPFC with APC3", "Y3 PTSD+MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y3_mPFC.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_mPFC_v1, Y3_PTSD_MDD_mPFC_v1, "Y1Y2 PTSD+MDD mPFC with APC3", "Y3 PTSD+MDD mPFC with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_Y3_mPFC_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_mPFC_v2, Y3_PTSD_MDD_mPFC_v2, "Y3 PTSD+MDD mPFC witout APC3", "Y3 PTSD+MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_MDD/Y1Y2_Y3_mPFC_without.pdf")

#############################
# PTSD vs MDD
Y1Y2_PTSD_vs_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
Y1Y2_PTSD_vs_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
Y3_PTSD_vs_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
Y3_PTSD_vs_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_CentralAmyg_v1, Y1Y2_PTSD_vs_MDD_CentralAmyg_v2, "Y1Y2 PTSD vs MDD Central Amygdala with APC3", "Y1Y2 PTSD vs MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_CA.pdf")
plot_heatmap_multi(Y3_PTSD_vs_MDD_CentralAmyg_v1, Y3_PTSD_vs_MDD_CentralAmyg_v2, "Y3 PTSD vs MDD Central Amygdala with APC3", "Y3 PTSD vs MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y3_CA.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_CentralAmyg_v1, Y3_PTSD_vs_MDD_CentralAmyg_v1, "Y1Y2 PTSD vs MDD Central Amygdala with APC3", "Y3 PTSD vs MDD Central Amygdala with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_Y3_CA_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_CentralAmyg_v2, Y3_PTSD_vs_MDD_CentralAmyg_v2, "Y3 PTSD vs MDD Central Amygdala witout APC3", "Y3 PTSD vs MDD Central Amygdala without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_Y3_CA_without.pdf")


Y1Y2_PTSD_vs_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")
Y1Y2_PTSD_vs_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")
Y3_PTSD_vs_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")
Y3_PTSD_vs_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_DG_v1, Y1Y2_PTSD_vs_MDD_DG_v2, "Y1Y2 PTSD vs MDD DG with APC3", "Y1Y2 PTSD vs MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_DG.pdf")
plot_heatmap_multi(Y3_PTSD_vs_MDD_DG_v1, Y3_PTSD_vs_MDD_DG_v2, "Y3 PTSD vs MDD DG with APC3", "Y3 PTSD vs MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y3_DG.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_DG_v1, Y3_PTSD_vs_MDD_DG_v1, "Y1Y2 PTSD vs MDD DG with APC3", "Y3 PTSD vs MDD DG with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_Y3_DG_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_DG_v2, Y3_PTSD_vs_MDD_DG_v2, "Y3 PTSD vs MDD DG witout APC3", "Y3 PTSD vs MDD DG without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_Y3_DG_without.pdf")


Y1Y2_PTSD_vs_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")
Y1Y2_PTSD_vs_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")
Y3_PTSD_vs_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")
Y3_PTSD_vs_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/Limma_Results/Proteins/FinalizedCovs_NoAPC3/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_mPFC_v1, Y1Y2_PTSD_vs_MDD_mPFC_v2, "Y1Y2 PTSD vs MDD mPFC with APC3", "Y1Y2 PTSD vs MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_mPFC.pdf")
plot_heatmap_multi(Y3_PTSD_vs_MDD_mPFC_v1, Y3_PTSD_vs_MDD_mPFC_v2, "Y3 PTSD vs MDD mPFC with APC3", "Y3 PTSD vs MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y3_mPFC.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_mPFC_v1, Y3_PTSD_vs_MDD_mPFC_v1, "Y1Y2 PTSD vs MDD mPFC with APC3", "Y3 PTSD vs MDD mPFC with APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_Y3_mPFC_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_mPFC_v2, Y3_PTSD_vs_MDD_mPFC_v2, "Y3 PTSD vs MDD mPFC witout APC3", "Y3 PTSD vs MDD mPFC without APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/Protein/With_vs_Without_APC3/PTSD_vs_MDD/Y1Y2_Y3_mPFC_without.pdf")


