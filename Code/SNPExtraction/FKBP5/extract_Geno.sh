plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink
geno_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234_PlinkFormat/PTSD_n304.maf01.rsids
out_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/SNPExtraction/FKBP5/Genotype/rs1360780

$plink --bfile $geno_file --recodeA --out $out_file --snps rs1360780
