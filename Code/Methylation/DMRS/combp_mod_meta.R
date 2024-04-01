mhtplot_input <- function (probe = NULL, chr = NULL, pos = NULL, p = NULL, color = "bg", 
                           sigthre = NULL, sigthre2 = NULL, threlty = c(2, 1), markprobe = NULL, 
                           markcolor = "red") 
{
  if(is.null(probe)|is.null(chr)|is.null(pos)|is.null(p)){
    stop("Please provide probe,chr, pos and p\n")}
  if(!(length(probe)==length(chr) & length(chr)==length(pos) & length(chr)==length(p))){
    stop("The length of probe, chr, pos and p are different")}
  flag=!is.na(probe) & !is.na(chr) & !is.na(pos) & !is.na(p)
  
  dat=data.frame(probe=probe,chr=chr,pos=pos,p=p)
  dat=dat[flag,]
  tmp=toupper(as.vector(dat$chr))
  tmp[tmp %in% "X"]="23"
  tmp[tmp %in% "Y"]="24"
  dat$chr=as.numeric(tmp)
  dat$pos=as.numeric(as.vector(dat$pos))
  dat=dat[order(dat$chr,dat$pos),]
  dat=dat[!is.na(dat$chr),]
  
  chrlen=aggregate(dat$pos,by=list(dat$chr),FUN=max)
  chrlen$cumx=cumsum(chrlen$x)
  chrlen$mid=(chrlen$cumx-c(0,chrlen$cumx[1:(nrow(chrlen)-1)]))/2+
    c(0,chrlen$cumx[1:(nrow(chrlen)-1)])
  for(i in 2:nrow(chrlen))
  {dat$pos[dat$chr %in% chrlen$Group.1[i]]=dat$pos[dat$chr %in% chrlen$Group.1[i]]+
    chrlen$cumx[i-1]}
  
  if(color=="bg"){
    dat$col="gray"
      dat$col[dat$chr %in% chrlen$Group.1[(1:nrow(chrlen) %% 2)==0]]="black"
  }else{dat$col=color}
  
  chrlen$Group.1[chrlen$Group.1 == 23]="X"
  chrlen$Group.1[chrlen$Group.1 == 24]="Y"
  
  dsig=dat[dat$probe %in% markprobe,]
  saveRDS(dat,file = paste0("mht_", sub("^(\\w+_\\w+)_beta_sd.*", "\\1", files_meta[ilimma]), "_mhtIn.RDS"))

}

