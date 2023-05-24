# 
# zscore <- function(P,logFC)
# {
#   p1=apply(cbind(P,10^-320),1,max)
#   z1=qnorm((p1/2),low=F)*sign(logFC)
#   z1
# }
# 
# 
# 
# RNApath <- '/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/Baseline/RNA/'
# metalimma <- paste0(RNApath,list.files(RNApath,pattern = "RDS",recursive = TRUE))
# metalimma <- metalimma[!grepl("PTSD_MDD",metalimma)]
# metalimma <- metalimma[!grepl("PTSD_vs_MDD",metalimma)]
# 
# proteinpath <- '/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Metafor/BetaSD/Baseline/Protein/'
# metalimma <- c(metalimma,
#                paste0(proteinpath,list.files(proteinpath,pattern = "RDS",recursive = TRUE)))
# metalimma <- metalimma[!grepl("PTSD_MDD",metalimma)]
# metalimma <- metalimma[!grepl("PTSD_vs_MDD",metalimma)]
# 
# 
# 
# ukbbResulFile <- "/data/humgen/daskalakislab/jajoo/SciencePaper/UKBBData/ukbppp_mddptsd_assoc_result.all.v1.xlsx"
# 
# sheetName <- excel_sheets("/data/humgen/daskalakislab/jajoo/SciencePaper/UKBBData/ukbppp_mddptsd_assoc_result.all.v1.xlsx")
# 
# setwd("/data/humgen/daskalakislab/jajoo")
# 
# source('/data/humgen/daskalakislab/jajoo/SciencePaper/script/UKBBBloodBrain.R')
# 
# 
# bloodUKBB <- rbind.data.frame(cbind(def=PTSD_Combined$PTSDDef,prot=PTSD_Combined$UKBPPP_ProteinID_Panel,p=PTSD_Combined$P,logFC=PTSD_Combined$BETA,array=PTSD_Combined$Panel,gene=PTSD_Combined$gene),
#                               cbind(def=MDD_Combined$DepressionDef,prot=MDD_Combined$UKBPPP_ProteinID_Panel,p=MDD_Combined$P,logFC=MDD_Combined$BETA,array=MDD_Combined$Panel,gene=MDD_Combined$gene))
# 
# arrayDetail <- grepl("II",bloodUKBB$array)
# bloodUKBB$array <- "I"
# bloodUKBB$array[arrayDetail] <- "II"
# 
# bloodLimma <- unique(bloodUKBB$def)
# 
# corMatrix <- matrix(0,length(metalimma),length(bloodLimma))
# countGene <- matrix(0,length(metalimma),length(bloodLimma))
# for (ilimma in 1:length(metalimma))
# {
#   for (iblood in 1:length(bloodLimma)) 
#   {
#     brainResults <- readRDS(metalimma[ilimma])
#     brainResults$zval <- zscore(brainResults$pval,brainResults$beta)
#     if (!(grepl("GENES",metalimma[ilimma]) | grepl("PROTEINS",metalimma[ilimma])))
#     {
#       brainResults %>% group_by(symbol) %>% slice_min(order_by = pval) -> temp 
#       brainResults <- temp 
#     }
#     
#     bloodResults <- bloodUKBB %>% filter(def== bloodLimma[iblood] & array=="I")
#     bloodResults$zval <- zscore(as.numeric(bloodResults$p),as.numeric(bloodResults$logFC))
#     # bloodResults just keep array I 
#     
#     commonGene <- intersect(brainResults$symbol,bloodResults$gene)
#     
#     corLimma <- cor(brainResults$zval[match(commonGene,brainResults$symbol)],
#                     bloodResults$zval[match(commonGene,bloodResults$gene)], use = "complete.obs")
#     print(metalimma[ilimma])
#     print(bloodLimma[iblood])
#     print(corLimma)
#     corMatrix[ilimma,iblood] <- corLimma
#     countGene[ilimma,iblood] <- length(commonGene)
#   }
# }
# 
# metalimmasub <- gsub("BetaSD/", "", metalimma)
# metalimmasub <- gsub("cc_beta_sd", "", metalimmasub)
# metalimmasub <- gsub("_beta_sd", "", metalimmasub)
# 
# rownames(corMatrix) <- gsub(".RDS","",paste0(unlist(lapply(strsplit(metalimmasub,split="/"),"[[",10)),'_',
#                                              unlist(lapply(strsplit(metalimmasub,split="/"),"[[",11)),"_",
#                                              unlist(lapply(strsplit(metalimmasub,split="/"),"[[",12))))
# colnames(corMatrix) <- bloodLimma

