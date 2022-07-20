## Genome-wide association analysis using TreeWAS 

TreeWAS v1.0 

**Steps prior to starting TreeWAS**
- Count the number of SNPs associated with each host
 
 1) core gene alignment 

Number of SNPs in the core region containing - 2,176,418 bp from bovienii_core_genes.core.fasta file
Generated a vcf file using snp-sites program from MSA, running the below command

Commmand: 
    
    snp-sites -v bovienii_core_genes.core.fasta > snp-sites-from-BovCore.vcf

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
### Now running TreeWAS for statistical association

**ClonalFrame Integration**

**Input for core genes**: 
  Clonalframe output

**Command**: Script in R, 

    treeWAS_clonalframeML.R

**Input for flexible genes**: 
  - Roary's pangenomic analysis output, gene_presence_and_absence.csv
  - Raxml tree - Clonalframe output tree 
  - Phenotype - a list of files looking at 
    - affine versus rest
    - intermedium versus rest (with and without reference)
    - kraussei versus rest (with and without reference)
    - texanum versus rest 

**Command**: 
    
    treeWAS-from-scratch-flexible-genes.R" 


