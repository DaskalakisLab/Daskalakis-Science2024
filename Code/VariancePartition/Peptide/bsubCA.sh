#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Peptide/logs/out_vp12_ca.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Peptide/logs/err_vp12_ca.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J PepCA
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Peptide/VPCA.R
