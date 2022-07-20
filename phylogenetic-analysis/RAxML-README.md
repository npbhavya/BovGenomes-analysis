## Constructing the phylogenetic tree 

### For 61 genomes including *Xenorhabdus* and *Photorhabdus* genomes
- Multiple sequence alignment using Mugsy, performed this step by PopCOGenT

- This core gene alignment file was used as input for RAxML 

  RAxML v8.2.12  

  **Input files**: PopCOGent mugsy alignment file - Xenorhabdus-core.phy

  **Command**:
    
      raxmlHPC -s Xenorhabdus-core.phy -n Xenorhabdus_62_GTRGAMMA -m GTRGAMMA -b 12345 -# 100 -p 12345 
      raxmlHPC -m GTRGAMMA -J MRE -z RAxML_bootstrap.Xenorhabdus_62_GTRGAMMA -n Xenorhabdus_62 

  **Output**: RAxML_MajorityRuleExtendedConsensusTree.Xenorhabdus_62

Visualised on iTol, https://itol.embl.de and outgroup was selected to the Photorhabdus group 

-----------------------------------------------------------------------------------------------------

### For 53 genomes including only *Xenorhabdus* genomes, both the 42 Indiana isolates and reference genomes

- Multiple sequence alignment using Mugsy, performed this step by PopCOGenT
- Reference dependent alignment with X. bovienii CS03

- This core gene alignment file was used as input for RAxML 

  RAxML v8.2.12 

  **Input files**: PopCOGent mugsy alignment file - bovienii_core_genes.core.phylip

  **Command**: 
    
      raxmlHPC -s bovienii_core_genes.core.phylip -n Xbov_52_GTRGAMMA -m GTRGAMMA -b 12345 -# 100 -p 12345 -T 10 -k 
     
  Bootstrap 82 had the highest likelihood value of -5442075.005. The difference between the different scores aren't really high. 

  In order to get a tree with bootstrap values on it just execute RAxML as indicated below:

      raxmlHPC -m GTRGAMMA -f b -z RAxML_bootstrap.Xbov_52_GTRGAMMA -t RAxML_bootstrap.Xbov_52_GTRGAMMA_BS82 -n BS_TREE

  **Output**: 
  Time for Computation of Bipartitions 0.059640
  Tree with bipartitions written to file:  RAxML_bipartitions.BS_TREE
  Tree with bipartitions as branch labels written to file: RAxML_bipartitionsBranchLabels.BS_TREE
  Execution information file written to :  RAxML_info.BS_TREE

  To generate a consensus tree with bootstraps:
  
      raxmlHPC -m GTRGAMMA -J MRE -z RAxML_bootstrap.Xbov_52_GTRGAMMA -n Xenorhabdus_52 -k 

  Generating the best ML tree 
  **Command** : 
    
      raxmlHPC -f a -m GTRGAMMA -x 12345 -p 12345 -# 100 -s bovienii_core_genes.core.phylip -n Xenorhabdus_52_bestML

  **Output** : RAxML_bipartitionsBranchLabels.Xenorhabdus_52_bestML 
	RAxML_info.Xenorhabdus_52_bestML - log file

  After ClonalFrameML correction was performed, the resulting recombination aware tree doesnt have the bootstraps. So the RAxML_bipartitionsBranchLabels.Xenorhabdus_52_bestML_cloanlframe_corrected was 
  updated to include the new branch lengths from clonalframe. 

  This tree was uploaded to iTol for visulization

