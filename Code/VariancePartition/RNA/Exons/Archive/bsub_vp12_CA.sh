#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/Exons/logs/out_vpY1Y2_CA.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/Exons/logs/err_vpY1Y2_CA.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J VPY1Y2_CA
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/RNA/Exons/vpY1Y2_CA.R