combp_mod <- function (data, dist.cutoff = 1000, bin.size = 310, seed = 0.001, 
          region_plot = FALSE, mht_plot = TRUE,  nCores = 23, verbose = TRUE) {
  if (nCores > detectCores()) {
    nCores = detectCores()
  }
  data = as.data.frame(data)
  data$start = as.numeric(as.vector(data$start))
  data$end = as.numeric(as.vector(data$end))
  data = data[!is.na(data$start) & !is.na(data$end), ]
  data$p = as.numeric(as.vector(data$p))
  if (sum(data$p <= 0 | data$p >= 1) > 0) {
    cat("P values <=0 were re-assigned with a value of 1E-300\n\nP values >=1 were re-assigned with a value of 0.99999\n")
    data$p[data$p <= 0] = 1e-300
    data$p[data$p >= 1] = 0.99999
  }
  acf <- get.acf(data, dist.cutoff, bin.size)
  if (verbose) {
    cat("P value correlations:\n")
    bin = seq(bin.size, dist.cutoff, bin.size)
    if (!(dist.cutoff%%bin.size == 0)) {
      bin = c(bin, dist.cutoff)
    }
    print(data.frame(bin = bin, acf = acf))
  }
  result <- mclapply(unique(as.vector(data$chr)), function(chr) {
    y = data[as.vector(data$chr) == chr, ]
    y = y[order(y$end), ]
    pos = y$end
    p = qnorm(y$p)
    temp = sapply(pos, function(i) {
      index.i = (abs(pos - i) < bin.size)
      if (sum(index.i) > 1) {
        int <- findInterval(c(dist(pos[index.i])), c(bin.size, 
                                                     2 * bin.size))
        sd <- sqrt(sum(acf[int + 1]) * 2 + sum(index.i))
        return(pnorm(sum(p[index.i]), mean = 0, sd = sd))
      }
      else {
        return(y$p[index.i])
      }
    })
    return(data.frame(chr, start = pos, end = pos, s.p = temp))
  }, mc.cores = nCores)
  result <- do.call("rbind", result)
  names(result) = c("chr", "start", "end", "s.p")
  result = result[p.adjust(result$s.p, method = "fdr") < seed, 
  ]
  result.fdr = NULL
  if (nrow(result) > 0) {
    for (chr in unique(result$chr)) {
      y = data[as.vector(data$chr) == chr, ]
      y = y[order(y$end), ]
      pos = y$end
      p = qnorm(y$p)
      result.chr = result[result$chr == chr, ]
      a = IRanges::IRanges(start = result.chr$start, end = result.chr$end)
      b = IRanges::reduce(a, min.gapwidth = dist.cutoff)
      start = IRanges::start(b)
      end = IRanges::end(b)
      region.max <- max(IRanges::width(b))
      temp = sapply(1:length(b), function(i) {
        index.i = (pos >= start[i] & pos <= end[i])
        if (sum(index.i) > 1) {
          int <- findInterval(c(dist(pos[index.i])), 
                              seq(bin.size, region.max + bin.size, bin.size))
          sd <- sqrt(sum(ifelse(int < length(acf), acf[int + 
                                                         1], 0)) * 2 + sum(index.i))
          return(pnorm(sum(p[index.i]), mean = 0, sd = sd))
        }
        else {
          return(y$p[index.i])
        }
      })
      result.fdr = rbind(result.fdr, data.frame(chr, start, 
                                                end, p = temp))
    }
    result.fdr$fdr = p.adjust(result.fdr$p, method = "fdr")
    result.fdr$sidak = (1 - (1 - result.fdr$p)^(nrow(data)/(result.fdr$end - 
                                                              result.fdr$start + 1)))
    result.fdr <- result.fdr[order(result.fdr$p), ]
  }
  if (is.null(result.fdr)) {
    cat("Number of identified DMR:  0\n")
  }
  else {
    ndmr = nrow(result.fdr)
    result.fdr$start = as.numeric(as.vector(result.fdr$start))
    result.fdr$end = as.numeric(as.vector(result.fdr$end))
    result.fdr$chr = factor(result.fdr$chr)
    cat("Number of DMRs identified:  ", ndmr, "\n")
    if (region_plot) {
      cat("Drawing regional plot: region_plot.pdf ...\n")
      sig = result.fdr
      regplot(ref = data, sig)
    }
    if (mht_plot) {
      cat("Drawing manhattan plot: mht.jpg ...\n")
      set2 = NULL
      for (i in 1:ndmr) {
        set2 = c(set2, as.vector(data$probe[as.vector(data$chr) == 
                                              as.vector(result.fdr$chr[i]) & data$end >= 
                                              result.fdr$start[i] & data$end <= result.fdr$end[i]]))
      }
      
      saveRDS(data,file = paste0("dataInput_", sub("^(\\w+_\\w+)_beta_sd.*", "\\1", files_meta[ilimma]), ".RDS"))
      mhtplot_input(probe = data$probe, chr = as.vector(data$chr), 
              pos = data$start, p = data$p, color = c("grey80"))
      
      
      # mhtplot(probe = data$probe, chr = as.vector(data$chr), 
      #         pos = data$start, p = data$p, color = c("grey80"), 
      #         markprobe = set2, outf = paste0("mht_", sub("^(\\w+_\\w+)_beta_sd.*", "\\1", files_meta[ilimma])), markcolor = "#5756BB", sigthre = 0.05 )
    }
    result.fdr$nprobe = NA
    for (i in 1:nrow(result.fdr)) {
      result.fdr$nprobe[i] = nrow(data[as.vector(data$chr) == 
                                         as.vector(result.fdr$chr[i]) & data$end >= result.fdr$start[i] & 
                                         data$end <= result.fdr$end[i], ])
    }
    result.fdr$start = (result.fdr$start - 1)
    write.table(result.fdr, paste0("resu_combp_", sub("^(\\w+_\\w+)_beta_sd.*", "\\1", files_meta[ilimma]), ".csv"), row.names = FALSE, 
                sep = ",")
  }}

