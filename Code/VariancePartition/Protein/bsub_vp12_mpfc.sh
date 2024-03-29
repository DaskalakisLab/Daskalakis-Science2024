#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Protein/logs/out_vp12_mpfc.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Protein/logs/err_vp12_mpfc.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J PromPFC
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/VariancePartition/Protein/VarPartY1Y2_mPFC.R