Code to subset the O771.vcf file (opiod study from LIBD) to the 231 DLPFC subjects
and the 48 subjects which map to Artemis' single cell cohort. I have noticed for 
multiple vcf files that although information about RSIDs is contained within the file
the process of converting to bed/bim/fam, removes these IDs and reverts to Chr:Pos
format. This can be fixed using the code in extractRSIDs.R and addRSIDs.sh.
