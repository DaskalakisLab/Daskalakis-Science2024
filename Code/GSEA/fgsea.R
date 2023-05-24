################ GSEA pipeline ################ 
#Load packages
library(fgsea)
library(ggplot2)
library(msigdbr)
library(dplyr)
library(tibble)
library(DOSE)

run_fgsea <- function(limma_file, dx,region, out){
  
  if(!dir.exists(paste0(out,"/",region))){
    dir.create(paste0(out,"/",region), recursive = T)
  }
  limma_res <- readRDS(limma_file)
  limma_top10 <- limma_res[order(limma_res$P.Value),]
  limma_top10 <- limma_top10[1:10,]
  limma_breakdown <- data.frame(n_genes=nrow(limma_res),
                                n_nominal=nrow(limma_res[(limma_res$P.Value < 0.05) & (limma_res$adj.P.Val > 0.05),]),
                                n_fdr=nrow(limma_res[(limma_res$adj.P.Val < 0.05),]))
  write.csv(limma_breakdown, paste0(out, "/", region, "/", "Limma_Breakdown_", dx, "_", region, ".csv"), quote=F, row.names = F)
  write.csv(limma_top10, paste0(out, "/", region, "/", "Limma_top_10_genes_", dx, "_", region, ".csv"), quote=F, row.names = F)

  
  #Locate pathway libraries
  # # on Eris (mouse)
  # m5 <- gmtPathways('/data/humgen/daskalakislab/aiatrou/ClaraMouse/DGE/Nebula/m5.go.bp.v2022.1.Mm.symbols.gmt') #GOBP
  # m2 <- gmtPathways('/data/humgen/daskalakislab/aiatrou/ClaraMouse/DGE/Nebula/m2.cp.reactome.v2022.1.Mm.symbols.gmt') #Reactome
  # # or Fetch them online (human)
  # ##https://data.broadinstitute.org/gsea-msigdb/msigdb/release/2022.1.Hs/
  # # or call them with this function
  # pathways <- msigdbr(species = "Homo sapiens", category = "C2", subcategory = "CP:REACTOME") #change the cat and subcat based on what you need
  #more info can be found here: https://www.gsea-msigdb.org/gsea/msigdb/
  pathways <- msigdbr(species = "Homo sapiens") #ALL PATHWAYS
  #if you pick the later you have to transform them
  fgsea_sets<- pathways %>% split(x = .$gene_symbol, f = .$gs_name)
  
  
  #prepare the dataset for gsea
  gsea_input<- limma_res %>%
    arrange(dplyr::desc(logFC)) %>% 
    dplyr::select(symbol, logFC)
  
  ranks<- deframe(gsea_input)
  
  #Run GSEA with 
  fgseaRes<- fgseaMultilevel(fgsea_sets, stats = ranks, 
                             minSize=15, maxSize = 500,
                             eps = 0) #if you want only the enriched pathways add scoreType = "pos" and for just the depleted add scoreType = "neg"
  
  #Check the top up and downregulated pathways
  # topPathwaysUp <- fgseaRes[ES > 0][head(order(pval), n=20), pathway]
  # topPathwaysDown <- fgseaRes[ES < 0][head(order(pval), n=20), pathway]
  
  #Prepare data to plot
  fgseaResTidy <- fgseaRes %>%
    as_tibble() %>%
    arrange(dplyr::desc(NES))
  
  fgseaResTidier <- fgseaResTidy %>% 
    dplyr::select(-leadingEdge, -ES, -log2err) %>% 
    arrange(padj)
  
  write.csv(fgseaResTidier, paste0(out, "/", region, "/", "GSEA_out_", dx, "_", region, ".csv"))
  
  #Lollipop
  x <- fgseaResTidy$pathway
  fgseaResTidy$Pathways <- gsub("_+",' ', x)
  # df <- df %>%
  #   mutate(Pathways = str_remove_all(Pathways, "REACTOME"))
  df <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    head(n= 20)
  
  df_GOBP <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    filter(grepl('GOBP', Pathways)) %>% 
    head(n= 20)
  
  df_R <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    filter(grepl('REACTOME', Pathways)) %>% 
    head(n= 20)
  
  p <- ggplot(df, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="ALL GSEA pathways")
  
  g <- ggplot(df_GOBP, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="GOBP GSEA pathways")
  
  r <- ggplot(df_R, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="REACTOME GSEA pathways")
  
  
  #Plot results as bars
  # p <- ggplot(fgseaResTidy %>% filter(padj < 0.05) %>% head(n= 20), aes(reorder(pathway, NES), NES)) +
  #   geom_col(aes(fill= NES < 2)) +
  #   coord_flip() +
  #   labs(x="Pathway", y="Normalized Enrichment Score",
  #        title="Top GSEA pathways") + 
  #   theme_minimal()
  
  #save results as csv
  saveRDS(fgseaResTidier, paste0(out, "/", region, "/", "GSEA_tidier_", dx, "_", region, ".RDS")) 
  saveRDS(fgseaResTidy, paste0(out, "/", region, "/", "GSEA_tidy_", dx, "_", region, ".RDS")) 
  ggsave(filename = paste0(out, "/", region, "/", "GSEA_plot_ALL_", dx, "_", region, ".pdf"),
         plot = p,
         device = "pdf",
         width = 20,
         height = 8)
  ggsave(filename = paste0(out, "/", region, "/", "GSEA_plot_GO_", dx, "_", region, ".pdf"),
         plot = g,
         device = "pdf",
         width = 20,
         height = 8)
  ggsave(filename = paste0(out, "/", region, "/", "GSEA_plot_Reactome_", dx, "_", region, ".pdf"),
         plot = r,
         device = "pdf",
         width = 20,
         height = 8)
  
  
}

