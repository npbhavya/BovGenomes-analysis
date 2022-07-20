TreeWAS v1.0 

###################################################################################################################
Pre-req: before running treeWAS counted the number of SNPs associated with each host (no stats included) from 
1) core gene alignment 

Number of SNPs in the core region containing - 2,176,418 bp from bovienii_core_genes.core.fasta file
Generated a vcf file using snp-sites program from MSA, running the below command

Commmand: snp-sites -v bovienii_core_genes.core.fasta > snp-sites-from-BovCore.vcf

Total number of SNP sites - 171,018
1) Affine group - 6 SNPs
2) Intermedium group with references - 22 SNPs
3) Intermedium group without references - 73 SNPs
4) Kraussei group with referneces - 0 SNPs
5) Kraussei with 1 reference - 0 SNPs
6) Kraussei with no references - 0 SNPs
7) Texanum - 0 SNPs

2) From Roary gene_presence_absence.xlsx 
From Roary, counting the number of unique genes for gene_presence_absence_table.xlsx

                with ref        without ref
S.interemedium  47              5
S.affine        0               0
S.texanum       8               8
S. kraussei     0               3

######################################################################################################################
Now running TreeWAS for statistical association

### These are the results using the unrooted tree - saved to directory "Unrooted tree"

ClonalFrame Integration

Input: Clonalframe output

Command: Script in R - "treeWAS_clonalframeML.R"

Roary input to assess the genes associated with host from the flexible genome 

Input: Roary - gene_presence_absences2.csv file that has the list of genomes and presence/absence of genes found in all the genomes 
Raxml tree - Clonalframe output tree 
Phenotype - a list of files looking at 
	- affine versus rest
	- intermedium versus rest (with and without reference)
	- kraussei versus rest (with and without reference)
	- texanum versus rest 

Command: Saved to script "treeWAS-from-scratch-flexible-genes.R" 

#####################################################################################################################################


