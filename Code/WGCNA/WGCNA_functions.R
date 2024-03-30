library(WGCNA)
library(dplyr)
library(limma)

options(stringsAsFactors = FALSE)
enableWGCNAThreads()

create_formula <- function(covariates){
  form <- formula(paste0("~", paste(covariates, collapse = "+")))
  return(form)
}

chooseTopHubsInEachModule <- function (datExpr, colorh, omitColors , power, type) 
{
  isIndex = FALSE
  modules = names(table(colorh))
  if (!(is.na(omitColors)[1])) 
    modules = modules[!is.element(modules, omitColors)]
  if (is.null(colnames(datExpr))) {
    colnames(datExpr) = 1:dim(datExpr)[2]
    isIndex = TRUE
  }
  hubgenes_list <- list()
  
  for (i in 1:length(modules)) {
    adj = adjacency(datExpr[, colorh == modules[i]], power = power, 
                    type = type)
    hubs <- head(sort(rowSums(adj), decreasing = T), 10)
    hubgenes_list[[i]] <- names(hubs)
  }
  hubgenes_list <- setNames(hubgenes_list, modules)
  
  return(hubgenes_list)
}

calculate_tophubs <- function(datExpr, moduleColors, power.select){
  tophub <- chooseTopHubsInEachModule(
    datExpr, 
    moduleColors, 
    omitColors = "grey", 
    power = power.select, 
    type = "signed")
  gene_map <- readRDS("/path/to/GeneMappings/RNAGeneMap.RDS")
  for(i in 1:length(tophub)){
    tophub[[i]] <- gene_map$symbol[match(tophub[[i]], gene_map$genes)]
  }
  return(tophub)
}