run_fgsea_meta <- function(limma_file, dx,region, out){
  
  if(!dir.exists(paste0(out,"/",region))){
    dir.create(paste0(out,"/",region), recursive = T)
  }
  limma_res <- readRDS(limma_file)
  limma_top10 <- limma_res[order(limma_res$pval),]
  limma_top10 <- limma_top10[1:10,]
  limma_breakdown <- data.frame(n_genes=nrow(limma_res),
                                n_nominal=nrow(limma_res[(limma_res$pval < 0.05) & (limma_res$FDR > 0.05),]),
                                n_fdr=nrow(limma_res[(limma_res$pval < 0.05),]))
  write.csv(limma_breakdown, paste0(out, "/", region, "/", "Limma_Breakdown_", dx, "_", region, ".csv"), quote=F, row.names = F)
  write.csv(limma_top10, paste0(out, "/", region, "/", "Limma_top_10_genes_", dx, "_", region, ".csv"), quote=F, row.names = F)
  
  
  #Locate pathway libraries
  # # on Eris (mouse)
  # m5 <- gmtPathways('/data/humgen/daskalakislab/aiatrou/ClaraMouse/DGE/Nebula/m5.go.bp.v2022.1.Mm.symbols.gmt') #GOBP
  # m2 <- gmtPathways('/data/humgen/daskalakislab/aiatrou/ClaraMouse/DGE/Nebula/m2.cp.reactome.v2022.1.Mm.symbols.gmt') #Reactome
  # # or Fetch them online (human)
  # ##https://data.broadinstitute.org/gsea-msigdb/msigdb/release/2022.1.Hs/
  # # or call them with this function
  # pathways <- msigdbr(species = "Homo sapiens", category = "C2", subcategory = "CP:REACTOME") #change the cat and subcat based on what you need
  #more info can be found here: https://www.gsea-msigdb.org/gsea/msigdb/
  pathways <- msigdbr(species = "Homo sapiens") #ALL PATHWAYS
  #if you pick the later you have to transform them
  fgsea_sets<- pathways %>% split(x = .$gene_symbol, f = .$gs_name)
  
  #prepare the dataset for gsea
  # gsea_input<- limma_res %>%
  #   arrange(dplyr::desc(beta)) %>% 
  #   dplyr::select(symbol, beta)
  gsea_input<- limma_res %>%
    mutate(ranker = sign(beta) * -log(pval, base = 10)) %>%
    arrange(dplyr::desc(ranker)) %>%
    dplyr::select(symbol, ranker)
  
  ranks<- deframe(gsea_input)
  
  #Run GSEA with 
  fgseaRes<- fgseaMultilevel(fgsea_sets, stats = ranks, 
                             minSize=15, maxSize = 500,
                             eps = 0) #if you want only the enriched pathways add scoreType = "pos" and for just the depleted add scoreType = "neg"
  
  #Check the top up and downregulated pathways
  # topPathwaysUp <- fgseaRes[ES > 0][head(order(pval), n=20), pathway]
  # topPathwaysDown <- fgseaRes[ES < 0][head(order(pval), n=20), pathway]
  
  #Prepare data to plot
  fgseaResTidy <- fgseaRes %>%
    as_tibble() %>%
    arrange(dplyr::desc(NES))
  
  fgseaResTidier <- fgseaResTidy %>% 
    dplyr::select(-leadingEdge, -ES, -log2err) %>% 
    arrange(padj)
  
  write.csv(fgseaResTidier, paste0(out, "/", region, "/", "GSEA_out_", dx, "_", region, ".csv"))
  
  #Lollipop
  x <- fgseaResTidy$pathway
  fgseaResTidy$Pathways <- gsub("_+",' ', x)
  # df <- df %>%
  #   mutate(Pathways = str_remove_all(Pathways, "REACTOME"))
  df <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    head(n= 20)
  
  df_GOBP <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    filter(grepl('GOBP', Pathways)) %>% 
    head(n= 20)
  
  df_R <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    filter(grepl('REACTOME', Pathways)) %>% 
    head(n= 20)
  
  p <- ggplot(df, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="ALL GSEA pathways")
  
  g <- ggplot(df_GOBP, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="GOBP GSEA pathways")
  
  r <- ggplot(df_R, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="REACTOME GSEA pathways")
  
  
  #Plot results as bars
  # p <- ggplot(fgseaResTidy %>% filter(padj < 0.05) %>% head(n= 20), aes(reorder(pathway, NES), NES)) +
  #   geom_col(aes(fill= NES < 2)) +
  #   coord_flip() +
  #   labs(x="Pathway", y="Normalized Enrichment Score",
  #        title="Top GSEA pathways") + 
  #   theme_minimal()
  
  #save results as csv
  saveRDS(fgseaResTidier, paste0(out, "/", region, "/", "GSEA_tidier_", dx, "_", region, ".RDS")) 
  saveRDS(fgseaResTidy, paste0(out, "/", region, "/", "GSEA_tidy_", dx, "_", region, ".RDS")) 
  ggsave(filename = paste0(out, "/", region, "/", "GSEA_plot_ALL_", dx, "_", region, ".pdf"),
         plot = p,
         device = "pdf",
         width = 20,
         height = 8)
  ggsave(filename = paste0(out, "/", region, "/", "GSEA_plot_GO_", dx, "_", region, ".pdf"),
         plot = g,
         device = "pdf",
         width = 20,
         height = 8)
  ggsave(filename = paste0(out, "/", region, "/", "GSEA_plot_Reactome_", dx, "_", region, ".pdf"),
         plot = r,
         device = "pdf",
         width = 20,
         height = 8)
  
  
}

