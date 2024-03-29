

library(data.table)
library(Seurat)



load("path_to_seurat_object.RData")



mat=seu_obj@assays$RNA@counts
meta_data=seu_obj@meta.data
aa=unique(meta_data$clusters)

for(j in 1:length(aa)){
  dir.create(paste0("path_to/sum_cell_clusters/",aa[j]))
}



for(ii in 1:length(aa)){
  
  d2=subset(meta_data,meta_data$clusters==aa[ii])
  aaa=unique(d2$sample)
  
  for(i in 1:length(aaa)){
  dtemp=subset(d2,d2$sample==aaa[i])
    mat2=mat[,row.names(dtemp)]
    mat2=as.matrix(mat2)
    aaaa=rowSums(mat2)
    dxx=as.data.frame(cbind(row.names(mat2),row.names(mat2),aaaa))
    colnames(dxx)=c("Name","Description",paste0("S_",aaa[i]))
    filename=paste0("path_to/sum_cell_clusters/",aa[ii],"/",aaa[i],".gct")
    write.table(dxx,filename,sep="\t",quote=F ,row.names=F,col.names=T,append=F)
    
  }
  
  
  
  
  print(ii)
}

