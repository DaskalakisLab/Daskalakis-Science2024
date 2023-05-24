plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink2
geno_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/sc48_PlinkFormat/kleinman_single_cell_n82.maf01
out_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/sc48_PlinkFormat/kleinman_single_cell_n48.maf01
subjects=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/sc48/sc48_subjects.txt

$plink --bfile $geno_file --keep $subjects --make-bed --out $out_file

mv ${out_file}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/sc48_PlinkFormat/logs
