for(i in 1:22){
ala=paste0("/PRScs/PRScs.py --ref_dir=/1KG/ldblk_1kg_eur --bim_prefix=/target_cohort --sst_file=/GWAS.txt --n_gwas=Ngwas --chrom=",i," --phi=1e-2 --out_dir=/out/GWAS_EUR_chr",i)
system(ala,intern=T)
}




/plink --bfile /target_cohort --score /prscs_weights.txt 2 4 6 --out /plink_res/GWAS                
