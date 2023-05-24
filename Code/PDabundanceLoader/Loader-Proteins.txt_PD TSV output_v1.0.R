## Proteins.txt (PD) Loader for TMT Reporter Abundance from Protein.txt TSV files out of PD
## Eric Dammer -- Seyfried Lab Proteomics (2021)
#####################################################################################

## Prepare the workspace.

#rm(list = ls())
#dev.off()
options(stringsAsFactors = FALSE)

########### Configuration ########################
rootdir="E:/OneDrive/CSF.plasma.neat.deplete/8.OlinkAdded/"

## Specify dataType as one of the following 3:
## *   RAW Reporter Abundance (sometimes prefered for biofluid)
## **  Normalized Reporter Abundance (default/recommended)
## *** Abundance Ratio (/ single GIS control channel precalculated by PD)

dataType="rawAbundance"
#** dataType="normAbundance"
#*** dataType="abundanceRatio"

## Define batches, or a single multiconsensus, to load in a character vector
# Each batch file has a unique number, indicating the batch:
#  plexes <- c("b1","b2","b3","b4","b5")
# Or a single multiconsensus file can use any 1 placeholder string, which will not be considered as batch (just used for data.frame lists' name)
plexes <- c("multiconsensus")

## Specify minimum confidence level for proteins to load/keep from PD Proteins.txt input
minConfidence="medium"  #currently ""low" "medium" or "high" implemented; high is 1% FDR generally.

## Specify Proteins.txt file(s)
fileToLoad="../csfplasma_neatandtop14dep_multiconcensus_Proteins.txt"
## if multiple plexes, create a name template if more than one file, using XXX in the template name, to be replaced once for each of the multiple plexes
# fileToLoad="csfplasma_neatandtop14dep_XXX_Proteins.txt"

outputFilename="1b.PD.TMT_rawAbundances.NoCorrection.csv"

##END CONFIGURATION SECTION
###################################################

setwd(rootdir)
datadir <- paste0(rootdir)

#Load your species-specific lookup for UniprotID (Accession) to gene symbol THIS IS A 2 COLUMN FILE SEPARATE FROM PD OUTPUT
symbolLookup<-readxl::read_excel("2020-preference+2015_UniprotID-symbolLookupTableForR.xlsx") #column names are set below to "Uniprot.ID" and "Symbol"
symbolLookup<-as.data.frame(symbolLookup)
colnames(symbolLookup)<-c("Uniprot.ID","Symbol")


