#!/usr/bin/env Rscript

library(data.table)
library(dplyr)
library(emmeans)
library(ggplot2); theme_set(theme_bw())
library(limma)  ## for removeBatchEffect
library(matrixStats)
library(MASS)
library(MOFA2)
library(pheatmap)
library(tidyr)
library(WriteXLS)

source("load_data_downsampled.R")

## -----------------------------------------------------------------------------
## use limma's removeBatchEffect to de-batch methylation data:
methDebatched = lapply(methylForMofas, function(meth) {removeBatchEffect(
    meth,
    batch = demo[commonBr, "year"],
    design = model.matrix(~ Sex + AgeDeath + Race + PrimaryDx,
                          data = demo[commonBr, ])
)})
## replace methylation data in viewsForMofa with debatched versions:
viewsForMofa[names(methDebatched)] =
        lapply(methDebatched, function(.) {.[ , commonBr]})

## -----------------------------------------------------------------------------
## run MOFA:
set.seed(123)
## reticulate::use_python("/path/to/python3", required=TRUE)
mofaObj = create_mofa(viewsForMofa)
modOpt = get_default_model_options(mofaObj); modOpt$num_factors=30
mofaObj = prepare_mofa(object = mofaObj,
                       data_options = get_default_data_options(mofaObj),
                       model_options = modOpt,
                       training_options = get_default_training_options(mofaObj))
mofaObj = run_mofa(mofaObj, "mofa.hdf5", use_basilisk=FALSE)

## or comment above out and read saved object from file if already run:
## mofaObj = load_model("mofa.hdf5")

## -----------------------------------------------------------------------------
n = sum(mofaObj@dimensions$N)
meta = data.frame(
    row.names = samples_names(mofaObj)[[1]],
    sample = samples_names(mofaObj)[[1]],
    subj_id = gsub("_.*", "", samples_names(mofaObj)[[1]])
)
meta$age = demo[meta$subj_id, "AgeDeath"]
meta$race  = demo[meta$subj_id, "Race"]
meta$sex = demo[meta$subj_id, "Sex"]
meta$dx = demo[meta$subj_id, "PrimaryDx"]
meta$year = demo[meta$subj_id, "year"]
for (clm in c("ex", "inhib", "Tcell")) {
    for (reg in c("Amy", "Hipp", "mPFC")) {
        clmReg = paste0(clm, "_", reg)
        meta[[clmReg]] = demo[meta$subj_id, clmReg]
    }
}

samples_metadata(mofaObj) = meta

facs = get_factors(mofaObj)$group1

drop1(lm(facs[ , "Factor13"] ~ sex + race + age + dx, data=meta), test="F")["dx", "Pr(>F)"]
## 8.656841e-05
summary(lm(facs[ , "Factor13"] ~ sex + race + age + dx, data=meta))
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -2.151756   0.072128 -29.832  < 2e-16 ***
## sexM        -0.021910   0.034434  -0.636 0.525268    
## raceAS      -0.230094   0.252688  -0.911 0.363553    
## raceCAUC    -0.096784   0.049709  -1.947 0.052862 .  
## raceHISP    -0.413611   0.182314  -2.269 0.024300 *  
## age          0.047741   0.001148  41.589  < 2e-16 ***
## dxMDD        0.152821   0.040469   3.776 0.000207 ***
## dxPTSD       0.159776   0.041550   3.845 0.000159 ***
emmeans(lm(facs[ , "Factor13"] ~ sex + race + age + dx, data=meta), pairwise ~ dx)
## contrast       estimate     SE  df t.ratio p.value
## Control - MDD  -0.15282 0.0405 211  -3.776  0.0006
## Control - PTSD -0.15978 0.0415 211  -3.845  0.0005
## MDD - PTSD     -0.00695 0.0416 211  -0.167  0.9847

drop1(lm(facs[ , "Factor13"] ~ sex + age + dx, data=meta), test="F")["dx", "Pr(>F)"]
## 9.884137e-05
summary(lm(facs[ , "Factor13"] ~ sex + age + dx, data=meta))
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -2.232607   0.061172 -36.497  < 2e-16 ***
## sexM        -0.038647   0.034230  -1.129 0.260148    
## age          0.047788   0.001158  41.284  < 2e-16 ***
## dxMDD        0.155385   0.040691   3.819 0.000176 ***
## dxPTSD       0.157416   0.041974   3.750 0.000227 ***
emmeans(lm(facs[ , "Factor13"] ~ sex + age + dx, data=meta), pairwise ~ dx)
## contrast       estimate     SE  df t.ratio p.value
## Control - MDD  -0.15538 0.0407 214  -3.819  0.0005
## Control - PTSD -0.15742 0.0420 214  -3.750  0.0007
## MDD - PTSD     -0.00203 0.0419 214  -0.049  0.9987

drop1(lm(facs[ , "Factor14"] ~ sex + race + age + dx, data=meta), test="F")["dx", "Pr(>F)"]
summary(lm(facs[ , "Factor14"] ~ sex + race + age + dx, data=meta))
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -0.309943   0.172581  -1.796   0.0739 .  
## sexM        -0.037037   0.082390  -0.450   0.6535    
## raceAS      -0.093273   0.604605  -0.154   0.8775    
## raceCAUC     0.133052   0.118939   1.119   0.2646    
## raceHISP     0.006879   0.436223   0.016   0.9874    
## age         -0.001220   0.002747  -0.444   0.6573    
## dxMDD        0.415473   0.096829   4.291 2.71e-05 ***
## dxPTSD       0.403706   0.099416   4.061 6.89e-05 ***
emmeans(lm(facs[ , "Factor14"] ~ sex + race + age + dx, data=meta), pairwise ~ dx)
## contrast       estimate     SE  df t.ratio p.value
## Control - MDD   -0.4155 0.0968 211  -4.291  0.0001
## Control - PTSD  -0.4037 0.0994 211  -4.061  0.0002
## MDD - PTSD       0.0118 0.0996 211   0.118  0.9923

drop1(lm(facs[ , "Factor14"] ~ sex + age + dx, data=meta), test="F")["dx", "Pr(>F)"]
## 1.243133e-05
summary(lm(facs[ , "Factor14"] ~ sex + age + dx, data=meta))
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -0.205786   0.144324  -1.426    0.155    
## sexM        -0.028241   0.080760  -0.350    0.727    
## age         -0.001126   0.002731  -0.412    0.681    
## dxMDD        0.414381   0.096004   4.316 2.43e-05 ***
## dxPTSD       0.405452   0.099032   4.094 6.01e-05 ***
emmeans(lm(facs[ , "Factor14"] ~ sex + age + dx, data=meta), pairwise ~ dx)
## contrast       estimate     SE  df t.ratio p.value
## Control - MDD  -0.41438 0.0960 214  -4.316  0.0001
## Control - PTSD -0.40545 0.0990 214  -4.094  0.0002
## MDD - PTSD      0.00893 0.0988 214   0.090  0.9955

## -----------------------------------------------------------------------------
mofaWeights = lapply(get_weights(mofaObj), function(.) {
    data.frame(feature=rownames(.), ., check.names=FALSE)
})
## WriteXLS(mofaWeights, "mofa_weights.xlsx",
##          BoldHeaderRow=TRUE, FreezeRow=1, FreezeCol=1, row.names=FALSE)
