plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink2
geno_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/O771/PTSD.vcf.gz
out_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Genotype/Opiod_all

$plink --vcf $geno_file --make-bed --out $out_file

mv ${out_file}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Genotype/logs