run_fgsea_meta_reactome <- function(limma_file, dx,region, out){
  
  limma_res <- readRDS(limma_file)

  pathways <- msigdbr(species = "Homo sapiens", category = "C2", subcategory =  "CP:REACTOME"  ) #Only REACTOME
  fgsea_sets<- pathways %>% split(x = .$gene_symbol, f = .$gs_name)
  
  gsea_input<- limma_res %>%
    mutate(ranker = sign(beta) * -log(pval, base = 10)) %>%
    arrange(dplyr::desc(ranker)) %>%
    dplyr::select(symbol, ranker)
  
  ranks<- deframe(gsea_input)
  
  #Run GSEA with 
  fgseaRes<- fgseaMultilevel(fgsea_sets, stats = ranks, 
                             minSize=15, maxSize = 500,
                             eps = 0) #if you want only the enriched pathways add scoreType = "pos" and for just the depleted add scoreType = "neg"
  

  #Prepare data to plot
  fgseaResTidy <- fgseaRes %>%
    as_tibble() %>%
    arrange(dplyr::desc(NES))
  
  fgseaResTidier <- fgseaResTidy %>% 
    dplyr::select(-leadingEdge, -ES, -log2err) %>% 
    arrange(padj)
  
  write.csv(fgseaResTidier, paste0(out, "/", region, "/", "REACTOME_GSEA_out_", dx, "_", region, ".csv"))
  
  #Lollipop
  x <- fgseaResTidy$pathway
  fgseaResTidy$Pathways <- gsub("_+",' ', x)
  # df <- df %>%
  #   mutate(Pathways = str_remove_all(Pathways, "REACTOME"))
  df <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    head(n= 20)

  r <- ggplot(df, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="REACTOME GSEA pathways")
  
  
  #Plot results as bars
  # p <- ggplot(fgseaResTidy %>% filter(padj < 0.05) %>% head(n= 20), aes(reorder(pathway, NES), NES)) +
  #   geom_col(aes(fill= NES < 2)) +
  #   coord_flip() +
  #   labs(x="Pathway", y="Normalized Enrichment Score",
  #        title="Top GSEA pathways") + 
  #   theme_minimal()
  
  #save results as csv
  saveRDS(fgseaResTidier, paste0(out, "/", region, "/", "REACTOME_GSEA_tidier_", dx, "_", region, ".RDS")) 
  saveRDS(fgseaResTidy, paste0(out, "/", region, "/", "REACTOME_GSEA_tidy_", dx, "_", region, ".RDS")) 

  ggsave(filename = paste0(out, "/", region, "/", "REACTOME_GSEA_plot_", dx, "_", region, ".pdf"),
         plot = r,
         device = "pdf",
         width = 16,
         height = 8)
  
  
}

