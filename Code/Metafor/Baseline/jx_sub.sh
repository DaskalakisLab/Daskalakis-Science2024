#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/out_jx.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/err_jx.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J Jx
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/RNA/JxsMeta.R