library(LAVA)
library(data.table)



dx=fread("/my_locus_v1.txt",header=T)
dx=as.data.frame(dx)



LOC=0
for(i in 1:nrow(dx)){
  LOC[i]=paste0("LOCUS",i)
}




CHR=dx$CHR
START=dx$BP_S
STOP=dx$BP_E

loci=data.frame(LOC,CHR,START,STOP)




input_eur = process.input(input.info.file="/input.info.txt",
                          sample.overlap.file=NULL,
                          ref.prefix="g1000_eur",                    # reference genotype data prefix
                          phenos=c("pheno1","pheno2")) 




for(i in 1:nrow(dx)){
  
  
  locus = process.locus(loci[i,], input_eur)
  
  h2=run.univ(locus)
  save(h2,file=paste0("/h2/LOCUS",i,".RData"))
  
  rg=run.bivar(locus,param.lim = 2)
  save(rg,file=paste0("/rg/LOCUS",i,".RData"))
  
  
  
  
  print(i)
  
}
