PopCOGent

Input files : Assembled genomes of the 42 Indiana isolates 
Saved in bov_with_ref_fasta

Manual: https://github.com/philarevalo/PopCOGenT
Command : There are three steps in this analysis
1) PopCOGent clustering 
Update the "config.sh" file to point to the 42 fasta files, output directory name. 
Run the command PopCOGenT.sh

Output: A directory that outputs three files 
- *length_bias.txt - for length bias calculations
- *.graphml - for visualization
- *.cluster.tab.txt - population assignments

Output saved in directory "popcogent clustering" 
For visualisation the *.graphml was plotted on gephi. The network plot is saved to this directory "popcogen_42_genomes.png"

2) core gene sweep analysis
Input: Requires the *_cluster.tab.txt file from the popcogent clustering step

Command: python {script name}, there are 7 scripts. Run them sequentially one after the other

Output: A directory with core genes, trees for the 100SNP windows, nucleotide diversity, etc. 
Saved to "Daves_Run" directory

Note: This step was done by Dave VanIngsberghe. Since the core gene sweeps start and stop are provided but not which genome/ contig like the flexible gene sweep result. 
Prokka was run again on Dave provided MC081 contig. MC081 our version was fragmented, but Dave I believe concatenated the contigs toegther (scaffolded) - From email 
"Since phybreak needs only one closed genome to organize the order of the alignment blocks, you can still run phybreak on draft genomes by either randomly concatenating all 
of the contigs from one genome together, separated by 1000s of N's, or scaffold them against another closed genome. Since reference based scaffolding puts contigs into a 
somewhat more biologically meaningful order and it's not so difficult to do, that's the option I went for. However, random or reference based scaffolding won't affect the 
results in any way since scaffolding doesn't throw out any sequence information (everything is kept) and won't change how the alignment program MUGSY creates alignment blocks. 
Really, the order is only useful for visualizing genome-wide trends of phylogenetic distances and things like that more easily"

So taking the MC081 core identified region from Xbov.core and ran prokka for annotations. The resulting prokka annotation saved to align/MC081.core.


3) Flexible gene sweep analysis
Input: Genomes in fasta format, and *_cluster.tab.txt file from the popcogent clustering step
Reran this again with LD031000bp file. So results have been updated

Command: bash snakemake.sh
Update the config.yaml to include the path to the genome directory, the popcogent clustering output. 

Output: Directory for each sub cluster tested. Saved under "flexible gene sweep". The main output is saved to bovienii_42_isolates.0.flex_genes.csv 

Needs to be redone: 
Consolidating all the outputs, the excel sheet holds the main results - "core_gene_sweeps_annotation.xlsx" and "flexible_gene_sweep_MainCluster0.flex_genes.xlsx" 