proteinGroups<-exprMat0<-UIDs<-Symbols<-list()
for (i in plexes) {
  ## ++ below line may require use of the variable plexes, if multiple non-multiconsensus files are being loaded.
  if(length(plexes)==1) proteinGroups[[i]]<-read.delim(file=paste0(datadir,"/",fileToLoad),sep="\t",header=TRUE) #,row.names=1 #decoys can have same ID
  if(length(plexes)>1) proteinGroups[[i]]<-read.delim(file=paste0(datadir,"/",gsub(i,"XXX",fileToLoad)),sep="\t",header=TRUE) #,row.names=1 #decoys can have same ID

  dim(proteinGroups[[i]])
  # table(proteinGroups[[i]]$Protein.FDR.Confidence..Combined) # all hits may be prefiltered "High" confidence, or there may be high/medium/low
  # notHighConfCount=length(which(!proteinGroups[[i]]$Protein.FDR.Confidence..Combined=="High"))
  originalRows=nrow(proteinGroups[[i]])
  if (dataType=="rawAbundance")  keepColIndices=which(grepl(paste0("Abundance..F\\d+.."), colnames(proteinGroups[[i]])))
  if (dataType=="normAbundance")  keepColIndices=which(grepl(paste0("Abundances..Normalized...F\\d+.."), colnames(proteinGroups[[i]])))
  if (dataType=="abundanceRatio") keepColIndices=which(grepl("Abundance.Ratio...F\\d+..", colnames(proteinGroups[[i]])))

  proteinGroups[[i]]$Confidence.Master<-paste0(proteinGroups[[i]]$Protein.FDR.Confidence,".",proteinGroups[[i]]$Master)
  if (minConfidence=="high") keepRowIndices=which(proteinGroups[[i]]$Confidence.Master=="High.IsMasterProtein")
  if (minConfidence=="medium") keepRowIndices=which(proteinGroups[[i]]$Confidence.Master=="High.IsMasterProtein" | proteinGroups[[i]]$Confidence.Master=="Medium.IsMasterProtein")
  if (minConfidence=="low") keepRowIndices=which(proteinGroups[[i]]$Confidence.Master=="High.IsMasterProtein" | proteinGroups[[i]]$Confidence.Master=="Medium.IsMasterProtein" | proteinGroups[[i]]$Confidence.Master=="Low.IsMasterProtein")

  if (dataType=="rawAbundance") cat(paste0("Imported data for plex ",i," has ",originalRows,"x",ncol(proteinGroups[[i]])," rows x columns; ",length(keepRowIndices)," ",minConfidence,"+ confidence master proteins. RAW abundance is available for ",length(keepColIndices)," samples in file.\n"))
  if (dataType=="normAbundance") cat(paste0("Imported data for plex ",i," has ",originalRows,"x",ncol(proteinGroups[[i]])," rows x columns; ",length(keepRowIndices)," ",minConfidence,"+ confidence master proteins. Norm. Abundance is available for ",length(keepColIndices)," samples in file.\n"))
  if (dataType=="abundanceRatio") cat(paste0("Imported data for plex ",i," has ",originalRows,"x",ncol(proteinGroups[[i]])," rows x columns; ",length(keepRowIndices)," ",minConfidence,"+ confidence master proteins. Ratio/GIS(126) is available for ",length(keepColIndices)," samples in file.\n"))

  #make a matrix of just LFQ values with rownames as UniqueID (decoys removed, so they are truly unique now)
  exprMat0[[i]]<-proteinGroups[[i]][c(keepRowIndices),c(keepColIndices)]

  #Take first UniprotID as accession.
  UIDs[[i]]<-proteinGroups[[i]][keepRowIndices,"Accession"]
  Symbols[[i]]<- sapply(UIDs[[i]],function(x) symbolLookup[match(x,symbolLookup$Uniprot.ID),"Symbol"])
  #see unlooked-up accessions; using a text editor, you can add the missing lookups to the end of symbolLookup csv above.
  UIDs[[i]][which(is.na(Symbols[[i]]))]
  #only 18 UniprotIDs do not lookup in the 2020+2015 symbolLookup XLSX.

  rownames(exprMat0[[i]])<-paste0(Symbols[[i]],"|",UIDs[[i]])
  exprMat0[[i]]<-as.matrix(exprMat0[[i]])
  dim(exprMat0[[i]])

  if (dataType=="rawAbundance") if (length(plexes)==1) colnames(exprMat0[[i]])<-gsub("..Sample","",gsub("..Control","",gsub("Abundance..F(\\d+)..(\\d+.)","b\\1\\.\\2",colnames(exprMat0[[i]]))))   #For unnormalized Abundance Pattern, 1 multiconsensus
  if (dataType=="rawAbundance") if (length(plexes) >1) colnames(exprMat0[[i]])<-paste0(i,".",gsub("..Sample","",gsub("..Control","",gsub("Abundance..F\\d+..(\\d+[N|C|\\.]).*","\\1",colnames(exprMat0[[i]])))))  #For unnormalized Abundance Pattern, multiple plexes
  if (dataType=="normAbundance") if (length(plexes)==1) colnames(exprMat0[[i]])<-gsub("..Sample","",gsub("..Control","",gsub("Abundances..Normalized...F(\\d+)..(\\d+.)","b\\1\\.\\2",colnames(exprMat0[[i]]))))   #For Normalized Abundance Pattern, 1 multiconsensus
  if (dataType=="normAbundance") if (length(plexes) >1) colnames(exprMat0[[i]])<-paste0(i,".",gsub("..Sample","",gsub("..Control","",gsub("Abundances..Normalized...F\\d+..(\\d+[N|C|\\.]).*","\\1",colnames(exprMat0[[i]])))))  #For Normalized Abundance Pattern, multiple plexes
  if (dataType=="abundanceRatio") if (length(plexes)==1) colnames(exprMat0[[i]])<-gsub("Abundance.Ratio...F(\\d+)..(\\d+[N|C|\\.]).*","b\\1\\.\\2",colnames(exprMat0[[i]]))   #For Abundance Ratio Pattern, 1 multiconsensus
  if (dataType=="abundanceRatio") if (length(plexes) >1) colnames(exprMat0[[i]])<-paste0(i,".",gsub("Abundance.Ratio...F\\d+..(\\d+[N|C|\\.]).*","\\1",colnames(exprMat0[[i]]))) #For Abundance Ratio Pattern, multiple plexes
}


#Imported data for plex multiconsensus has 5012x691 rows x columns; 3730 high+ confidence master proteins. RAW abundance is available for 168 samples in file.
#Imported data for plex multiconsensus has 5012x691 rows x columns; 4492 medium+ confidence master proteins. RAW abundance is available for 168 samples in file.

#clean up data structures we will not use again
rm(proteinGroups)
rm(UIDs)
rm(Symbols)
rm(symbolLookup)
rm(keepColIndices)

#tally how many unique isoforms, and gene products, we have in our dataset
uniqueProtIDs<-vector()
for (i in plexes) { uniqueProtIDs<-unique(c(uniqueProtIDs,rownames(exprMat0[[i]]))) }
length(uniqueProtIDs)
#4492 isoforms

uniqueSymbols<-unique(as.data.frame(do.call(rbind,strsplit(as.character(uniqueProtIDs),"[|]")))[,1])
length(uniqueSymbols)
#4145 gene products

#if plexes count > 1, assemble the multi-plex protein abundance matrix:
if (length(plexes)>1) {
  cleanDat<-matrix(NA,nrow=length(uniqueProtIDs),ncol=0)
  allPlexes<-ls(exprMat0)
  for (eachPlex in allPlexes) {
    plexDF<-t(sapply(uniqueProtIDs,function(x)  tryCatch(exprMat0[[eachPlex]][x,], error=function(repNA) rep(NA,ncol(exprMat0[[eachPlex]]))) ))
    cleanDat<-cbind(cleanDat,plexDF)
    colnames(cleanDat)[(ncol(cleanDat)-(ncol(exprMat0[[eachPlex]])-1)):ncol(cleanDat)]<-colnames(exprMat0[[eachPlex]])
  }
  cleanDat.new<-cleanDat
  #for (i in 1:ncol(cleanDat)) colnames(cleanDat.new)[i]<-paste0("b",colnames(cleanDat)[i])
} else {   # multiconsensus in 1 loaded file
  cleanDat.new<-exprMat0[[plexes]]
}

##Change single digit batch numbers to 0#.
colnames(cleanDat.new)<-gsub("b(\\d)\\.(.*)","b0\\1.\\2",colnames(cleanDat.new))

write.csv(cleanDat.new, file=outputFilename)

## end protein loader routine