# WGCNA control
wgcna_control <- function(data, region, out_dir){
  # setwd(out_dir)
  # Read in phenotype file
  pheno <- readRDS("/path/to/Annotation_disc_updatedPCs.RDS")
  pheno <- as.data.frame(pheno)
  
  E <- data[, match(pheno$BrNum, colnames(data))]
  E <- E[,colnames(E)[!(is.na(colnames(E)))]]
  
  pheno <- pheno %>%
    filter(Brain_Region==region, Dx == "Control", !(is.na(BrNum)))
  
  # Subset expression to match pheno
  E_ctrl <- E[, match(pheno$BrNum, colnames(E))]
  E_ctrl <- E_ctrl[,complete.cases(colnames(E_ctrl))]
  
  pheno <- pheno[match(unique(colnames(E_ctrl)), pheno$BrNum),]

  datExpr <- t(E_ctrl)
  
  #check for sample outliers - TO BE DISCUSSED
  sampleTree = hclust(dist(datExpr), method = "average");
  
  pdf(file = paste0(out_dir, "/sampleClustering.pdf"), width = 25, height = 20)
  plot(sampleTree, main = "Sample clustering to detect outliers", sub="", xlab="", cex.lab = 1, 
       cex.axis = 1, cex.main = 1)
  dev.off()
  
  ##add traits
  datTraits <- pheno %>%
    dplyr::select(AgeDeath, Female, ancestryPC1, ancestryPC2, BMI,PMI, RIN, ex, inhib, Oligo, Astro, OPC, Tcell, mitoMapped, BrNum)
  # traitColors = numbers2colors(datTraits, signed = TRUE);
  # pdf(file = paste0(out_dir, "/sampleClustering_wTraits.pdf"), width = 20, height = 25)
  # plotDendroAndColors(sampleTree, traitColors,
  #                     groupLabels = names(datTraits),
  #                     main = "Sample dendrogram and trait heatmap")
  # dev.off()
  
  #Scale free-soft threshold picking
  powers = c(1:30)
  # following takes some time to run
  # sft = pickSoftThreshold(datExpr, powerVector = powers, verbose = 5, RsquaredCut = 0.8, networkType = "signed")
  sft = pickSoftThreshold(datExpr, powerVector = powers, verbose = 5, RsquaredCut = 0.8)

  #plot
  pdf(file = paste0(out_dir,"/SoftThresholdPick.pdf"), width = 10, height = 8)
  plot(sft$fitIndices[,1], -sign(sft$fitIndices[,3])*sft$fitIndices[,2],
       xlab="Soft Threshold (power)",ylab="Scale Free Topology Model Fit,signed R^2",type="n",
       main = paste("Scale independence"));
  text(sft$fitIndices[,1], -sign(sft$fitIndices[,3])*sft$fitIndices[,2],
       labels=powers,cex=0.9,col="red");
  # this line corresponds to using an R^2 cut-off of h
  abline(h=0.8,col="red")
  # Mean connectivity as a function of the soft-thresholding power
  plot(sft$fitIndices[,1], sft$fitIndices[,5],
       xlab="Soft Threshold (power)",ylab="Mean Connectivity", type="n",
       main = paste("Mean connectivity"))
  text(sft$fitIndices[,1], sft$fitIndices[,5], labels=powers, cex=0.9,col="red")
  dev.off()
  
  # power.select = sft[["powerEstimate"]]
  
  if (is.na(sft[["powerEstimate"]])) {
    power.select <- 0
  } else {
    power.select <- sft[["powerEstimate"]]
  }
  
  if(power.select > 15){
    power.select = sft[["fitIndices"]][["Power"]][which.min(abs(sft[["fitIndices"]][["SFT.R.sq"]][1:15] - 0.8))]
    #power.select = 12
  }
  if(power.select < 6){
    power.select = 12
  }
  write.table(power.select, file = paste0(out_dir,"/selected_power.txt"))
  
  
  #Network construction - here i pick signed - TO BE DISCUSSED; takes long
  #if need to increase speed add -- maxBlockSize = 2000 (instead of the default 5000)
  net = blockwiseModules(datExpr, power = power.select, networkType = "signed",
                         TOMType = "signed", minModuleSize = 50,
                         reassignThreshold = 0, mergeCutHeight = 0.1,
                         numericLabels = TRUE, pamRespectsDendro = FALSE,
                         saveTOMs = F,verbose = 3, deepSplit = 3)
  
  # Convert labels to colors for plotting
  mergedColors = labels2colors(net$colors)
  # Plot the dendrogram and the module colors underneath
  pdf(file = paste0(out_dir,"/DendroWCLusters.pdf"), width = 12, height = 10)
  for(i in 1:length(net$dendrograms)){
    plotDendroAndColors(net$dendrograms[[i]], mergedColors[net$blockGenes[[i]]],
                        "Module colors",
                        dendroLabels = FALSE, hang = 0.03,
                        addGuide = TRUE, guideHang = 0.05)
  }
  dev.off()
  
  #save
  moduleLabels = net$colors
  moduleColors = labels2colors(net$colors)
  MEs = net$MEs;
  geneTrees = net$dendrograms;
  save(moduleColors, file = paste0(out_dir,"/moduleColors.RData"))
  MEs0 = moduleEigengenes(datExpr, moduleColors)$eigengenes
  MEs1 = orderMEs(MEs0)
  save(MEs,MEs1, moduleLabels, moduleColors, geneTrees,
       file = paste0(out_dir,"/NetworkConstruction-auto_pwr",power.select,"_control.RData"))
  write.table(MEs1, paste0(out_dir,"/ME_control.csv"))
  
  gene_map <- readRDS("/path/to/GeneMappings/RNAGeneMap.RDS")
  genes2modules <- matrix(NA, ncol = 3, nrow = length(moduleColors))
  genes2modules <- as.data.frame(genes2modules)
  colnames(genes2modules) <- c("Module", "Gene", "Symbol")
  genes2modules$Module <- moduleColors
  genes2modules$Gene <- names(moduleLabels)
  genes2modules$Symbol <- gene_map$symbol[match(genes2modules$Gene, gene_map$genes)]
  write.csv(x = genes2modules, file = paste0(out_dir,"/Gene2Modules.csv"))
  
  nGenes = ncol(datExpr);
  nSamples = nrow(datExpr);
  moduleTraitCor = cor(MEs1, datTraits, use = "p");
  moduleTraitPvalue = corPvalueStudent(moduleTraitCor, nSamples);
  
  textMatrix = paste(signif(moduleTraitCor, 2), "\n(",
                     signif(moduleTraitPvalue, 1), ")", sep = "");
  dim(textMatrix) = dim(moduleTraitCor)
  pdf(file = paste0(out_dir,"/Module_Trait.pdf"), width = 16, height = 20)
  labeledHeatmap(Matrix = moduleTraitCor,
                 xLabels = names(datTraits),
                 yLabels = names(MEs1),
                 ySymbols = names(MEs1),
                 colorLabels = FALSE,
                 colors = blueWhiteRed(50),
                 textMatrix = textMatrix,
                 setStdMargins = FALSE,
                 cex.text = 0.5,
                 zlim = c(-1,1),
                 main = paste("Module-trait relationships"))
  dev.off()
  
  tophub <- calculate_tophubs(datExpr,moduleColors,power.select)
  saveRDS(tophub, paste0(out_dir,"/TopHubs_control.RDS"))
  
  return(power.select)
}


