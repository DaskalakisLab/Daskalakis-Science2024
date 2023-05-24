plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink2
vc_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/kleinman_single_cell_n82.maf01.vcf.gz
out_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/sc48_PlinkFormat/kleinman_single_cell_n82.maf01

$plink --vcf $vc_file --make-bed --out $out_file
