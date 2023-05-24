#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/TempNoQSVs/logs/out_vp_CA.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/TempNoQSVs/logs/err_vp_CA.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J VPCA
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/TempNoQSVs/vpY1Y2_all_CA.R