wgcna_ptsd_mdd <- function(data, region, out_dir, power, nc){
  # setwd(out_dir)
  load(paste0(out_dir,"/moduleColors.RData"))
  #Prepare datasets
  pheno <- readRDS("/path/to/Annotation_disc_updatedPCs.RDS")
  pheno <- as.data.frame(pheno)
  
  E <- data[, match(pheno$BrNum, colnames(data))]
  E <- E[,colnames(E)[!(is.na(colnames(E)))]]
  
  # Filter data to MDD subjects from the region of interest
  pheno_mdd <- pheno %>%
    filter(Brain_Region==region, Dx == "MDD", !(is.na(BrNum)))
  
  # Subset expression to match pheno
  E_MDD <- E[, match(pheno_mdd$BrNum, colnames(E))]
  E_MDD <- E_MDD[,colnames(E_MDD)[!(is.na(colnames(E_MDD)))]]
  datExpr_mdd <- t(E_MDD)
  
  pheno_mdd <- pheno_mdd[match(colnames(E_MDD), pheno_mdd$BrNum), ]
  datTraits <- pheno_mdd %>% 
    dplyr::select(AgeDeath, Female, ancestryPC1, ancestryPC2, BMI,PMI, RIN,  ex, inhib, Oligo, Astro, OPC, Tcell, mitoMapped, Suicide012, ChildTrauma012) %>% 
    mutate_if(is.character,as.numeric)
  
  
  MEs0_mdd = moduleEigengenes(datExpr_mdd, moduleColors)$eigengenes
  MEs_mdd = orderMEs(MEs0_mdd)
  write.table(MEs_mdd, paste0(out_dir,"/ME_MDD.csv"))
  
  nGenes = ncol(datExpr_mdd);
  nSamples = nrow(datExpr_mdd);
  moduleTraitCor = cor(MEs_mdd, datTraits, use = "p");
  moduleTraitPvalue = corPvalueStudent(moduleTraitCor, nSamples);
  
  textMatrix = paste(signif(moduleTraitCor, 2), "\n(",
                     signif(moduleTraitPvalue, 1), ")", sep = "");
  dim(textMatrix) = dim(moduleTraitCor)
  pdf(file = paste0(out_dir,"/Module_Trait_mdd.pdf"), width = 20, height = 18)
  labeledHeatmap(Matrix = moduleTraitCor,
                 xLabels = names(datTraits),
                 yLabels = names(MEs_mdd),
                 ySymbols = names(MEs_mdd),
                 colorLabels = FALSE,
                 colors = blueWhiteRed(50),
                 textMatrix = textMatrix,
                 setStdMargins = FALSE,
                 cex.text = 0.5,
                 zlim = c(-1,1),
                 main = paste("Module-trait relationships_MDD"))
  dev.off()
  
  # Filter data to PTSD subjects from the region of interest
  pheno_ptsd <- pheno %>%
    filter(Brain_Region==region, Dx == "PTSD", !(is.na(BrNum)))
  
  # Subset expression to match pheno
  E_PTSD <- E[, match(pheno_ptsd$BrNum, colnames(E))]
  E_PTSD <- E_PTSD[,colnames(E_PTSD)[!(is.na(colnames(E_PTSD)))]]
  datExpr_ptsd <- t(E_PTSD)
  
  pheno_ptsd <- pheno_ptsd[match(colnames(E_PTSD), pheno_ptsd$BrNum), ]
  datTraits <- pheno_ptsd %>% 
    dplyr::select(AgeDeath, Female, ancestryPC1, ancestryPC2, BMI,PMI, RIN,  ex, inhib, Oligo, Astro, OPC, Tcell, mitoMapped, Suicide012, ChildTrauma012) %>% 
    mutate_if(is.character,as.numeric)
  
  
  MEs0_ptsd = moduleEigengenes(datExpr_ptsd, moduleColors)$eigengenes
  MEs_ptsd = orderMEs(MEs0_ptsd)
  write.table(MEs_ptsd, paste0(out_dir,"/ME_PTSD.csv"))
  
  nGenes = ncol(datExpr_ptsd);
  nSamples = nrow(datExpr_ptsd);
  moduleTraitCor = cor(MEs_ptsd, datTraits, use = "p");
  moduleTraitPvalue = corPvalueStudent(moduleTraitCor, nSamples);
  
  textMatrix = paste(signif(moduleTraitCor, 2), "\n(",
                     signif(moduleTraitPvalue, 1), ")", sep = "");
  dim(textMatrix) = dim(moduleTraitCor)
  pdf(file = paste0(out_dir,"/Module_Trait_ptsd.pdf"), width = 20, height = 18)
  labeledHeatmap(Matrix = moduleTraitCor,
                 xLabels = names(datTraits),
                 yLabels = names(MEs_ptsd),
                 ySymbols = names(MEs_ptsd),
                 colorLabels = FALSE,
                 colors = blueWhiteRed(50),
                 textMatrix = textMatrix,
                 setStdMargins = FALSE,
                 cex.text = 0.5,
                 zlim = c(-1,1),
                 main = paste("Module-trait relationships_PTSD"))
  dev.off()
  
  # Filter data to Disease subjects from the region of interest
  pheno_disease <- pheno %>%
    filter(Brain_Region==region, Control == 0, !(is.na(BrNum)))
  
  
  # Subset expression to match pheno
  E_disease <- E[, match(pheno_disease$BrNum, colnames(E))]
  E_disease <- E_disease[,colnames(E_disease)[!(is.na(colnames(E_disease)))]]
  datExpr_disease <- t(E_disease)
  
  pheno_disease <- pheno_disease[match(colnames(E_disease), pheno_disease$BrNum), ]

  datTraits <- pheno_disease %>% 
    dplyr::select(AgeDeath, Female, ancestryPC1, ancestryPC2, BMI,PMI, RIN,  ex, inhib, Oligo, Astro, OPC, Tcell, mitoMapped, Suicide012, ChildTrauma012) %>% 
    mutate_if(is.character,as.numeric)
  
  
  MEs0_disease = moduleEigengenes(datExpr_disease, moduleColors)$eigengenes
  MEs_disease = orderMEs(MEs0_disease)
  write.table(MEs_disease, paste0(out_dir,"/ME_disease.csv"))
  
  nGenes = ncol(datExpr_disease);
  nSamples = nrow(datExpr_disease);
  moduleTraitCor = cor(MEs_disease, datTraits, use = "p");
  moduleTraitPvalue = corPvalueStudent(moduleTraitCor, nSamples);
  
  textMatrix = paste(signif(moduleTraitCor, 2), "\n(",
                     signif(moduleTraitPvalue, 1), ")", sep = "");
  dim(textMatrix) = dim(moduleTraitCor)
  pdf(file = paste0(out_dir,"/Module_Trait_disease.pdf"), width = 20, height = 18)
  labeledHeatmap(Matrix = moduleTraitCor,
                 xLabels = names(datTraits),
                 yLabels = names(MEs_disease),
                 ySymbols = names(MEs_disease),
                 colorLabels = FALSE,
                 colors = blueWhiteRed(50),
                 textMatrix = textMatrix,
                 setStdMargins = FALSE,
                 cex.text = 0.5,
                 zlim = c(-1,1),
                 main = paste("Module-trait relationships_disease"))
  dev.off()
  
}
