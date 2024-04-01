#$ -S /bin/bash
#$ -e se_ss=3.txt
#$ -o so_ss=3.txt
#$ -cwd
#$ -N my_smr
#$ -pe smp 10
#$ -l h_vmem=100G


myAr2=("Adipose_Subcutaneous" "Adipose_Visceral_Omentum" "Adrenal_Gland" "Artery_Aorta" "Artery_Coronary" "Artery_Tibial" "Heart_Atrial_Appendage" "Heart_Left_Ventricle" "Whole_Blood")

i=1
for filename in /SMR/*.ma; do
 for j in ${myAr2[@]}; do
      ss=$(echo $filename | sed "s/.*\///")
     /smr-1.3.1-linux-x86_64/smr-1.3.1 --bfile /refpan --gwas-summary $filename --beqtl-summary /SMR/$j/$j --out /SMR_Res/${ss}_in_${j} --heidi-mtd 0 --thread-num 10
	  done
let "i=i+1"
done
