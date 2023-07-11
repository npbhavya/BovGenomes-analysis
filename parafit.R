library(ape)
library(ggplot2) # <- need for ggplot()
library(rmarkdown) # <- need for paged_table()
library(readxl)
library(vegan)
library(data.table)
#install.packages("c212")
library(c212)

data(gopher.D)
data(lice.D)
data(HP.links)
res <- parafit(gopher.D, lice.D, HP.links, nperm=99, test.links=TRUE)
res

#ANI as genetic distance
ani=read.csv("~/OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/host congruence/53_ani.csv",
               header = TRUE, row.names = 1)  # load the data w row names 
ani.df=as.data.frame(ani)


#core region distance 
core=read.csv("~/OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/host congruence/53-coreregion.csv",
              header = TRUE, row.names = 1)
core.df=as.data.frame(core)

#nematode as 28S genetic distance
nem=read.csv("~/OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/host congruence/neamtode_dist.csv",
              header =TRUE, row.names = 1)
nem.df=as.data.frame(nem)


#host-symbiont 
hp=read.csv("~/OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/host congruence/HP.csv",
            header = TRUE, row.names = 1)  # load the data w row names 
hp.df=as.data.frame(hp)


res_core <- parafit(nem.df, core.df, hp.df, nperm=1000, test.links=TRUE, correction="cailliez")
res_core

res_ani <- parafit(nem.df, ani, hp.df, nperm=1000, test.links=TRUE, correction="cailliez")
res_ani

#trying to read in trees 
symbionts <-read.tree(file = "~/OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/RaxML tree/53 X.bov genomes/RAxML_bipartitionsBranchLabels.Xenorhabdus_52_bestML_clonalframe_corrected", 
                      text = NULL, tree.names = NULL, skip = 0)
nematode <-read.tree(file ="~/OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/nematode28S/sequences_9nematodes/sequences.nwk",
                     text = NULL, tree.names = NULL, skip = 0)

symbionts_dist <-cophenetic.phylo(symbionts)
symbionts_dist_df <-as.data.frame(symbionts_dist)

nematodes_dist <-cophenetic.phylo(nematode)
nematodes_dist_df <- as.data.frame(nematodes_dist)

hp2=read.csv("~/OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/host congruence/HP2.csv",
            header = TRUE, row.names = 1)  # load the data w row names 
hp2.df=as.data.frame(hp2)

res_phylo <- parafit(nematodes_dist_df, symbionts_dist_df, hp2.df, nperm=1000, test.links=TRUE, correction="cailliez")
res_phylo
