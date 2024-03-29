library(calibrate)
library(limma)        # linear models
library(edgeR)
library(biomaRt)
library(data.table)



pwd11="path_to/sum_cell_clusters/"
atble11=list.files(pwd11)

for(i in 1:length(atble11)){
  pg=paste0(pwd11,atble11[i],"/")
  allfiles <- list.files(path = pg)
  dge <- readDGE(allfiles, path =pg,  columns = c(1,3))
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
  
  phenoX=subset(phenoX,phenoX$DX!="PTSD")
  dge=dge[,row.names(phenoX)]
  
  
  mod = model.matrix(~Dx + covariates, data = phenoX)
  colnames(mod) <- make.names(colnames(mod))
  colnames(mod)[1] = "Int"
  
  vGene <- voom(dge,mod, plot = TRUE)
  
  
  fitGene = lmFit(vGene)
  eBGene = eBayes(fitGene)
  
  
  
  sigGeneMDD = topTable(eBGene,coef=2,
                        p.value = 1,number=nrow(z.X), sort="none")
  colnames(sigGeneMDD) = paste0(colnames(sigGeneMDD), "_MDD")
  
  sigGeneMDD$Genes=row.names(sigGeneMDD)
  
  
  filename=paste0("path_to_output_folder/","MDD_",atble11[i],".txt")
  write.table(sigGeneMDD,filename,sep=" ",quote=F ,row.names=F,col.names=T,append=F)
  
  
  
  
  
  
}