acf.table<-function(x,loc,dist.cutoff){
  flag=TRUE; lag=1; result=NULL
  while(flag){
    x1=head(x,-lag); x2=tail(x,-lag); dist=diff(loc,lag=lag)
    index=(dist<dist.cutoff)  
    if(all(!index)){flag=FALSE}else{
      result=rbind(result,data.frame(x1=x1[index],x2=x2[index],dist=dist[index]))
      lag=lag+1
    }
  }
  return(result)  
}

##### a function to estimate acf
get.acf<-function(data,dist.cutoff,bin.size){
  temp<-NULL
  for (chr in unique(as.vector(data$chr))){
    y<-data[as.vector(data$chr)==chr,]; y<-y[order(y$end),]
    temp<-rbind(temp,acf.table(y$p,y$end,dist.cutoff))
  }
  bin.label<-findInterval(temp$dist,seq(bin.size,dist.cutoff,bin.size))
  temp.stouffer<-by(temp,bin.label,FUN=function(x){cor.test(qnorm(x$x1),
                                                            qnorm(x$x2),alternative="greater")},simplify=FALSE)
  
  cor.stouffer<-sapply(temp.stouffer,function(x){x$estimate})
  p.stouffer<-sapply(temp.stouffer,function(x){x$p.value})
  
  if (any(p.stouffer>0.05)){
    index=min(which(p.stouffer>0.05))
    cor.stouffer[index:length(cor.stouffer)]=0
  }
  return(cor.stouffer)
}

#regional P value plot
regplot<-function(ref,sig,extend=2000,outf="region_plot.pdf"){
  sig=sig[order(sig[,"chr"],sig[,"start"]),]
  ref=ref[order(ref[,"chr"],ref[,"start"]),]
  
  pdf(outf)
  for(i in 1:nrow(sig)){
    chr=as.vector(sig$chr[i])
    pos1=sig$start[i]
    pos2=sig$end[i]
    subset=ref[as.vector(ref$chr)==chr & ref$start>=(pos1-extend) & ref$start<=(pos2+extend),]
    subset$cor="black"
      subset$cor[subset$start>=pos1 &subset$start<=pos2]="red"
        
      ylab=bquote('-log'['10']*'(P) value')
      
      plot(subset$start,-log10(subset$p),col=subset$cor,pch=20,xlim=c(pos1-extend,
                                                                      pos2+extend),xlab="Chromosome position",ylab=ylab)
  }
  dev.off()
}

