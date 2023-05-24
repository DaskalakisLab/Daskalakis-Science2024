plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink2
geno_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Genotype/Opiod_all_RSIDs
out_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Genotype/DLPFC_231
keep_IDs=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/IDsToKeep/dlpfc231IDs.txt

$plink --bfile $geno_file --make-bed --keep $keep_IDs --out $out_file --not-chr X,Y,MT

mv ${out_file}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Genotype/logs
