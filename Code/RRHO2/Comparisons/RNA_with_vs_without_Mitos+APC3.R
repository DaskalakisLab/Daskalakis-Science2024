source("/data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenericFunctions/RRHO2.R")

# PTSD
Y1Y2_PTSD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
Y1Y2_PTSD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
Y3_PTSD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")
Y3_PTSD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD/results_PTSD_CentralAmyg_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_CentralAmyg_v1, Y1Y2_PTSD_CentralAmyg_v2, "Y1Y2 PTSD Central Amygdala with Mitos+APC3", "Y1Y2 PTSD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y1Y2_CA.pdf")
plot_heatmap_multi(Y3_PTSD_CentralAmyg_v1, Y3_PTSD_CentralAmyg_v2, "Y3 PTSD Central Amygdala with Mitos+APC3", "Y3 PTSD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y3_CA.pdf")
plot_heatmap_multi(Y1Y2_PTSD_CentralAmyg_v1, Y3_PTSD_CentralAmyg_v1, "Y1Y2 PTSD Central Amygdala with Mitos+APC3", "Y3 PTSD Central Amygdala with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y1Y2_Y3_CA_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_CentralAmyg_v2, Y3_PTSD_CentralAmyg_v2, "Y1Y2 PTSD Central Amygdala without Mitos+APC3", "Y3 PTSD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaTests/RNA_no_Mito_APC/Y1Y2_Y3_CA_without.pdf")


Y1Y2_PTSD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
Y1Y2_PTSD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD/results_PTSD_DG_PTSD.RDS")
Y3_PTSD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD/results_PTSD_DG_PTSD.RDS")
Y3_PTSD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD/results_PTSD_DG_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_DG_v1, Y1Y2_PTSD_DG_v2, "Y1Y2 PTSD DG with Mitos+APC3", "Y1Y2 PTSD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y1Y2_DG.pdf")
plot_heatmap_multi(Y3_PTSD_DG_v1, Y3_PTSD_DG_v2, "Y3 PTSD DG with Mitos+APC3", "Y3 PTSD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y3_DG.pdf")
plot_heatmap_multi(Y1Y2_PTSD_DG_v1, Y3_PTSD_DG_v1, "Y1Y2 PTSD DG with Mitos+APC3", "Y3 PTSD DG with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y1Y2_Y3_DG_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_DG_v2, Y3_PTSD_DG_v2, "Y1Y2 PTSD DG without Mitos+APC3", "Y3 PTSD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaTests/RNA_no_Mito_APC/Y1Y2_Y3_DG_without.pdf")


Y1Y2_PTSD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
Y1Y2_PTSD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD/results_PTSD_mPFC_PTSD.RDS")
Y3_PTSD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")
Y3_PTSD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD/results_PTSD_mPFC_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_mPFC_v1, Y1Y2_PTSD_mPFC_v2, "Y1Y2 PTSD mPFC with Mitos+APC3", "Y1Y2 PTSD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y1Y2_mPFC.pdf")
plot_heatmap_multi(Y3_PTSD_mPFC_v1, Y3_PTSD_mPFC_v2, "Y3 PTSD mPFC with Mitos+APC3", "Y3 PTSD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y3_mPFC.pdf")
plot_heatmap_multi(Y1Y2_PTSD_mPFC_v1, Y3_PTSD_mPFC_v1, "Y1Y2 PTSD mPFC with Mitos+APC3", "Y3 PTSD mPFC with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD/Y1Y2_Y3_mPFC_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_mPFC_v2, Y3_PTSD_mPFC_v2, "Y1Y2 PTSD mPFC without Mitos+APC3", "Y3 PTSD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaTests/RNA_no_Mito_APC/Y1Y2_Y3_mPFC_without.pdf")




#############################
# MDD
Y1Y2_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
Y1Y2_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/MDD/results_MDD_CentralAmyg_MDD.RDS")
Y3_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")
Y3_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/MDD/results_MDD_CentralAmyg_MDD.RDS")

plot_heatmap_multi(Y1Y2_MDD_CentralAmyg_v1, Y1Y2_MDD_CentralAmyg_v2, "Y1Y2 MDD Central Amygdala with Mitos+APC3", "Y1Y2 MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y1Y2_CA.pdf")
plot_heatmap_multi(Y3_MDD_CentralAmyg_v1, Y3_MDD_CentralAmyg_v2, "Y3 MDD Central Amygdala with Mitos+APC3", "Y3 MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y3_CA.pdf")
plot_heatmap_multi(Y1Y2_MDD_CentralAmyg_v1, Y3_MDD_CentralAmyg_v1, "Y1Y2 MDD Central Amygdala with Mitos+APC3", "Y3 MDD Central Amygdala with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y1Y2_Y3_CA_with.pdf")
plot_heatmap_multi(Y1Y2_MDD_CentralAmyg_v2, Y3_MDD_CentralAmyg_v2, "Y1Y2 MDD Central Amygdala without Mitos+APC3", "Y3 MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaTests/RNA_no_Mito_APC/Y1Y2_Y3_CA_without.pdf")


Y1Y2_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
Y1Y2_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/MDD/results_MDD_DG_MDD.RDS")
Y3_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/MDD/results_MDD_DG_MDD.RDS")
Y3_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/MDD/results_MDD_DG_MDD.RDS")

plot_heatmap_multi(Y1Y2_MDD_DG_v1, Y1Y2_MDD_DG_v2, "Y1Y2 MDD DG with Mitos+APC3", "Y1Y2 MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y1Y2_DG.pdf")
plot_heatmap_multi(Y3_MDD_DG_v1, Y3_MDD_DG_v2, "Y3 MDD DG with Mitos+APC3", "Y3 MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y3_DG.pdf")
plot_heatmap_multi(Y1Y2_MDD_DG_v1, Y3_MDD_DG_v1, "Y1Y2 MDD DG with Mitos+APC3", "Y3 MDD DG with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y1Y2_Y3_DG_with.pdf")
plot_heatmap_multi(Y1Y2_MDD_DG_v2, Y3_MDD_DG_v2, "Y1Y2 MDD DG without Mitos+APC3", "Y3 MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaTests/RNA_no_Mito_APC/Y1Y2_Y3_DG_without.pdf")


Y1Y2_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
Y1Y2_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/MDD/results_MDD_mPFC_MDD.RDS")
Y3_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/MDD/results_MDD_mPFC_MDD.RDS")
Y3_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/MDD/results_MDD_mPFC_MDD.RDS")

plot_heatmap_multi(Y1Y2_MDD_mPFC_v1, Y1Y2_MDD_mPFC_v2, "Y1Y2 MDD mPFC with Mitos+APC3", "Y1Y2 MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y1Y2_mPFC.pdf")
plot_heatmap_multi(Y3_MDD_mPFC_v1, Y3_MDD_mPFC_v2, "Y3 MDD mPFC with Mitos+APC3", "Y3 MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y3_mPFC.pdf")
plot_heatmap_multi(Y1Y2_MDD_mPFC_v1, Y3_MDD_mPFC_v1, "Y1Y2 MDD mPFC with Mitos+APC3", "Y3 MDD mPFC with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/MDD/Y1Y2_Y3_mPFC_with.pdf")
plot_heatmap_multi(Y1Y2_MDD_mPFC_v2, Y3_MDD_mPFC_v2, "Y1Y2 MDD mPFC without Mitos+APC3", "Y3 MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaTests/RNA_no_Mito_APC/Y1Y2_Y3_mPFC_without.pdf")


################################
# PTSD + MDD
Y1Y2_PTSD_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
Y1Y2_PTSD_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
Y3_PTSD_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")
Y3_PTSD_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD_MDD/results_PTSD+MDD_CentralAmyg_PTSD_MDD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_MDD_CentralAmyg_v1, Y1Y2_PTSD_MDD_CentralAmyg_v2, "Y1Y2 PTSD+MDD Central Amygdala with Mitos+APC3", "Y1Y2 PTSD+MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_CA.pdf")
plot_heatmap_multi(Y3_PTSD_MDD_CentralAmyg_v1, Y3_PTSD_MDD_CentralAmyg_v2, "Y3 PTSD+MDD Central Amygdala with Mitos+APC3", "Y3 PTSD+MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y3_CA.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_CentralAmyg_v1, Y3_PTSD_MDD_CentralAmyg_v1, "Y1Y2 PTSD+MDD Central Amygdala with Mitos+APC3", "Y3 PTSD+MDD Central Amygdala with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_Y3_CA_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_CentralAmyg_v2, Y3_PTSD_MDD_CentralAmyg_v2, "Y3 PTSD+MDD Central Amygdala without Mitos+APC3", "Y3 PTSD+MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_Y3_CA_without.pdf")


