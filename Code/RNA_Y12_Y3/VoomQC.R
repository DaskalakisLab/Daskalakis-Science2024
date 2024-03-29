annoy12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
annoy3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

ca_y12 <- unique(annoy12[annoy12$Brain_Region=="CentralAmyg", "SampleID"])
dg_y12 <- unique(annoy12[annoy12$Brain_Region=="DG", "SampleID"])
mpfc_y12 <- unique(annoy12[annoy12$Brain_Region=="mPFC", "SampleID"])

ca_y3 <- unique(annoy3[annoy3$Brain_Region=="CentralAmyg", "SampleID"])
dg_y3 <- unique(annoy3[annoy3$Brain_Region=="DG", "SampleID"])
mpfc_y3 <- unique(annoy3[annoy3$Brain_Region=="mPFC", "SampleID"])

rm(annoy12,annoy3)

gene_ca12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoomCentralAmyg.RDS")
gene_dg12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoomDG.RDS")
gene_mpfc12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y1Y2/VoommPFC.RDS")
gene_ca3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/VoomCentralAmyg.RDS")
gene_dg3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/VoomDG.RDS")
gene_mpfc3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Genes/Y3/VoommPFC.RDS")

exon_ca12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoomCentralAmyg.RDS")
exon_dg12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoomDG.RDS")
exon_mpfc12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y1Y2/VoommPFC.RDS")
exon_ca3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/VoomCentralAmyg.RDS")
exon_dg3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/VoomDG.RDS")
exon_mpfc3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Exons/Y3/VoommPFC.RDS")

tx_ca12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_CentralAmyg.RDS")
tx_dg12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_DG.RDS")
tx_mpfc12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y1Y2/log2TMM1_mPFC.RDS")
tx_ca3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_CentralAmyg.RDS")
tx_dg3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_DG.RDS")
tx_mpfc3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Txs/Y3/log2TMM1_mPFC.RDS")

jx_ca12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y1Y2/VoomCentralAmyg.RDS")
jx_dg12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y1Y2/VoomDG.RDS")
jx_mpfc12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y1Y2/VoommPFC.RDS")
jx_ca3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y3/VoomCentralAmyg.RDS")
jx_dg3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y3/VoomDG.RDS")
jx_mpfc3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Voom/Jxs/Y3/VoommPFC.RDS")

identical(ca_y12, colnames(gene_ca12$E))
identical(dg_y12, colnames(gene_dg12$E))
identical(mpfc_y12, colnames(gene_mpfc12$E))
identical(ca_y3, colnames(gene_ca3$E))
identical(dg_y3, colnames(gene_dg3$E))
identical(mpfc_y3, colnames(gene_mpfc3$E))

identical(ca_y12, colnames(exon_ca12$E))
identical(dg_y12, colnames(exon_dg12$E))
identical(mpfc_y12, colnames(exon_mpfc12$E))
identical(ca_y3, colnames(exon_ca3$E))
identical(dg_y3, colnames(exon_dg3$E))
identical(mpfc_y3, colnames(exon_mpfc3$E))

identical(ca_y12, colnames(tx_ca12$E))
identical(dg_y12, colnames(tx_dg12$E))
identical(mpfc_y12, colnames(tx_mpfc12$E))
identical(ca_y3, colnames(tx_ca3$E))
identical(dg_y3, colnames(tx_dg3$E))
identical(mpfc_y3, colnames(tx_mpfc3$E))

identical(ca_y12, colnames(jx_ca12$E))
identical(dg_y12, colnames(jx_dg12$E))
identical(mpfc_y12, colnames(jx_mpfc12$E))
identical(ca_y3, colnames(jx_ca3$E))
identical(dg_y3, colnames(jx_dg3$E))
identical(mpfc_y3, colnames(jx_mpfc3$E))



