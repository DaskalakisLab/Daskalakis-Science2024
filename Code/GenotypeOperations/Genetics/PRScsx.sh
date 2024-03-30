#!/bin/bash

### MULTI-ANCESTRY PRS ESTIMATION: PRcsx | ARA | FEB 2023
### IF RUNNING ON SCHEDULER (define dispatch paramaters)

############ DEPENDENCIES ###############
# refer here: https://github.com/getian107/PRScsx | repo cloned, implemented through conda environment
# PRScsx version: cloned Feb 2023
#conda activate prscsx (prior to scheduling job, or running locally)

########### DEFINE VARIABLES  ###########
PATH1 = path/to/reference/panel
PATH2 = path/to/genotype/(PLINK binaries)
SST = path/to/GWAS/summary/statistics
OUT = output/directory

############### ITERATE OVER CHROMOSOME SEQ ########################
# --phi=1e-2 #global shrinkage parameter for highly polygenic traits (recom. by developers)
# if --meta=False (default) it will output ancestry-specific PRS weight, If True, output will be on trans-ethnic weights/chr

for NUM in $(seq 1 22); do

python3 $MAIN/PRScsx/PRScsx.py \
        --ref_dir=$PATH1/1KG \
        --bim_prefix=$PATH2 \
        --sst_file=$SST/sst.ancestry1,$SST/sst.ancestry2 \
        --n_gwas=12345,6789 \
        --pop=ancestry1,ancestry2 \
        --chrom=$NUM \
        --phi=1e-2 \
	--meta=True \
        --out_dir=$OUT \
        --out_name=COHORT_1KG

done
