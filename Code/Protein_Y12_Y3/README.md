TAMPOR Normalization steps:

1. Run PDabundanceLoader script:
/data/humgen/daskalakislab/dipietro/SciencePaper/Code/PDabundanceLoader/Loader-Proteins.txt_PD TSV output_v1.0.R
/data/humgen/daskalakislab/dipietro/SciencePaper/Code/PDabundanceLoader/Loader-peptideGroups_PD TSV output_v1.0.R

2. Create dat and trait files for use in TAMPOR:
/data/humven/daskalakislab/dipietro/SciencePaper/Code/Protein/Proteins/batch1/Create_Trait_Files.R
/data/humven/daskalakislab/dipietro/SciencePaper/Code/Protein/Peptides/batch1/Create_Dat_Files.R

3. Run TAMPOR code:
/data/humven/daskalakislab/dipietro/SciencePaper/Code/Protein/Proteins/batch1/TamporBRSpecific.R
/data/humven/daskalakislab/dipietro/SciencePaper/Code/Protein/Peptides/batch1/TAMPORbatch1.R
