library(devtools)
#install_github("caitiecollins/treeWAS", build_vignettes = TRUE)
library(treeWAS)
library(ape)
library(adegenet)
library(stringr)

#redo this analysis with 52 genomes instead of 42
#calling the reference genomes as a different phenotypes
#name the kraussei reference as kraussei and also separate phenotypes
prefix <-"OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/ClonalFrame/rooted/ClonalFrame_rooted"
dat <- read.CFML(prefix=prefix)

## Required input into treeWAS:
snps <- dat$snps
str(snps)

tree <- dat$tree
str(tree)

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

## Optional input into treeWAS:
n.subs <- dat$n.subs
snps.rec <- dat$snps.re

## TreeWAS example
out <- treeWAS(snps = snps,
               phen = phen,
               tree = tree,
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.1,
               p.value.correct = "bonf",
               p.value.by = "count",
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_affine_versus_rest_clonalframe_p0.1.pdf",
               seed = 1)
print (out)

##affine=0, intermedium=1, kraussei=0, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_intermedium_ref_included.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## TreeWAS example
out <- treeWAS(snps = snps,
               phen = phen,
               tree = tree,
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.1,
               p.value.correct = "bonf",
               p.value.by = "count",
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_intermedium_ref_included_Clonalframe.pdf",
               seed = 1)

##affine=0, intermedium=1, kraussei=0, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_intermedium_ref_NOTincluded.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## TreeWAS example
out <- treeWAS(snps = snps,
               phen = phen,
               tree = tree,
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.1,
               p.value.correct = "bonf",
               p.value.by = "count",
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_intermedium_ref_NOTincluded_Clonalframe_p0.1.pdf",
               seed = 1)
print(out)


##affine=0, intermedium=0, kraussei=1, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_kraussei_ref_included.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## TreeWAS example
out <- treeWAS(snps = snps,
               phen = phen,
               tree = tree,
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.1,
               p.value.correct = "bonf",
               p.value.by = "count",
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_kraussei_ref_included_flexible_genes_clonalframe_p0.1.pdf.pdf",
               seed = 1)
print(out)

##affine=0, intermedium=0, kraussei=1, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_kraussei_1ref_included.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## TreeWAS example
out <- treeWAS(snps = snps,
               phen = phen,
               tree = tree,
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.1,
               p.value.correct = "bonf",
               p.value.by = "count",
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_kraussei_1ref_included_clonalframe_p0.1.pdf.pdf",
               seed = 1)
print(out)

##affine=0, intermedium=0, kraussei=1, texanum-0, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_kraussei_refNOTincluded.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## TreeWAS example
out <- treeWAS(snps = snps,
               phen = phen,
               tree = tree,
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.1,
               p.value.correct = "bonf",
               p.value.by = "count",
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_kraussei_refNOTincluded_clonalframe_p0.1.pdf",
               seed = 1)
print(out)

##affine=0, intermedium=0, kraussei=0, texanum-1, reference=0
df <- read.csv(file="OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Phenotype_texanum.csv", row.names = 1, header = FALSE)
phen <- as.vector(unlist(df))
names(phen) <- rownames(df)

## TreeWAS example
out <- treeWAS(snps = snps,
               phen = phen,
               tree = tree,
               n.subs = NULL,
               n.snps.sim = ncol(snps)*10,
               chunk.size = ncol(snps),
               test = c("terminal", "simultaneous", "subsequent"),
               snps.reconstruction = "parsimony",
               snps.sim.reconstruction = "parsimony",
               phen.reconstruction = "parsimony",
               phen.type = "binary",
               na.rm = TRUE,
               p.value = 0.1,
               p.value.correct = "bonf",
               p.value.by = "count",
               dist.dna.model = "JC69",
               plot.tree = TRUE,
               plot.manhattan = TRUE,
               plot.null.dist = TRUE,
               plot.dist = TRUE,
               snps.assoc = TRUE, 
               filename.plot = "OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/treeWAS/Rooted_tree_results/Phenotype_texanum_clonalframe_p0.1.pdf",
               seed = 1)
print (out)

