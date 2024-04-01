##Runtime instructions 

#If you have LDSC installed using conda, per their guidelines, load the LDSC module.
 conda activate LDSC


#Filter your dataset to the SNP list that is used in LDSC
#This is achieved by joining the SNP list and your file

#Notice that this assumes that column 1 is the SNP column (noted by rs-id), and that the SNP column header is named SNP. 
#If the SNP column is not column 1, alter your commands
#  join  -2 1  should  instead be -2 column_number_of_snp_here
# LC_ALL=C sort -k1b,1  should instead be  LC_ALL=C sort -kcolumn_number_of_snp_hereb,column_number_of_snp_here
# LC_ALL=C sets the locale so that rs-ids can be sorted properly. If you do not set the locale to C, join will not work


LC_ALL=C join -1 1 -2 3  <(awk '{print $1}' /home/genetics/LDSC/eur_w_ld_chr/w_hm3.snplist | LC_ALL=C sort -k1b,1 ) <(zcat eur_ptsd_pcs_v4_aug3_2021.fuma.gz | sed 's/MarkerName/SNP/'  |  LC_ALL=C sort -u -k3b,3 ) > eur_ptsd_pcs_v4_aug3_2021.fuma.gz.premunge

#Now munge the summary statistics to the LD score regresison format
#Having to set sample size is necessary, the summary data sets don't have this in the file itself
#Sample sizes are written in the report from MVP

 /home/genetics/LDSC/ldsc-master/munge_sumstats.py --chunksize 500000  --sumstats eur_ptsd_pcs_v4_aug3_2021.fuma.gz.premunge  --N-col Weight --frq Freq1 --a1 Allele1 --a2 Allele0 --out eur_ptsd_pcs_v4_aug3_2021.fuma.gz.munge.gz

#Note: this appends .sumstats.gz to your file name


  /home/genetics/LDSC/ldsc-master/ldsc.py \
 --h2  eur_ptsd_pcs_v4_aug3_2021.fuma.gz.munge.gz.sumstats.gz \
 --ref-ld-chr /home/genetics/LDSC/eur_w_ld_chr/ \
 --w-ld-chr  /home/genetics/LDSC/eur_w_ld_chr/ \
 --out eur_ptsd_pcs_v4_aug3_2021.fuma.gz_heritability_noprev
 
