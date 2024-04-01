# -S /bin/bash
#$ -e /path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.e
#$ -o /path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.o
# -N MDD_PGCHwMDD_MVP
# cd to the directory from which I submitted the
# job.  Otherwise it will execute in my data directory.
echo Beginning to run R job
date
/path/to/anaconda3/envs/r_env/bin/R CMD BATCH --no-restore --no-save --no-readline -iseed=1 -fr.aa=/path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.genes.txt -fr.gg=/path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.corr.txt -fr.bb=/path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.agn.txt -fr.cc=/data/ajajoo/ASHG_TWAS/GWAS/MDD/JEPEG/MDD_PGCHwMDD_MVP.txt -fr.dd=/path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.dir.txt -fr.ee=/path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//logs/tpath_MDD_PGCHwMDD_MVP.txt -fr.ss=/path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//logs/ttpath_MDD_PGCHwMDD_MVP.txt -nsim=2 -out=/path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//logs/results_MDD_PGCHwMDD_MVP.txt /path/to/PECJPEGMIX/script/20230628/callingJpegAllcisWithPathway202306.txt &> /path/to/PECJPEGMIX/ResultsAllcisWithPathway202306//MDD_PGCHwMDD_MVP.Rout
date
sleep 120