run_fgsea_meta_celltype <- function(limma_file, dx,region, out){
  
  limma_res <- readRDS(limma_file)
  
  pathways <- msigdbr(species = "Homo sapiens", category = "C8") 
  fgsea_sets<- pathways %>% split(x = .$gene_symbol, f = .$gs_name)
  
  gsea_input<- limma_res %>%
    mutate(ranker = sign(beta) * -log(pval, base = 10)) %>%
    arrange(dplyr::desc(ranker)) %>%
    dplyr::select(symbol, ranker)
  
  ranks<- deframe(gsea_input)
  
  #Run GSEA with 
  fgseaRes<- fgseaMultilevel(fgsea_sets, stats = ranks, 
                             minSize=15, maxSize = 500,
                             eps = 0) #if you want only the enriched pathways add scoreType = "pos" and for just the depleted add scoreType = "neg"
  
  
  #Prepare data to plot
  fgseaResTidy <- fgseaRes %>%
    as_tibble() %>%
    arrange(dplyr::desc(NES))
  
  fgseaResTidier <- fgseaResTidy %>% 
    dplyr::select(-leadingEdge, -ES, -log2err) %>% 
    arrange(padj)
  
  write.csv(fgseaResTidier, paste0(out, "/", region, "/", "CT__GSEA_out_", dx, "_", region, ".csv"))
  
  #Lollipop
  x <- fgseaResTidy$pathway
  fgseaResTidy$Pathways <- gsub("_+",' ', x)
  # df <- df %>%
  #   mutate(Pathways = str_remove_all(Pathways, "CT_"))
  df <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    head(n= 20)
  
  r <- ggplot(df, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="CT_ GSEA pathways")
  
  
  #Plot results as bars
  # p <- ggplot(fgseaResTidy %>% filter(padj < 0.05) %>% head(n= 20), aes(reorder(pathway, NES), NES)) +
  #   geom_col(aes(fill= NES < 2)) +
  #   coord_flip() +
  #   labs(x="Pathway", y="Normalized Enrichment Score",
  #        title="Top GSEA pathways") + 
  #   theme_minimal()
  
  #save results as csv
  saveRDS(fgseaResTidier, paste0(out, "/", region, "/", "CT__GSEA_tidier_", dx, "_", region, ".RDS")) 
  saveRDS(fgseaResTidy, paste0(out, "/", region, "/", "CT__GSEA_tidy_", dx, "_", region, ".RDS")) 
  
  ggsave(filename = paste0(out, "/", region, "/", "CT__GSEA_plot_", dx, "_", region, ".pdf"),
         plot = r,
         device = "pdf",
         width = 16,
         height = 8)
  
  
}


