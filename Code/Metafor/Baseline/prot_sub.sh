#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/out_prot.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/err_prot.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J Prot
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/Protein/ProteinMeta.R