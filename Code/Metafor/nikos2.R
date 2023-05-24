extract_results <- function(wd, outpath){
  dir_list <- list.dirs(wd, recursive = T)
  
  dir_list <- dir_list[endsWith(dir_list, "Exons") | endsWith(dir_list, "Genes") | endsWith(dir_list, "Jxs") | endsWith(dir_list, "Txs") | endsWith(dir_list, "Proteins") | endsWith(dir_list, "Peptides")| endsWith(dir_list, "Methylation")]
  
  
  
  Omic=0
  Feature=0
  Ana=0
  for(ix in 1:length(dir_list)){
    
    pos=gregexpr(pattern= "Methylation",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Omic[ix]="Methylation"
    Feature[ix]="cpg"
    }
    
    pos=gregexpr(pattern= "Exons",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Omic[ix]="RNA"
    Feature[ix]="Exons"
    }
    
    pos=gregexpr(pattern= "Genes",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Omic[ix]="RNA"
    Feature[ix]="Genes"
    }
    pos=gregexpr(pattern= "Jxs",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Omic[ix]="RNA"
    Feature[ix]="Jxs"
    }
    pos=gregexpr(pattern= "Txs",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Omic[ix]="RNA"
    Feature[ix]="Txs"
    }
    
    pos=gregexpr(pattern= "Proteins",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Omic[ix]="Proteins"
    Feature[ix]="Proteins"
    }
    pos=gregexpr(pattern= "Peptides",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Omic[ix]="Peptides"
    Feature[ix]="Peptides"
    } 
    
    pos=gregexpr(pattern= "Baseline",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Ana[ix]="Baseline"
    
    } 
    pos=gregexpr(pattern= "ChildTrauma",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Ana[ix]="ChildTrauma"
    
    }
    
    pos=gregexpr(pattern= "SexSpecific",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Ana[ix]="SexSpecific"
    
    }
    pos=gregexpr(pattern= "Suicide",dir_list[ix])
    pos=unlist(pos)
    if(pos[1]>0){Ana[ix]="Suicide"
    
    }
  }
  
  
  
  counx=1
  
  Omic2=0
  Feature2=0
  Analysis=0
  Trait=0
  nPVAL=0
  nFDR=0
  nGENES=0
  FDR_perc=0
  Tissue=0
  
  for (ix in 1:length(dir_list)){
    limma_files <- list.files(dir_list[ix])
    limma_files <- limma_files[endsWith(limma_files, ".RDS")]
    
    for (ixx in 1:length(limma_files)){
      kkk=nchar(limma_files[ixx])
      
      pos=gregexpr(pattern= "_",limma_files[ixx])
      pos=unlist(pos)
      Analysis[counx]=Ana[ix]
      Omic2[counx]=Omic[ix]
      Feature2[counx]=Feature[ix]
      df <- readRDS(paste0(dir_list[ix],"/",limma_files[ixx]))
      nGENES[counx]=nrow(df)
      nPVAL[counx]=nrow(subset(df,df$pval<0.05))
      nFDR[counx]=nrow(subset(df,df$FDR<0.05))
      FDR_perc[counx]=(nrow(subset(df,df$FDR<0.05)))/nrow(df)
      Trait[counx]=substr(limma_files[ixx],1,pos[length(pos)]-1)
      Tissue[counx]=substr(limma_files[ixx],pos[length(pos)]+1,kkk-4)
      counx=counx+1
    }
    
  }
  
  
  dfin=data.frame(Analysis,Trait,Tissue,Omic2,Feature2,nGENES,nPVAL,nFDR,FDR_perc) 
  colnames(dfin)=c("Analysis","Trait","Tissue","Omic","Feature","nGENES","nPVAL","nFDR","FDR_perc")
  
  filename= outpath
  write.table(dfin,filename,sep=",",quote=F ,row.names=F,col.names=T,append=F)
  
  
}