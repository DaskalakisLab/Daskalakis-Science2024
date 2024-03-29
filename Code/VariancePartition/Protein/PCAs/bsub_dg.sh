#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Protein/PCAs/logs/out_vp12_dg.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Protein/PCAs/logs/err_vp12_dg.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J ProDG
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Protein/PCAs/vp_dg.R