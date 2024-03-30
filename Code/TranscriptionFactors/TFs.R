library(data.table)
library(enrichR)
 
 
pwd11="/path_to_resutls/"
atble11=list.files(pwd11)
 
 
listEnrichrSites()
setEnrichrSite("Enrichr")
websiteLive <- TRUE
dbs <- listEnrichrDbs()
aa=dbs$libraryName
dbs <- c("ChEA_2022", "ENCODE_TF_ChIP-seq_2015")
 
 
 
 
my_list=list()
 
coun=1
 
 
for(i in 1:length(atble11)){
  kl=nchar(atble11[i])
  nxx=substr(atble11[i],1,kl-4)
  data1=readRDS(paste0(pwd11,atble11[i]))
  data1=as.data.frame(data1)
  data1$beta=data1$logFC
  data1$pval=data1$P.Value
  data1=subset(data1,data1$pval<0.05)
  dx=data1
  dt=dx[,c("symbol","pval")]
  dt$gene=dt$symbol
  if(nrow(dt)>1){
      if (websiteLive) {
      d1 <- enrichr(c(dt$gene), dbs)
    }
    dt1=d1$ChEA_2022
    dt2=d1$`ENCODE_TF_ChIP-seq_2015`

    if(nrow(dt1)>0){
      dt1$genes=""
      dt1$cat="Chea"
      for(ii in 1:nrow(dt1)){
        pos=gregexpr(pattern =" ",dt1$Term[ii])
        pos=unlist(pos)
        dt1$genes[ii]=substr(dt1$Term[ii],1,pos[1]-1)
      }
      }
    if(nrow(dt2)>0){
      dt2$genes=""
      dt2$cat="Encode"
      for(ii in 1:nrow(dt2)){
        pos=gregexpr(pattern =" ",dt2$Term[ii])
        pos=unlist(pos)
        dt2$genes[ii]=substr(dt2$Term[ii],1,pos[1]-1)
      }
    }
    dfin=rbind(dt1,dt2)
    dfin$FDR=p.adjust(dfin$P.value, method = "BH", n = nrow(dfin))
    dfin2=subset(dfin,dfin$FDR<0.05)
    if(nrow(dfin2)!=0){
      my_list[[coun]]=dfin2
      coun=coun+1
    }
  }
}
