rna_gene <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_RNA_Gene.RDS")
rna_exon <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_RNA_Exon.RDS")
rna_jx <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_RNA_Jx.RDS")
rna_tx <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_RNA_Tx.RDS")
prot <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_Protein.RDS")
pep <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_Peptide.RDS")
meth <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/ExtractedByType/FKBP5_Methylation.RDS")


df <- merge(prot, pep, by=c("BrNum","Brain_Region","Year" ))
df <- merge(df, rna_gene, by=c("BrNum","Brain_Region","Year"),all.x=T)
df <- merge(df, rna_exon, by=c("BrNum","Brain_Region","Year"),all.x=T)
df <- merge(df, rna_jx, by=c("BrNum","Brain_Region","Year"),all.x=T)
df <- merge(df, rna_tx, by=c("BrNum","Brain_Region","Year"),all.x=T)
df <- merge(df, meth, by=c("BrNum","Brain_Region","Year"),all.x=T)

anno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
anno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

anno12 <- anno12[,c("BrNum","Brain_Region","SampleID","Year","Dx","PTSD","MDD","Control",
                   "AgeDeath","Sex","PMI",
                   "ancestryPC1","ancestryPC2",
                   "Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped",
                   "ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5",
                   "PepPC1","PepPC2","PepPC3","PepPC4","PepPC5",
                   "Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos")]
anno3 <- anno3[,c("BrNum","Brain_Region","SampleID","Year","Dx","PTSD","MDD","Control",
                    "AgeDeath","Sex","PMI",
                    "ancestryPC1","ancestryPC2",
                    "Astro","inhib","ex","Oligo","Micro","OPC","Tcell","mitoMapped",
                    "ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5",
                    "PepPC1","PepPC2","PepPC3","PepPC4","PepPC5",
                    "Meth_PC1","Meth_PC2","Smoking","NeuN_neg","NeuN_pos")]
anno <- rbind(anno12, anno3)


df <- merge(anno, df, by=c("BrNum", "Brain_Region", "Year"), all.x=T)
saveRDS(df, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5.RDS")
#writexl::write_xlsx(df, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Expression/FKBP5.xlsx")
