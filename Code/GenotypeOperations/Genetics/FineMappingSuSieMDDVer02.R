
GetLDMatrixUsing1000Genome <- function(chr,tmpPathResult)
{
  #system(paste0('conda run -n plink plink -bfile /data/humgen/daskalakislab/1000G/EUR/EUR.chr',chr,'.1KGP',
   #             " --r2 square "," --chr ", chr, " --from-bp ", locusStart,
  #              " --to-bp ",locusEnd, " --out ",tmpPathResult ))
  
  system(paste0('conda run -n plink plink -bfile /data/humgen/daskalakislab/1000G/EUR/EUR.chr',chr,'.1KGP',
                " --r square "," --keep-allele-order --extract ",tmpPathResult,"useThisList ", " --out ",tmpPathResult, " --write-snplist" ))
  ldMatrix <- read.table(paste0(tmpPathResult,'.ld'))
  snpNames <- unlist(read.table(paste0(tmpPathResult,".snplist")))
  # GWAs loci should not have multiple allele but somehow got some
  # in this case snp is repeated twice, but we donot want them, so just removing 
  # one of those
  snpDuplicate <- duplicated(snpNames)
  ldMatrix <- ldMatrix[!snpDuplicate,!snpDuplicate]
  snpNames <- snpNames[!snpDuplicate]
  colnames(ldMatrix) <- snpNames
  rownames(ldMatrix) <- snpNames
  ldMatrix
}

library(dplyr)

mddSummary <- read.table('/data/humgen/daskalakislab/jajoo/GWAS/MDD/MDD_PGCHwMDD_MVP.txt',header = TRUE)
mddLoci <- read.table('/data/humgen/daskalakislab/jajoo/SciencePaper/SuSieRelated/MDDFineMapping/FUMA_job293839/GenomicRiskLoci.txt',
                      header=TRUE)
GWASn <- 750414
CredibleSet <- NULL
CredibleSetSummary <- NULL
for (iloc in 1:nrow(mddLoci))
{
  print(iloc)
chr <- mddLoci[iloc,"chr"]
locusStart <- mddLoci[iloc,"start"]
locusEnd <- mddLoci[iloc,"end"]

if (iloc>1)
{
  if (mddLoci[iloc-1,1]!=mddLoci[iloc,1])
  {
refSNPAllele <- read.table(paste0("/data/humgen/daskalakislab/1000G/EUR/EUR.chr",chr,".1KGP.bim"))
}
} else
{refSNPAllele <- read.table(paste0("/data/humgen/daskalakislab/1000G/EUR/EUR.chr",chr,".1KGP.bim"))}

locusSummary <- mddSummary %>% filter(CHR==chr & BP >= locusStart & BP <= locusEnd)
if (nrow(locusSummary)<=3) next 
tmpPathResult <- paste0('/data/humgen/daskalakislab/jajoo/SciencePaper/SuSieRelated/PilotLD/tmp',chr,locusStart,locusEnd)
write.table(locusSummary$SNP,paste0(tmpPathResult,"useThisList"),
            col.names = FALSE,row.names = FALSE,quote = FALSE)

ldMatrix <- GetLDMatrixUsing1000Genome(chr,tmpPathResult)
tmp <- ldMatrix
keepSNPs <- rowSums(is.na(ldMatrix))< nrow(ldMatrix)
ldMatrix<- ldMatrix[keepSNPs,keepSNPs]
while (sum(is.na(ldMatrix))>0)
{
  naFreq <- table(which(is.na(ldMatrix),arr.ind = TRUE)[,1])
  removeSNP <- as.numeric(names(naFreq)[order(-naFreq)[1]])
  ldMatrix <- ldMatrix[-removeSNP,-removeSNP]
}


commonSNP <- intersect(colnames(ldMatrix) , locusSummary$SNP)
locusSummary <- locusSummary[match(commonSNP,locusSummary$SNP),]
rr <- ldMatrix[locusSummary$SNP,]
rr <- rr[,locusSummary$SNP]

ww1 <- refSNPAllele[match(locusSummary$SNP,refSNPAllele$V2),]
ww1 <- ww1[match(locusSummary$SNP,ww1$V2),]
locusSummary$Z[ww1$V6 == locusSummary$A1] <- locusSummary$Z[ww1$V6 == locusSummary$A1]*-1


aaaa <- susie_rss(z=as.numeric(locusSummary$Z),R=as.matrix(rr),n=GWASn)

CredibleSetSummary <-rbind(CredibleSetSummary, c(chr,locusStart,locusEnd,
                               ncol(rr),
                               min(locusSummary$BP[unlist(aaaa$sets$cs)]),
                               max(locusSummary$BP[unlist(aaaa$sets$cs)]),
                               length(locusSummary$SNP[unlist(aaaa$sets$cs)]),"Loci")
)
if (length(aaaa$sets$cs) ==0) next 
CredibleSetsToFeed <- aaaa$sets$cs
for (ics in 1:length(CredibleSetsToFeed))
{
  CredibleSetSummary <-rbind(CredibleSetSummary, c(chr,locusStart,locusEnd,
                                                   "",
                                                   min(locusSummary$BP[CredibleSetsToFeed[[ics]]]),
                                                   max(locusSummary$BP[CredibleSetsToFeed[[ics]]]),
                                                   length(locusSummary$SNP[CredibleSetsToFeed[[ics]]]),names(CredibleSetsToFeed)[ics])
  )
}
CredibleSet <- rbind(CredibleSet,
                     cbind( locusSummary$SNP[reshape2::melt(aaaa$sets$cs)[,1]],aaaa$pip[reshape2::melt(aaaa$sets$cs)[,1]],reshape2::melt(aaaa$sets$cs)[,2],iloc))

}

save(CredibleSet, CredibleSetSummary ,file='/data/humgen/daskalakislab/jajoo/SciencePaper/SuSieRelated/MDDFineMapping//MDDCredibleSetVer02.rds')
write.table(CredibleSet,file='/data/humgen/daskalakislab/jajoo/SciencePaper/SuSieRelated/MDDFineMapping//MDDCredibleSetSNPsVer02.txt')
write.table(CredibleSetSummary,file='/data/humgen/daskalakislab/jajoo/SciencePaper/SuSieRelated/MDDFineMapping//MDDCredibleSetSsummaryVer02.txt')