Y1Y2_PTSD_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
Y1Y2_PTSD_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
Y3_PTSD_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")
Y3_PTSD_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD_MDD/results_PTSD+MDD_DG_PTSD_MDD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_MDD_DG_v1, Y1Y2_PTSD_MDD_DG_v2, "Y1Y2 PTSD+MDD DG with Mitos+APC3", "Y1Y2 PTSD+MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_DG.pdf")
plot_heatmap_multi(Y3_PTSD_MDD_DG_v1, Y3_PTSD_MDD_DG_v2, "Y3 PTSD+MDD DG with Mitos+APC3", "Y3 PTSD+MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y3_DG.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_DG_v1, Y3_PTSD_MDD_DG_v1, "Y1Y2 PTSD+MDD DG with Mitos+APC3", "Y3 PTSD+MDD DG with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_Y3_DG_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_DG_v2, Y3_PTSD_MDD_DG_v2, "Y3 PTSD+MDD DG without Mitos+APC3", "Y3 PTSD+MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_Y3_DG_without.pdf")


Y1Y2_PTSD_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")
Y1Y2_PTSD_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")
Y3_PTSD_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")
Y3_PTSD_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD_MDD/results_PTSD+MDD_mPFC_PTSD_MDD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_MDD_mPFC_v1, Y1Y2_PTSD_MDD_mPFC_v2, "Y1Y2 PTSD+MDD mPFC with Mitos+APC3", "Y1Y2 PTSD+MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_mPFC.pdf")
plot_heatmap_multi(Y3_PTSD_MDD_mPFC_v1, Y3_PTSD_MDD_mPFC_v2, "Y3 PTSD+MDD mPFC with Mitos+APC3", "Y3 PTSD+MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y3_mPFC.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_mPFC_v1, Y3_PTSD_MDD_mPFC_v1, "Y1Y2 PTSD+MDD mPFC with Mitos+APC3", "Y3 PTSD+MDD mPFC with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_Y3_mPFC_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_MDD_mPFC_v2, Y3_PTSD_MDD_mPFC_v2, "Y3 PTSD+MDD mPFC without Mitos+APC3", "Y3 PTSD+MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_MDD/Y1Y2_Y3_mPFC_without.pdf")

