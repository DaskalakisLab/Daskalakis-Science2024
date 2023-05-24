#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/out_meth.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/err_meth.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J Meth
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/Methylation/MethMeta.R