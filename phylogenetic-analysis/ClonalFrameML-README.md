## Effect of recombination in the population 

ClonalFrameML v1.12

**Input**: 
  - bovienii_core_genes.core.fasta (from PopCOGenT),
  - RAxML_bipartitionsBranchLabels.Xenorhabdus_52_bestML (RaxML tree generated, unrooted) 

**Command**:

    ../ClonalFrameML RAxML_bipartitionsBranchLabels.Xenorhabdus_52_bestML bovienii_core_genes.core.fasta ClonalFrame -emsim 100 -label_uncorrected_tree true -output_filtered true
    Rscript cfml_results.R ClonalFrame

**Output**: 

  R/m=2.49 
  Recombination length ~200 bp 
  Number of recombination sites = 9597 sites 

Note: If the output ClonalFrame.labelled_tree.newick is rooted in iTol and then run through the TreeWAS, the clonalframe integration breaks. I think this is because the internal nodes change and the error is 
"Sequence labels do not match tree labels." 

###################################################################################################################################################################################
## ClonalFrameML with Rooted tree 
Running ClonalFrame with the rooted tree from RaxML instead (this version can be deleted later, if this version of TreeWAS results wont be used) - This version saved to ClonalFrame directory outside Paper_AllAnalyses 

**Input**: 
- bovienii_core_genes.core.fasta (from PopCOGenT), 
- RAxML_bipartitionsBranchLabels.Xenorhabdus_52_bestML_rooted  (RaxML tree generated, rooted on iTol to X.bovienii BU)

**Command**:  

    ../ClonalFrameML RAxML_bipartitionsBranchLabels.Xenorhabdus_52_bestML_rooted bovienii_core_genes.core.fasta ClonalFrame_rooted -emsim 100 -label_uncorrected_tree true -output_filtered true

**Output**: 
  R/m = 2.34
  Recombination length = ~200 bp 
  Number of recombination sites = 9485 sites
