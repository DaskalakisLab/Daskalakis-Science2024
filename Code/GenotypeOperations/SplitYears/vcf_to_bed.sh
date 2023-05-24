plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink2
geno_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/PTSD_n304.maf01.vcf.gz
out_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234_PlinkFormat/PTSD_n304.maf01

$plink --vcf $geno_file --make-bed --out $out_file

mv ${out_file}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234_PlinkFormat/logs
