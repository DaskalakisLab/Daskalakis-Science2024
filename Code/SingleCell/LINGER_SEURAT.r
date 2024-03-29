library(Seurat)
library(liger)
library(data.table)
library(ggplot2)
library(dplyr)




pwd11="path to Cell_ranger folder"
atble11=list.files(pwd11)

dx=fread("path to qc summary",header=T)
dx=as.data.frame(dx)
row.names(dx)=dx$names


dxx=fread("path to demographic file",header=T)
dxx=as.data.frame(dxx)
row.names(dxx)=dxx$id
dxx=dxx[,c(1:6)]

rr=intersect(atble11,row.names(dx))

dx=dx[rr,]
atble11=rr
dx=dx[rr,]

rr=intersect(atble11,row.names(dxx))
dxx=dxx[rr,]


names2=as.character(dx$names)
names1=paste0("p",names2)
names3=paste0("s",names2)

my_list=list()

pwd11a="path to doublets output folder"
atble11a=list.files(pwd11a)


load("2000 most variable genes .RData")

my_list=list()
my_list2=list()
for(i in 1:length(atble11)){
  
  
  dx1=fread(paste0(pwd11a,atble11a[i]),header=T)
  dx1=as.data.frame(dx1)
  colnames(dx1)[2]="v2"  
  
  
  ffile=paste0("path to filtered_feature_bc_matrix folder")
  data_1934 <- Read10X(data.dir = ffile)
  my_list[[i]]=CreateSeuratObject(counts = data_1934, project = names2[i])
  my_list[[i]]$sample_names=dxx$id[i]
  my_list[[i]]$trait=dxx$trait[i]
  my_list[[i]]$chemistry=dxx$chem[i]
  my_list[[i]]$day_of_expr=dxx$expr[i]
  my_list[[i]][["percent.mt"]] <- PercentageFeatureSet(my_list[[i]], pattern = "^MT-")
  my_list[[i]][["doublets"]]<-dx1$v2
  
  
  sample1_data = ffile
  my_list2[[i]] = read10X(sample.dirs = list(sample1_data), 
                          sample.names = c(names3[i]))
  
  b=dx$Features2[i]
  c=dx$Mito[i]
  aa=0;coun=1
  for(ii in 1:dim(my_list2[[i]])[2]){
    if(my_list[[i]]$nFeature_RNA[ii]>500 && my_list[[i]]$nFeature_RNA[ii]<b && my_list[[i]]$percent.mt[ii]<c && my_list[[i]]$doublets[ii]==FALSE){aa[coun]=ii;coun=coun+1}
  }
  my_list2[[i]]=my_list2[[i]][,aa]
  
  my_list[[i]] <- subset(my_list[[i]], subset = nFeature_RNA > 500 & nFeature_RNA < b & percent.mt < dx$Mito[i] & doublets==FALSE)
  my_list[[i]] <- NormalizeData(my_list[[i]], verbose = FALSE)
  my_list[[i]] <- FindVariableFeatures(my_list[[i]], selection.method = "vst", nfeatures = 2000)
  
  
  d1=as.data.frame(cbind(my_list[[i]]$stim,my_list[[i]]$stim2,my_list[[i]]$stim3,my_list[[i]]$stim4))
  
  colnames(d1)=c("sample_names","trait","chemistry","day_of_expr")
  row.names(d1)=paste0(names3[i],"_",row.names(d1))
  if(i==1){dfin=d1}
  if(i!=1){dfin=rbind(dfin,d1)}
  
  rm(d1);rm(data_1934)
  print(i)
}
names(my_list2) <- names1
names(my_list) <- names1





save(dfin,file="dfin.RData")
save(my_list2,file="liger_list.RData")
save(my_list,file="Seurat_list.RData")

rm(my_list)


linger_obj <- createLiger(my_list2,take.gene.union = T,remove.missing = F)
linger_obj@cell.data=cbind(linger_obj@cell.data,dfin)
linger_obj <- normalize(linger_obj)	
linger_obj <- selectGenes(linger_obj, var.thresh = c(0.3, 0.875), do.plot = F)
linger_obj@var.genes="variable genes string vector"
linger_obj <- scaleNotCenter(linger_obj)

rm(my_list2)

############################################








k.suggest <- suggestK(linger_obj, num.cores = 4, gen.new = T,  plot.log2 = F,
                      nrep = 5)
save(k.suggest, file="liger_k_selection.RData")


out="liger_k_selection.pdf"
pdf(out,w=11,h=8)
plot(k.suggest)
dev.off()


#####################################


l.suggest<-suggestLambda(linger_obj,k="from previous step",num.cores = 4, gen.new = T,nrep = 5)


out="liger_lambda_selection.pdf"
pdf(out,w=11,h=8)
plot(l.suggest)
dev.off()

save(l.suggest, file="liger_l_selection.RData")


##################################

linger_obj <- optimizeALS(linger_obj, k="from privious step", nrep = 3)
linger_obj <- runTSNE(linger_obj, use.raw = T)
save(linger_obj, file="liger_object_v2.RData")

p1 <- plotByDatasetAndCluster(linger_obj, return.plots = T)
out="liger_first_tsne_s.pdf"
pdf(out,w=11,h=8)
p1[[1]]
dev.off()


a.pbmc <- quantileAlignSNF(linger_obj, resolution = xx, small.clust.thresh = yy)
a.pbmc <- runTSNE(a.pbmc)

save(linger_obj, file="liger_object_FINAL.RData")

p_a <- plotByDatasetAndCluster(linger_obj, return.plots = T) 

out="liger_FINAL_tsne_s_a.pdf"
pdf(out,w=11,h=8)
p_a[[1]]
dev.off()





p_a[[1]] <- p_a[[1]] + theme_classic() + theme(legend.position = c(0.85, 0.15)) + 
  guides(col=guide_legend(title = '', override.aes = list(size = 4)))
out="liger_FINAL_tsne_s_b.pdf"
pdf(out,w=11,h=8)
p_a[[1]]

dev.off()





x1=linger_obj@clusters
save(x1, file="linger_clusters.RData")
mat1=linger_obj@tsne.coords
save(mat1, file="linger mat1_tsne.RData")



################


load(file="path to Seurat_list.RData")
seu_obj=merge(x = my_list[[1]], y = my_list[2:15])
save(seu_obj, file="Seurat_object.RData")










ccluster=as.character(x1)
ccluster_names=names(x1)
seu_obj$cluster_id=ccluster
ccluster=as.factor(ccluster)
names(ccluster)=row.names(seu_obj@meta.data)
seu_obj@active.ident=ccluster


#mat1=a.pbmc@tsne.coords
row.names(mat1)=row.names(seu_obj@meta.data)
colnames(mat1)=c("tsne_1","tsne_2")
tsne.reduction <- CreateDimReducObject(
  embeddings = mat1,
  assay = NULL,
  key = c("tsne"),
  global = TRUE
)
seu_obj@reductions$tsne=tsne.reduction

save(seu_obj, file="Seurat_FINALobject.RData")



####################################


al=unique(as.character(ccluster))

for(i in 1:legnth(a1)){

d1 <- FindMarkers(object = seu_obj, ident.1 = al[i], min.pct = 0.25, logfc.threshold = 0.25)
save(d1, file=paste0("cluster_",al[i],".RData"))

d1$gene=row.names(d1)
d1$cluster=al[i]

filename=paste0("cluster_",al[i],".txt")
write.table(d1,filename,sep=" ",quote=F ,row.names=F,col.names=T,append=F)


}