run_fgsea_meta_tf <- function(limma_file, dx,region, out){
  
  limma_res <- readRDS(limma_file)
  
  pathways <- msigdbr(species = "Homo sapiens", category = "C3", subcategory = "TFT:GTRD" ) 
  fgsea_sets<- pathways %>% split(x = .$gene_symbol, f = .$gs_name)
  
  gsea_input<- limma_res %>%
    mutate(ranker = sign(beta) * -log(pval, base = 10)) %>%
    arrange(dplyr::desc(ranker)) %>%
    dplyr::select(symbol, ranker)
  
  ranks<- deframe(gsea_input)
  
  #Run GSEA with 
  fgseaRes<- fgseaMultilevel(fgsea_sets, stats = ranks, 
                             minSize=15, maxSize = 500,
                             eps = 0) #if you want only the enriched pathways add scoreType = "pos" and for just the depleted add scoreType = "neg"
  
  
  #Prepare data to plot
  fgseaResTidy <- fgseaRes %>%
    as_tibble() %>%
    arrange(dplyr::desc(NES))
  
  fgseaResTidier <- fgseaResTidy %>% 
    dplyr::select(-leadingEdge, -ES, -log2err) %>% 
    arrange(padj)
  
  write.csv(fgseaResTidier, paste0(out, "/", region, "/", "TF_GSEA_out_", dx, "_", region, ".csv"))
  
  #Lollipop
  x <- fgseaResTidy$pathway
  fgseaResTidy$Pathways <- gsub("_+",' ', x)
  # df <- df %>%
  #   mutate(Pathways = str_remove_all(Pathways, "TF"))
  df <- fgseaResTidy %>% 
    filter(padj < 0.05) %>% 
    head(n= 20)
  
  r <- ggplot(df, aes(reorder(Pathways, -NES*padj), NES)) +
    geom_segment(aes(yend=0, xend = Pathways)) +
    geom_point(aes(color=padj, size = size)) +
    scale_color_gradientn(colours=c("#f7ca64", "#46bac2",
                                             "#7e62a3"),
                                             trans = "log10",
                          guide=guide_colorbar(reverse=TRUE,
                                               order=1)) +
    scale_size_continuous(range=c(1, 8)) +
    coord_flip() +
    theme_dose(8) +
    labs(x="Pathways", y="Normalized Enrichment Score",
         title="TF GSEA pathways")
  
  
  #Plot results as bars
  # p <- ggplot(fgseaResTidy %>% filter(padj < 0.05) %>% head(n= 20), aes(reorder(pathway, NES), NES)) +
  #   geom_col(aes(fill= NES < 2)) +
  #   coord_flip() +
  #   labs(x="Pathway", y="Normalized Enrichment Score",
  #        title="Top GSEA pathways") + 
  #   theme_minimal()
  
  #save results as csv
  saveRDS(fgseaResTidier, paste0(out, "/", region, "/", "TF_GSEA_tidier_", dx, "_", region, ".RDS")) 
  saveRDS(fgseaResTidy, paste0(out, "/", region, "/", "TF_GSEA_tidy_", dx, "_", region, ".RDS")) 
  
  ggsave(filename = paste0(out, "/", region, "/", "TF_GSEA_plot_", dx, "_", region, ".pdf"),
         plot = r,
         device = "pdf",
         width = 16,
         height = 8)
  
  
}


