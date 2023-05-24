library(cli)
library(WGCNA)
library(dplyr)
library(limma)
preservation <- function(data1, data2, region, out_dir){
  load(paste0(out_dir,"/moduleColors.RData"))

pheno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
pheno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
pheno <- plyr::rbind.fill(pheno12,pheno3)

E <- data1[, match(pheno$SampleID, colnames(data1))]
E <- E[,colnames(E)[!(is.na(colnames(E)))]]

# Filter data to Control subjects from the region of interest
pheno_ctrl <- pheno %>%
  filter(Brain_Region==region, Dx == "Control", !(is.na(SampleID)))
E_ctrl <- E[, match(pheno_ctrl$SampleID, colnames(E))]
E_ctrl <- E_ctrl[,colnames(E_ctrl)[!(is.na(colnames(E_ctrl)))]]
datExpr_ctrl_T <- t(E_ctrl)
RNAMap <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GeneMappings/RNAGeneMap.RDS")
colnames(datExpr_ctrl_T) <- RNAMap$symbol[match(colnames(datExpr_ctrl_T), RNAMap$genes) ] 

#####
E <- data2[, match(pheno$BrNum, colnames(data2))]
E <- E[,colnames(E)[!(is.na(colnames(E)))]]

# Filter data to Control subjects from the region of interest
pheno_ctrl <- pheno %>%
  filter(Brain_Region==region, Dx == "Control", !(is.na(BrNum)))
E_ctrl <- E[, match(pheno_ctrl$BrNum, colnames(E))]
E_ctrl <- E_ctrl[,colnames(E_ctrl)[!(is.na(colnames(E_ctrl)))]]
datExpr_ctrl_P <- t(E_ctrl)
ProteinMap <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GeneMappings/ProteinMap.RDS")
colnames(datExpr_ctrl_P) <- ProteinMap$symbol[match(colnames(datExpr_ctrl_P), ProteinMap$protein) ] 


####

setLabels = c("Transcriptome", "Proteome");
multiExpr = list(Transcriptome = list(data = datExpr_ctrl_T),
                 Proteome = list(data = datExpr_ctrl_P));
multiColor = list(Proteome = moduleColors)


####T+P####

mp = modulePreservation(multiExpr, multiColor,networkType = "signed",
                            referenceNetworks = 2,
                            testNetworks = 1,
                            nPermutations = 1000,
                            randomSeed = 1234,
                            quickCor = 0,
                            verbose = 1,
                            parallelCalculation = T)

# Save the results
save(mp, file = paste0(out_dir, "/modulePreservation_prot.RData"))

ref = 1
test = 1
statsObs = cbind(mp$quality$observed[[ref]][[test]][, -1], mp$preservation$observed[[ref]][[test]][, -1])
statsZ = cbind(mp$quality$Z[[ref]][[test]][, -1], mp$preservation$Z[[ref]][[test]][, -1]);

print( cbind(statsObs[, c("medianRank.pres", "medianRank.qual")],
             signif(statsZ[, c("Zsummary.pres", "Zsummary.qual")], 2)) )

write.csv(cbind(statsObs[, c("medianRank.pres", "medianRank.qual")],
                signif(statsZ[, c("Zsummary.pres", "Zsummary.qual")], 2)), paste0(out_dir, "/PreservationSummary_prot.csv"))


# Module labels and module sizes are also contained in the results
modColors = rownames(mp$preservation$observed[[ref]][[test]])
moduleSizes = mp$preservation$Z[[ref]][[test]][, 1];
# leave grey and gold modules out
plotMods = !(modColors %in% c("grey", "gold"));
# Text labels for points
text = modColors[plotMods];
# Auxiliary convenience variable
plotData = cbind(mp$preservation$observed[[ref]][[test]][, 2], mp$preservation$Z[[ref]][[test]][, 2])
# Main titles for the plot
mains = c("Preservation Median Rank", "Preservation Zsummary");

pdf(file = paste0(out_dir, "/Preservation_prot.pdf"), width = 8, height = 8)
for (p in 1:2)
{
  min = min(plotData[, p], na.rm = TRUE);
  max = max(plotData[, p], na.rm = TRUE);
  # Adjust ploting ranges appropriately
  if (p==2)
  {
    if (min > -max/10) min = -max/10
    ylim = c(min - 0.1 * (max-min), max + 0.1 * (max-min))
  } else
    #ylim = c(max + 0.1 * (max-min), min - 0.1 * (max-min))
    ylim = c(min - 0.1 * (max-min), max + 0.1 * (max-min))
  plot(moduleSizes[plotMods], plotData[plotMods, p], col = 1, bg = modColors[plotMods], pch = 21,
       main = mains[p],
       cex = 3,
       ylab = mains[p], xlab = "Module size", log = "x",
       ylim = ylim,
       xlim = c(10, 1500), cex.lab = 1.2, cex.axis = 1.2, cex.main =1.5)
  labelPoints(moduleSizes[plotMods], plotData[plotMods, p], text, cex = 1, offs = 0.1);
  # For Zsummary, add threshold lines
  if (p==2)
  {
    abline(h=0)
    abline(h=10, col = "darkgreen", lty = 2)
  }
}

dev.off() 
}

# data_T_CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/CentralAmyg/Expression_Y123_residuals.RDS")
# data_P_CentralAmyg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/Protein/Proteins/CentralAmyg/Expression_Y123_residuals.RDS")
# 
# preservation(data1 = data_T_CentralAmyg,
#              data2 = data_P_CentralAmyg,
#              region = "CentralAmyg", 
#              out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/CentralAmyg/")

##########
data_T_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/DG/Expression_Y123_residuals.RDS")
data_P_DG <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/Protein/Proteins/DG/Expression_Y123_residuals.RDS")

preservation(data1 = data_T_DG,
             data2 = data_P_DG,
             region = "DG", 
             out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/DG/")

##########
data_T_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/RNA/Genes/mPFC/Expression_Y123_residuals.RDS")
data_P_mPFC <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/CleanData/Protein/Proteins/mPFC/Expression_Y123_residuals.RDS")

preservation(data1 = data_T_mPFC,
             data2 = data_P_mPFC,
             region = "mPFC", 
             out_dir = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Protein/mPFC/")





