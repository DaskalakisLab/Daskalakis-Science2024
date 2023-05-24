plink=/data/humgen/daskalakislab/dipietro/Tools/PLINK/plink2
geno_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Genotype/Opiod_all
out_file=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Genotype/Opiod_all_RSIDs
rsids=/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RSIDs/RSID_Map.txt

$plink --bfile $geno_file --update-name $rsids --make-bed --out $out_file

mv ${out_file}.log /data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Genotype/logs
