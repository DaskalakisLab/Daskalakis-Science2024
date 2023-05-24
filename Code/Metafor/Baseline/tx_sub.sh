#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/out_tx.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/err_tx.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J Tx
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/RNA/TxsMeta.R