#saveRDS(corMatrix,"/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BloodHeatmap/corMatrix.RDS")

library(ComplexHeatmap)
library(ggplot2)
corMatrix <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BloodHeatmap/corMatrix.RDS")
options(bitmapType='cairo')
corMatrix_sub <- corMatrix[c(7:12,31:36),]



PTSD <- "#F05D5E"
MDD <- "#0F7173"
    
  
mPFC <- "#4C5061"
DG <- "#DE6412"
CeA <- "#D8A47F"
        
Gene <- "#9AA970"
Protein <- "#BE7577" 

library(circlize)
col_fun = colorRamp2(c(-0.25,0,0.25), c("blue", "white", "red"))
lgd <- Legend(col_fun = col_fun, title = "Correlation", direction = "horizontal",grid_width = 2,size = 9)
p <- Heatmap(corMatrix_sub,
             col = col_fun,
             #column_split = c("PTSD","PTSD","MDD","MDD","MDD","MDD","MDD","MDD","MDD"),
             split=c("RNA","RNA","RNA","RNA","RNA","RNA","Protein","Protein","Protein","Protein","Protein","Protein"),
             show_heatmap_legend = F,
             row_names_gp = grid::gpar(fontsize = 9),
             column_names_gp = grid::gpar(fontsize = 9),
             heatmap_legend_param = list(title="Correlation"),
             top_annotation = columnAnnotation(
               annotation_name_gp= grid::gpar(fontsize = 9),
               show_legend = c(F),
               Disease=c("a","a","b","b","b","b","b","b","b"),
               col=list(Disease=c("a"=PTSD,"b"=MDD))),
             left_annotation=rowAnnotation(
  Omic = c("a","b","c","d","e","f","g","h","i","j","k","l"),
  Disease = c("a","b","c","d","e","f","g","h","i","j","k","l"),
  Region = c("CeA","DG","mPFC","CeA","DG","mPFC","CeA","DG","mPFC","CeA","DG","mPFC"),
  col= list(Omic = c("a"=Gene,"b"=Gene,"c"=Gene,"d"=Gene,"e"=Gene,"f"=Gene,
                    "g"=Protein,"h"=Protein,"i"=Protein,"j"=Protein,"k"=Protein,"l"=Protein),
            Disease = c("a"=MDD,"b"=MDD,"c"=MDD,"d"=PTSD,"e"=PTSD,"f"=PTSD,
                        "g"=MDD,"h"=MDD,"i"=MDD,"j"=PTSD,"k"=PTSD,"l"=PTSD),
            Region =c("CeA"=CeA,"DG"=DG,"mPFC"=mPFC)),
  show_legend = c(F,F,T,F),
  annotation_name_gp= grid::gpar(fontsize = 9)))
p



png(file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BloodHeatmap/CorHeatmapColored.png",width = 12,height = 8,units = "in",res=300)
p
draw(lgd, x = unit(0.9, "npc"), y = unit(0.09, "npc"), just = "centre", test = FALSE)
dev.off()

# heatmaply(corMatrix,
#           scale_fill_gradient_fun = ggplot2::scale_fill_gradient2(
#   low = "blue", 
#   high = "red"),
#   file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BloodHeatmap/CorHeatmapSubelements.png",width = 1500, height = 1500,fontsize_row = 18,fontsize_col = 18)
# 
# 
# heatmaply(corMatrix_sub,
#           scale_fill_gradient_fun = ggplot2::scale_fill_gradient2(
#             low = "blue", 
#             high = "red"),
#           file = "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/BloodHeatmap/CorHeatmapSubelementsGeneProt.png",width = 1500, height = 1500,fontsize_row = 18,fontsize_col = 18)
# 
# 
