pwd11="/GWAS/"
table11=list.files(pwd11)

cc=c(Nsize)





for(i in 1:length(table11)){
  
  kx=nchar(table11[i])
  nk=substr(table11[i],1,kx-4)
  
  
  aa=paste0("/anaconda3/envs/ldsc/bin/python2.7 /ldsc/munge_sumstats.py --sumstats ",paste0(pwd11,table11[i])," --chunksize 10000 --snp SNP --a1 REF --a2 ALT --p P"," --N ", cc[i]," ","--out /munge/",nk," ","--merge-alleles /EUR/w_hm3.snplist")
  system(aa)
  
  
  print(i)
  
  
  
}




pwd11="/munge/"
table11=list.files(pwd11,pattern=".sumstats.gz")





for(i in 1:length(table11)){
  
  kkx=nchar(table11[i])
  nn=substr(table11[i],1,kkx-12)
  
  
  
  aa=paste0("/anaconda3/envs/ldsc/bin/python2.7 /ldsc/ldsc.py --h2 ",paste0(pwd11,table11[i])," --ref-ld-chr /EUR/eur_w_ld_chr/ --w-ld-chr /EUR/eur_w_ld_chr/  --out /Results/LDSC/",nn)
  system(aa)
  
  
  print(i)
  
  
  
}





library(data.table)


pwd11="/munge/"
table11=list.files(pwd11,pattern=".sumstats.gz")




pwd11a="/munge/"
table11a=list.files(pwd11a,pattern=".sumstats.gz")





for(j in 1:length(table11a)){
  

kx=nchar(table11[i])
nn=substr(table11[i],1,kx-12)


for(j in 1:length(table11a)){

  if(i!=j){  
  kx1=nchar(table11a[j])
  nn1=substr(table11a[j],1,kx1-12)
  
  
  aa=paste0("/ldsc/bin/python2.7 /ldsc/ldsc.py --rg ",paste0(pwd11,table11[i],",",pwd11a,table11a[j])," --ref-ld-chr /EUR/eur_w_ld_chr/ --w-ld-chr /EUR/eur_w_ld_chr/ ","--out /r2/",paste0(nn,"_vs_",nn1))
  system(aa)
  
  
  
  print(paste(i,j))
  }
}


}
