library(dplyr)
library(matrixStats)
library(readxl)

## =============================================================================
## Assumes the following files have been placed into working directory:
## -----------------------------------------------------------------------------
## RNAseqAmy.csv.gz
## RNAseqHipp.csv.gz
## RNAseqmPFC.csv.gz
##
## CentralAmygMfunnorm.RDS
## DGMfunnorm.RDS
## mPFCMfunnorm.RDS
## AmyFilterCpGVar0.4CMU0.4txt.gz
## HippFilterCpGVar0.4CMU0.4txt.gz
## mPFCFilterCpGVar0.4CMU0.4txt.gz
##
## disc_CentralAmyg_clean_no_GIS.RDS
## disc_DG_clean_no_GIS.RDS
## disc_mPFC_clean_no_GIS.RDS
## 
## methylation_data_dictionary_with_some_demographic_data.allyears.csv
## Kleinman_Y1_Y2_Y3_Y4_Demographics.tsv
## Dennis_addVariables.xlsx
## -----------------------------------------------------------------------------
 
rnaFiles = list.files(pattern="^RNAseq.*\\.csv\\.gz")
names(rnaFiles) = gsub(".*RNAseq|\\.csv\\.gz", "", rnaFiles)
rnaData = lapply(rnaFiles, read.csv, row.names=1, check.names=FALSE)
rnaData = lapply(rnaData, function(.) {rownames(.) = gsub("\\.\\d+$", "", rownames(.)); .})

methylFiles = list.files(pattern="Mfunnorm\\.RDS")
names(methylFiles) = gsub("Mfunnorm\\.RDS$", "", methylFiles) %>%
    gsub("CentralAmyg", "Amy", .) %>%
    gsub("DG", "Hipp", .)
methylData = lapply(methylFiles, readRDS)
cpgFiles = list.files(pattern="Var0\\.4.*txt")
names(cpgFiles) = gsub("FilterCpGVar0\\.[34]CMU0\\.4txt\\.gz", "", cpgFiles)
cpgs = lapply(cpgFiles, function(.) {
    read.table(., sep=" ", skip=1, header=FALSE, row.names=1)[ , 1]
})
cpgs = cpgs[names(methylData)]
methylData = mapply(function(meth, cpg) {meth[cpg, ]}, methylData, cpgs)

protFiles = list.files(pattern="_clean_no_GIS\\.RDS")
names(protFiles) = gsub("^.*disc_|_clean_no_GIS\\.RDS$", "", protFiles) %>%
    gsub("CentralAmyg", "Amy", .) %>%
    gsub("DG", "Hipp", .)
protData = lapply(protFiles, readRDS)

yearInfo = read.csv("methylation_data_dictionary_with_some_demographic_data.allyears.csv")
brYear = unique(yearInfo[ , c("BrNum", "year")])
brYear = structure(brYear$year, names=brYear$BrNum)

demo = read.table("Kleinman_Y1_Y2_Y3_Y4_Demographics.tsv",
                  sep="\t", header=TRUE, row.names=1, check.names=FALSE,
                  quote="", comment.char="")
demo$year = brYear[rownames(demo)]

commonBr = Reduce(intersect, c(lapply(rnaData, colnames),
                               lapply(methylData, colnames),
                               lapply(protData, colnames)))

rnaData = lapply(rnaData, function(.) {as.matrix(.[ , commonBr])})
methylData = lapply(methylData, function(.) {as.matrix(.[ , commonBr])})
protData = lapply(protData, function(.) {as.matrix(.[ , commonBr])})

## -----------------------------------------------------------------------------
## filter RNA-seq and methylation data down to similar number of features
## as protine data:
rnaSdCutoffs = lapply(rnaData, function(.) {quantile(rowSds(.), 0.75)})
methylSdCutoffs = lapply(methylData, function(.) {quantile(rowSds(.), 0.95)})

rnaForMofas = mapply(
    function(mat, cutoff) {sdm=rowSds(mat); mat[sdm >= cutoff, ]},
    rnaData,
    rnaSdCutoffs
)
names(rnaForMofas) = paste0("rna_", names(rnaForMofas))
methylForMofas = mapply(
    function(mat, cutoff) {sdm=rowSds(mat); mat[sdm >= cutoff, ]},
    methylData,
    methylSdCutoffs
)
names(methylForMofas) = paste0("methyl_", names(methylForMofas))
protForMofas = protData
names(protForMofas) = paste0("protein_", names(protForMofas))
viewsForMofa = lapply(
    c(rnaForMofas, methylForMofas, protForMofas),
    function(.) {colnames(.) = gsub("_.*", "", colnames(.)); .}
)

## -----------------------------------------------------------------------------
readExcel = function(filename, tibble=FALSE) {
    require(readxl)
    sheets = readxl::excel_sheets(filename)
    x = lapply(sheets, function(.) {
        readxl::read_excel(filename, sheet=., na=c("", "NA", "NaN"))
    })
    if (!tibble) {x = lapply(x, as.data.frame)}
    names(x) = sheets
    return(x)
}
added = readExcel("Dennis_addVariables.xlsx")[[2]]

addedByBr = unique(added[ , c("BrNum", "Dx", "Suicide012",
                              "PTSD", "MDD", "PTSD_MDD",
                              "AgeDeath", "Sex", "PMI",
                              "ancestryPC1", "ancestryPC2",
                              "ChildTrauma012", "Smoking")])
rownames(addedByBr) = addedByBr$BrNum
addedOther = added[ , setdiff(colnames(added), colnames(addedByBr))]
addedByBr = addedByBr[ , setdiff(colnames(addedByBr), "BrNum")]

demo0 = demo
demo = cbind(demo[rownames(addedByBr), ],
             addedByBr[ , setdiff(colnames(addedByBr), colnames(demo))])
for (reg in c("CentralAmyg", "DG", "mPFC")) {
    regPrime = c(CentralAmyg="Amy", DG="Hipp", mPFC="mPFC")[reg]
    addedOtherReg = addedOther[grepl(paste0("_", reg, "$"), addedOther$ID_BR), ]
    rownames(addedOtherReg) = gsub("_.*", "", addedOtherReg$ID_BR)
    addedOtherReg = addedOtherReg[ , setdiff(colnames(addedOtherReg), "ID_BR")]
    colnames(addedOtherReg) = paste0(colnames(addedOtherReg), "_", regPrime)
    demo = cbind(demo, addedOtherReg[rownames(demo), ])
}
