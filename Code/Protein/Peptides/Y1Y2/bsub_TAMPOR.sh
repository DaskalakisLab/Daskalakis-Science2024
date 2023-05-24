#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Protein/Peptides/logs/out_tampor.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Protein/Peptides/logs/err_tampor.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J tampor
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Protein/Peptides/TAMPORY1Y2.R
