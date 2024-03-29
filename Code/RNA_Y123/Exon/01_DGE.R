#we removed exon at oct10, 2023
library(SummarizedExperiment)
library(edgeR)

# Load data file
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_exon.y123_n688.Rdata")

dcount=assays(rse_exon)[[1]]
dcount <- as.data.frame(dcount)
#571623 


exons_to_remove <- readRDS("/data/humgen/daskalakislab/aiatrou/Science/Bulk/RNA/Exons/exons_to_remove.RDS")
# Create a vector of row names from exons_to_remove
exon_names_to_remove <- exons_to_remove$exon


# Use row names of dcount to filter rows
filtered_dcount <- dcount[!(rownames(dcount) %in% exon_names_to_remove), ]
dcount<-filtered_dcount
#556496

annoy123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS")



ca_y123 <- unique(annoy123[annoy123$Brain_Region=="CentralAmyg", "SampleID"])
ca_y123 <- na.omit(ca_y123)
dg_y123 <- unique(annoy123[annoy123$Brain_Region=="DG", "SampleID"])
dg_y123 <- na.omit(dg_y123)
mpfc_y123 <- unique(annoy123[annoy123$Brain_Region=="mPFC", "SampleID"])
mpfc_y123  <- na.omit(mpfc_y123 )
count_ca_y123 <- dcount[,ca_y123]
count_dg_y123 <- dcount[,dg_y123]
count_mpfc_y123 <- dcount[,mpfc_y123]

create_dge_list <- function(counts, anno){
  dge <- DGEList(counts)
  dge$samples$SampleID <- rownames(dge$samples)
  dge$samples <- merge(dge$samples, anno[,c("SampleID", "Dx")], by="SampleID", all.x=T)
  dge$samples$group <- dge$samples$Dx
  rownames(dge$samples) <- dge$samples$SampleID
  dge$samples <- dge$samples[,c("group", "lib.size", "norm.factors")]
  dge$group <- as.factor(dge$samples$group)
  dge$samples <- dge$samples[colnames(dge$counts),]
  return(dge)
}

dge_ca_y123 <- create_dge_list(count_ca_y123, annoy123)
dge_dg_y123 <- create_dge_list(count_dg_y123, annoy123)
dge_mpfc_y123 <- create_dge_list(count_mpfc_y123, annoy123)



identical(colnames(dge_ca_y123$counts), rownames(dge_ca_y123$samples))
identical(colnames(dge_dg_y123$counts), rownames(dge_dg_y123$samples))
identical(colnames(dge_mpfc_y123$counts), rownames(dge_mpfc_y123$samples))




setdiff(rownames(dge_ca_y123$samples), ca_y123)
setdiff(rownames(dge_dg_y123$samples), dg_y123)
setdiff(rownames(dge_mpfc_y123$samples), mpfc_y123)



saveRDS(dge_ca_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Exon/Y1Y2Y3_removed_exon/DGE_CentralAmyg.RDS")
saveRDS(dge_dg_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Exon/Y1Y2Y3_removed_exon/DGE_DG.RDS")
saveRDS(dge_mpfc_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Exon/Y1Y2Y3_removed_exon/DGE_mPFC.RDS")




