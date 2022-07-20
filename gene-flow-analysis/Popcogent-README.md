## Gene flow based analysis

PopCOGent

**Input files** : Assembled genomes of the 42 Indiana isolates 

**Manual**: https://github.com/philarevalo/PopCOGenT

**Command** : There are three steps in this analysis
1) PopCOGent clustering 
  Update the "config.sh" file to point to the 42 fasta files, output directory name. 
  Run the command PopCOGenT.sh

  **Output**: A directory that outputs three files 
  - *length_bias.txt - for length bias calculations
  - *.graphml - for visualization
  - *.cluster.tab.txt - population assignments

  Output saved in directory "popcogent clustering" 
  For visualisation the *.graphml was plotted on gephi. The network plot is saved to this directory "popcogen_42_genomes.png"

2) core gene sweep analysis
  **Input**: Requires the *_cluster.tab.txt file from the popcogent clustering step

  **Command**: 
      
      python {script name}, there are 7 scripts
      
  **Output**: A directory with core genes, trees for the 100SNP windows, nucleotide diversity, etc. 

3) Flexible gene sweep analysis
  **Input**: Genomes in fasta format, and *_cluster.tab.txt file from the popcogent clustering step

  **Command**: 
  
    bash snakemake.sh

  Update the config.yaml to include the path to the genome directory, the popcogent clustering output. 

  **Output**: Directory for each sub cluster tested. Saved under "flexible gene sweep". The main output is saved to bovienii_42_isolates.0.flex_genes.csv 
