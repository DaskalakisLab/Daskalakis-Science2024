# PDabundanceLoader
Loads .txt tab-separated flat file output peptide or protein abundances from Proteome Discoverer (PD)

FASTA database (text) files for 2015 and 2020 human and mouse databases are provided in archives but only required to perform searches in Proteome Discoverer.

If you have already performed a search, generate a protein ID (e.g. Uniprot accession/ID) to official gene symbol two-column excel file for the loader to use.
The loader reads the protein IDs in the PD output that were derived from the FASTA used for the search. Then it assigns a UniqueID concatenating Symbol|ProteinID to each isoform.
