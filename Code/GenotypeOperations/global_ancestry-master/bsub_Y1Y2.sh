#!/bin/bash 
#BSUB -o /data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenotypeOperations/global_ancestry-master/logs/out_global_ancestry_Y1Y2.txt
#BSUB -e /data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenotypeOperations/global_ancestry-master/logs/err_global_ancestry_Y1Y2.txt
#BSUB -W 100:30
#BSUB -q bigmem
#BSUB -M 64000
#BSUB -J GAY1Y2
bash /data/humgen/daskalakislab/dipietro/SciencePaper/Code/GenotypeOperations/global_ancestry-master/ancestry_pipeline_Y1Y2.sh