#############################
# PTSD vs MDD
Y1Y2_PTSD_vs_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
Y1Y2_PTSD_vs_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
Y3_PTSD_vs_MDD_CentralAmyg_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")
Y3_PTSD_vs_MDD_CentralAmyg_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_CentralAmyg_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_CentralAmyg_v1, Y1Y2_PTSD_vs_MDD_CentralAmyg_v2, "Y1Y2 PTSD vs MDD Central Amygdala with Mitos+APC3", "Y1Y2 PTSD vs MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_CA.pdf")
plot_heatmap_multi(Y3_PTSD_vs_MDD_CentralAmyg_v1, Y3_PTSD_vs_MDD_CentralAmyg_v2, "Y3 PTSD vs MDD Central Amygdala with Mitos+APC3", "Y3 PTSD vs MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y3_CA.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_CentralAmyg_v1, Y3_PTSD_vs_MDD_CentralAmyg_v1, "Y1Y2 PTSD vs MDD Central Amygdala with Mitos+APC3", "Y3 PTSD vs MDD Central Amygdala with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_Y3_CA_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_CentralAmyg_v2, Y3_PTSD_vs_MDD_CentralAmyg_v2, "Y3 PTSD vs MDD Central Amygdala without Mitos+APC3", "Y3 PTSD vs MDD Central Amygdala without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_Y3_CA_without.pdf")


Y1Y2_PTSD_vs_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")
Y1Y2_PTSD_vs_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")
Y3_PTSD_vs_MDD_DG_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")
Y3_PTSD_vs_MDD_DG_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_DG_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_DG_v1, Y1Y2_PTSD_vs_MDD_DG_v2, "Y1Y2 PTSD vs MDD DG with Mitos+APC3", "Y1Y2 PTSD vs MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_DG.pdf")
plot_heatmap_multi(Y3_PTSD_vs_MDD_DG_v1, Y3_PTSD_vs_MDD_DG_v2, "Y3 PTSD vs MDD DG with Mitos+APC3", "Y3 PTSD vs MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y3_DG.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_DG_v1, Y3_PTSD_vs_MDD_DG_v1, "Y1Y2 PTSD vs MDD DG with Mitos+APC3", "Y3 PTSD vs MDD DG with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_Y3_DG_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_DG_v2, Y3_PTSD_vs_MDD_DG_v2, "Y3 PTSD vs MDD DG without Mitos+APC3", "Y3 PTSD vs MDD DG without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_Y3_DG_without.pdf")


Y1Y2_PTSD_vs_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")
Y1Y2_PTSD_vs_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y1Y2/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")
Y3_PTSD_vs_MDD_mPFC_v1 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")
Y3_PTSD_vs_MDD_mPFC_v2 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Limma_Results/Genes/FinalizedCovs_NoMitoAPC3/Y3/PTSD_vs_MDD/results_PTSD_vs_MDD_mPFC_PTSD.RDS")

plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_mPFC_v1, Y1Y2_PTSD_vs_MDD_mPFC_v2, "Y1Y2 PTSD vs MDD mPFC with Mitos+APC3", "Y1Y2 PTSD vs MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_mPFC.pdf")
plot_heatmap_multi(Y3_PTSD_vs_MDD_mPFC_v1, Y3_PTSD_vs_MDD_mPFC_v2, "Y3 PTSD vs MDD mPFC with Mitos+APC3", "Y3 PTSD vs MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y3_mPFC.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_mPFC_v1, Y3_PTSD_vs_MDD_mPFC_v1, "Y1Y2 PTSD vs MDD mPFC with Mitos+APC3", "Y3 PTSD vs MDD mPFC with Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_Y3_mPFC_with.pdf")
plot_heatmap_multi(Y1Y2_PTSD_vs_MDD_mPFC_v2, Y3_PTSD_vs_MDD_mPFC_v2, "Y3 PTSD vs MDD mPFC without Mitos+APC3", "Y3 PTSD vs MDD mPFC without Mitos+APC3", "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RRHO2/RNA/With_vs_Without_Mitos+APC3/PTSD_vs_MDD/Y1Y2_Y3_mPFC_without.pdf")


