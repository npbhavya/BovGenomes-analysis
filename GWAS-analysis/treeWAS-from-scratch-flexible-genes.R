library(devtools)
#install_github("caitiecollins/treeWAS", build_vignettes = TRUE)
library(treeWAS)
library(ape)
library(adegenet)
library(png)
library(grid)

## Read data from file: 53 genomes
gen_absence_presence <- read.csv(file = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/Roary/bov-53-90pid-oldLD03/gene_presence_absence_R.csv", header = TRUE, row.names = 1)
snps <-t(gen_absence_presence)

## Read tree from a Newick/New Hampshire file:
tree <- read.tree(file = "OneDrive - Indiana University/BovGenomeShared/Clonalframe-oldResults/bov53genomes-mugsyAlignment_RAxMLRooted/bov53genomes-mugsyAlignment_RAxMLRooted.labelled_tree.newick")

##affine=1, intermedium=0, kraussei=0, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_affine.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## Cross-check labels with each other:
all(tree$tip.label %in% rownames(snps))
all(rownames(snps) %in% tree$tip.label)
all(tree$tip.label %in% names(phen))
all(names(phen) %in% tree$tip.label)
all(names(phen) %in% rownames(snps))
all(rownames(snps) %in% names(phen))

## Load continuous phenotype:
data(phen.cont)
## Examine phen distribution:
hist(phen.cont)

## Get ranks of phen:
phen.cont.rank <- rank(phen.cont, ties.method = "average")

## Examine distribution of phen ranks:
hist(phen.cont.rank)

## Store original phen: 
phen.cont.ori <- phen.cont

## Replace phen with ranks of phen:
phen.cont <- phen.cont.rank

#treeWAS functions 
out <- treeWAS(snps,
               phen,
               tree = tree,
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               mem.lim = FALSE,
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.05,
               p.value.correct = c("bonf", "fdr", FALSE),
               p.value.by = c("count", "density"),
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/treeWAS/treeWAS_53Isolates_flexibleGenes_OldRoary_OldRAxMLTree/Affine_versus_rest.pdf",
               seed = NULL)
print (out)

##affine=0, intermedium=1, kraussei=0, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_intermedium_ref_included.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## Cross-check labels with each other:
all(tree$tip.label %in% rownames(snps))
all(rownames(snps) %in% tree$tip.label)
all(tree$tip.label %in% names(phen))
all(names(phen) %in% tree$tip.label)
all(names(phen) %in% rownames(snps))
all(rownames(snps) %in% names(phen))

## Load continuous phenotype:
data(phen.cont)
## Examine phen distribution:
hist(phen.cont)

## Get ranks of phen:
phen.cont.rank <- rank(phen.cont, ties.method = "average")

## Examine distribution of phen ranks:
hist(phen.cont.rank)

## Store original phen: 
phen.cont.ori <- phen.cont

## Replace phen with ranks of phen:
phen.cont <- phen.cont.rank

#treeWAS functions 
out <- treeWAS(snps,
               phen,
               tree = c("BIONJ", "NJ", "parsimony", "BIONJ*", "NJ*"),
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               mem.lim = FALSE,
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.05,
               p.value.correct = c("bonf", "fdr", FALSE),
               p.value.by = c("count", "density"),
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/treeWAS/treeWAS_53Isolates_flexibleGenes_OldRoary_OldRAxMLTree/Phenotype_intermedium_ref_included_flexible_genes_redidtree2.pdf",
               seed = NULL)
print(out)

##affine=0, intermedium=1, kraussei=0, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_intermedium_ref_NOTincluded.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## Cross-check labels with each other:
all(tree$tip.label %in% rownames(snps))
all(rownames(snps) %in% tree$tip.label)
all(tree$tip.label %in% names(phen))
all(names(phen) %in% tree$tip.label)
all(names(phen) %in% rownames(snps))
all(rownames(snps) %in% names(phen))

## Load continuous phenotype:
data(phen.cont)
## Examine phen distribution:
hist(phen.cont)

## Get ranks of phen:
phen.cont.rank <- rank(phen.cont, ties.method = "average")

## Examine distribution of phen ranks:
hist(phen.cont.rank)

## Store original phen: 
phen.cont.ori <- phen.cont

## Replace phen with ranks of phen:
phen.cont <- phen.cont.rank

#treeWAS functions 
out <- treeWAS(snps,
               phen,
               tree = c("BIONJ", "NJ", "parsimony", "BIONJ*", "NJ*"),
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               mem.lim = FALSE,
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.05,
               p.value.correct = c("bonf", "fdr", FALSE),
               p.value.by = c("count", "density"),
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/treeWAS/treeWAS_53Isolates_flexibleGenes_OldRoary_OldRAxMLTree/Phenotype_intermedium_ref_NOTincluded_flexible_genes_redidtree2.pdf",
               seed = NULL)
print(out)

##affine=0, intermedium=0, kraussei=1, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_kraussei_ref_included.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## Cross-check labels with each other:
all(tree$tip.label %in% rownames(snps))
all(rownames(snps) %in% tree$tip.label)
all(tree$tip.label %in% names(phen))
all(names(phen) %in% tree$tip.label)
all(names(phen) %in% rownames(snps))
all(rownames(snps) %in% names(phen))

## Load continuous phenotype:
data(phen.cont)
## Examine phen distribution:
hist(phen.cont)

## Get ranks of phen:
phen.cont.rank <- rank(phen.cont, ties.method = "average")

## Examine distribution of phen ranks:
hist(phen.cont.rank)

## Store original phen: 
phen.cont.ori <- phen.cont

## Replace phen with ranks of phen:
phen.cont <- phen.cont.rank

#treeWAS functions 
out <- treeWAS(snps,
               phen,
               tree = c("BIONJ"),
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               mem.lim = FALSE,
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.05,
               p.value.correct = c("bonf", "fdr", FALSE),
               p.value.by = c("count", "density"),
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_kraussei_ref_included_flexible_genes_redidtree.pdf",
               seed = NULL)

print(out)

##affine=0, intermedium=0, kraussei=1, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_kraussei_1ref_included.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## Cross-check labels with each other:
all(tree$tip.label %in% rownames(snps))
all(rownames(snps) %in% tree$tip.label)
all(tree$tip.label %in% names(phen))
all(names(phen) %in% tree$tip.label)
all(names(phen) %in% rownames(snps))
all(rownames(snps) %in% names(phen))

## Load continuous phenotype:
data(phen.cont)
## Examine phen distribution:
hist(phen.cont)

## Get ranks of phen:
phen.cont.rank <- rank(phen.cont, ties.method = "average")

## Examine distribution of phen ranks:
hist(phen.cont.rank)

## Store original phen: 
phen.cont.ori <- phen.cont

## Replace phen with ranks of phen:
phen.cont <- phen.cont.rank

#treeWAS functions 
out <- treeWAS(snps,
               phen,
               tree = c("BIONJ"),
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               mem.lim = FALSE,
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.05,
               p.value.correct = c("bonf", "fdr", FALSE),
               p.value.by = c("count", "density"),
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_kraussei_1ref_included_flexible_genes_redidtree.pdf",
               seed = NULL)

print(out)

##affine=0, intermedium=0, kraussei=1, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_kraussei_refNOTincluded.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## Cross-check labels with each other:
all(tree$tip.label %in% rownames(snps))
all(rownames(snps) %in% tree$tip.label)
all(tree$tip.label %in% names(phen))
all(names(phen) %in% tree$tip.label)
all(names(phen) %in% rownames(snps))
all(rownames(snps) %in% names(phen))

## Load continuous phenotype:
data(phen.cont)
## Examine phen distribution:
hist(phen.cont)

## Get ranks of phen:
phen.cont.rank <- rank(phen.cont, ties.method = "average")

## Examine distribution of phen ranks:
hist(phen.cont.rank)

## Store original phen: 
phen.cont.ori <- phen.cont

## Replace phen with ranks of phen:
phen.cont <- phen.cont.rank

#treeWAS functions 
out <- treeWAS(snps,
               phen,
               tree = c("BIONJ"),
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               mem.lim = FALSE,
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.05,
               p.value.correct = c("bonf", "fdr", FALSE),
               p.value.by = c("count", "density"),
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_kraussei_refNOTincluded_flexible_genes_redidtree.pdf",
               seed = NULL)

print(out)

##affine=0, intermedium=0, kraussei=0, texanum-1, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_texanum.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## Cross-check labels with each other:
all(tree$tip.label %in% rownames(snps))
all(rownames(snps) %in% tree$tip.label)
all(tree$tip.label %in% names(phen))
all(names(phen) %in% tree$tip.label)
all(names(phen) %in% rownames(snps))
all(rownames(snps) %in% names(phen))

## Load continuous phenotype:
data(phen.cont)
## Examine phen distribution:
hist(phen.cont)

## Get ranks of phen:
phen.cont.rank <- rank(phen.cont, ties.method = "average")

## Examine distribution of phen ranks:
hist(phen.cont.rank)

## Store original phen: 
phen.cont.ori <- phen.cont

## Replace phen with ranks of phen:
phen.cont <- phen.cont.rank

#treeWAS functions 
out <- treeWAS(snps,
               phen,
               tree = c("BIONJ"),
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               mem.lim = FALSE,
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.05,
               p.value.correct = c("bonf", "fdr", FALSE),
               p.value.by = c("count", "density"),
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_texanum_flexible_genes_redidtree.pdf",
               seed = NULL)
print (out)