##### interval method
##### 1. get interval p-values; 2. select all intervals with fdr<seed; 
###3. combine nearby sig. intervals and sig. probes (probes with fdr<seed)
### into regions; 4. find region p-values
ipdmr<-function(data,include.all.sig.sites=TRUE,dist.cutoff=1000,bin.size=50,
                seed=0.05,region_plot=TRUE,mht_plot=TRUE,verbose=TRUE){
  data=as.data.frame(data)
  data$start=as.numeric(as.vector(data$start))
  data$end=as.numeric(as.vector(data$end))
  data=data[!is.na(data$start) & !is.na(data$end),]
  data$p=as.numeric(as.vector(data$p))
  
  acf<-get.acf(data,dist.cutoff,bin.size)
  if(verbose){
    cat("P value correlations:\n")
    bin=seq(bin.size,dist.cutoff,bin.size)
    if(!(dist.cutoff%%bin.size==0)){bin=c(bin,dist.cutoff)}
    print(data.frame(bin=bin,acf=acf))
  }
  result<-NULL
  for (chr in unique(as.vector(data$chr))){
    y=data[as.vector(data$chr)==chr,]; y=y[order(y$end),]
    pos=y$end; p=qnorm(y$p)
    index=which(diff(pos)<dist.cutoff)
    int<-findInterval(diff(pos)[index],seq(bin.size,dist.cutoff,bin.size))
    sd<-sqrt(acf[int+1]*2+2)
    int.p<-pnorm(p[index]+p[index+1],mean=0,sd=sd)
    start=pos[index]; end=pos[index+1];
    result=rbind(result,data.frame(chr,start,end,int.p))
  }
  
  if (include.all.sig.sites){
    temp=data[p.adjust(data$p,method="fdr")<seed,]
  }else{
    int.sites=unique(c(paste(result$chr,result$start),
                       paste(result$chr,result$end)))
    data.1=data[!(paste(as.vector(data$chr),data$end) %in% int.sites),]
    temp=data.1[p.adjust(data.1$p,method="fdr")<seed,]
  }
  
  result=result[p.adjust(result$int.p,method="fdr")<seed,]
  result=rbind(result,data.frame(chr=temp$chr,start=temp$end,end=temp$end,int.p=temp$p))
  
  result.fdr=NULL
  if (nrow(result)>0){
    for (chr in unique(result$"chr")){
      y=data[as.vector(data$chr)==chr,]; y=y[order(y$end),]
      pos=y$end; p=qnorm(y$p)
      
      result.chr=result[result$"chr"==chr,]
      a=IRanges::IRanges(start=result.chr$start,end=result.chr$end)
      b=IRanges::reduce(a,min.gapwidth=dist.cutoff)
      
      start=IRanges::start(b); end=IRanges::end(b)
      region.max<-max(IRanges::width(b))
      temp=sapply(1:length(b),function(i){
        index.i=(pos>=start[i] & pos<=end[i]);
        if (sum(index.i)>1){  
          int<-findInterval(c(dist(pos[index.i])),
                            seq(bin.size,region.max+bin.size,bin.size))
          sd<-sqrt(sum(ifelse(int<length(acf),acf[int+1],0))*2+sum(index.i))
          return(pnorm(sum(p[index.i]),mean=0,sd=sd))
        }else{
          return(y$p[index.i])
        }
      })
      result.fdr=rbind(result.fdr,data.frame(chr,start,end,p=temp))
    }
    
    ##### BH correction
    result.fdr$fdr=p.adjust(result.fdr$p,method="fdr")
    result.fdr<-result.fdr[order(result.fdr$p),]
    
    ##### use 0-coordinate
    result.fdr$start=(result.fdr$start-1)
  }
  
  if(is.null(result.fdr)){cat("Number of identified DMR:  0\n")}else{
    result.fdr$start=as.numeric(as.vector(result.fdr$start))
    result.fdr$end=as.numeric(as.vector(result.fdr$end))
    result.fdr$chr=factor(result.fdr$chr)
    
    ndmr=nrow(result.fdr)
    cat("Number of DMRs identified:  ",ndmr, "\n")
    if(region_plot){
      cat("Drawing regional plot: region_plot.pdf ...\n")
      sig=result.fdr
      regplot(ref=data,sig)
    }
    if(mht_plot){
      cat("Drawing manhattan plot: mht.jpg ...\n")
      set2=NULL
      for(i in 1:ndmr){
        set2=c(set2,as.vector(data$probe[as.vector(data$chr)==as.vector(result.fdr$chr[i]) 
                                         & data$start>=result.fdr$start[i] & data$start<=result.fdr$end[i]]))
      }
      mhtplot(probe=as.vector(data$probe),chr=as.vector(data$chr),pos=data$start,p=data$p,color="gray",markprobe=set2)
    }
    #number of probes within eath DMR
    result.fdr$nprobe=NA
    for(i in 1:nrow(result.fdr)){
      result.fdr$nprobe[i]=nrow(data[as.vector(data$chr)==as.vector(result.fdr$chr[i]) 
                                     & data$start>=result.fdr$start[i] & data$end<=result.fdr$end[i],])
    }
    
    write.table(result.fdr,"resu_ipdmr.csv",row.names=FALSE,sep=",")
  } 
}
