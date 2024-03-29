library(calibrate)
library(limma)
library(edgeR)
library(biomaRt)
require(data.table)








allfiles <- list.files(path = "path_to/sum_all_cell_clusters/")
dge <- readDGE(allfiles, path ="path_to/sum_all_cell_clusters/",  columns = c(1,3))
dim(dge)
keep.genes <- rowSums(cpm(dge)>2) >= ceiling(dim(dge)[2]/3)
dge <- dge[keep.genes, , keep.lib.sizes=FALSE]
dim(dge)
sample_names=colnames(dge)
nsamples <- ncol(dge)
dge <- calcNormFactors(dge, method = "TMM") 

phenoX=fread("path_to_demographic.txt",header=T)
phenoX=as.data.frame(phenoX)
row.names(phenoX)=phenoX$sample_name

phenoX=subset(phenoX,phenoX$DX!="MDD")
dge=dge[,row.names(phenoX)]


mod = model.matrix(~cluster*Dx + covariates, data = phenoX)
colnames(mod) <- make.names(colnames(mod))
colnames(mod)[1] = "Int"
vGene <- voom(dge,mod, plot = TRUE)

gene_dupCorr = duplicateCorrelation(vGene$E, mod, block=phenoX$sample_name)
fitGene = lmFit(vGene, mod,
                correlation=gene_dupCorr$consensus.correlation,
                block=phenoX$sample_name)
eBGene = eBayes(fitGene)
sigGenePTSD = topTable(eBGene,coef=2,
                      p.value = 1,number=nrow(dge), sort="none")
colnames(sigGenePTSD) = paste0(colnames(sigGenePTSD), "_PTSD")

sigGenePTSD$Genes=row.names(sigGenePTSD)





filename=paste0("/path_to_out_put/PTSD.txt")
write.table(sigGenePTSD,filename,sep=" ",quote=F ,row.names=F,col.names=T,append=F)
