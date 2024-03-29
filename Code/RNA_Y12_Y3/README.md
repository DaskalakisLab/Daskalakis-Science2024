Code to normalize RNA related data and run the subsequent limma analyses. 
Limma_functions.R contains the functions and wrapper code needed to run all analyses.
Within the subfolders there will be the following:

01_DGE.R - prep data in a format that will be used for voom normalization
02_voom.R - voom normalization code
Limma.R - run baseline limma code
Limma_Sex.R - run sex specific limma analyses

Within the Tx folder scripts 01 and 02 are not used and instead log2TMM.R is used
to normalize the code as this data comes already in TMM format and voom is not 
applicable.
