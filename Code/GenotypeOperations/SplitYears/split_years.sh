plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink2
geno_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234_PlinkFormat/PTSD_n304.maf01.1000G
out_fileY1Y2=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1Y2/PTSD_Y1Y2_n150.maf01
out_fileY3=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY3/PTSD_Y3_n81.maf01
keep_Y1Y2=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/Y1Y2SampleIDs.txt
keep_Y3=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/Y3SampleIDs.txt


$plink --bfile $geno_file --make-bed --keep $keep_Y1Y2 --out $out_fileY1Y2
$plink --bfile $geno_file --make-bed --keep $keep_Y3 --out $out_fileY3

mv ${out_fileY1Y2}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1Y2/logs
mv ${out_fileY3}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY3/logs



plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink2
geno_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234_PlinkFormat/PTSD_n304.maf01.rsids
out_fileY1Y2=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1Y2/PTSD_Y1Y2_n150.maf01.rsids
out_fileY3=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY3/PTSD_Y3_n81.maf01.rsids
keep_Y1Y2=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/Y1Y2SampleIDs.txt
keep_Y3=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/Y3SampleIDs.txt


$plink --bfile $geno_file --make-bed --keep $keep_Y1Y2 --out $out_fileY1Y2
$plink --bfile $geno_file --make-bed --keep $keep_Y3 --out $out_fileY3

mv ${out_fileY1Y2}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1Y2/logs
mv ${out_fileY3}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY3/logs
