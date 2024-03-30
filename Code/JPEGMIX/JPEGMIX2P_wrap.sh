# -S /bin/bash
#$ -e /data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.e
#$ -o /data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.o
# -N MDD_PGCHwMDD_MVP
# cd to the directory from which I submitted the
# job.  Otherwise it will execute in my data directory.
echo Beginning to run R job
date
/data/cchatzinakos/anaconda3/envs/r_env/bin/R CMD BATCH --no-restore --no-save --no-readline -iseed=1 -fr.aa=/data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.genes.txt -fr.gg=/data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.corr.txt -fr.bb=/data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.agn.txt -fr.cc=/data/ajajoo/ASHG_TWAS/GWAS/MDD/JEPEG/MDD_PGCHwMDD_MVP.txt -fr.dd=/data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.dir.txt -fr.ee=/data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//logs/tpath_MDD_PGCHwMDD_MVP.txt -fr.ss=/data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//logs/ttpath_MDD_PGCHwMDD_MVP.txt -nsim=2 -out=/data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//logs/results_MDD_PGCHwMDD_MVP.txt /data/ajajoo/PEC/PECJPEGMIX/script/20230628/callingJpegAllcisWithPathway202306.txt &> /data/ajajoo/PEC/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.Rout
date
sleep 120

