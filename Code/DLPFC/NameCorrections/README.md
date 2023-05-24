This file contains code to fix the naming of genes, exons, jxs, txs in the DLPFC
limma results. When generating the files for use with limma, I originally assumed
everything was in the same format as the R01 subjects. We later realized that there
were slight differences in column names which caused issues with the gene Symbols not
getting copied over properly. This did not affect the results but had to be fixed
after the fact.
