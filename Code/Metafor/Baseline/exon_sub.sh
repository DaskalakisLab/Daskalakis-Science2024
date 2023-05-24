#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/out_exon.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/logs/err_exon.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J Exon
Rscript /data/humgen/daskalakislab/dipietro/SciencePaper/Code/Metafor/Baseline/RNA/ExonsMeta.R