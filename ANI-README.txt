Average Nucleotide Identity Analysis

Input data: All the 61 genomes including 42 Indiana isolates, 11 reference X. bovienii isolates, X. nematophila and Photorhabdus assemblies
The name of all the files is saved as a list in a text file - provided as input file

Command used: ./fastANI --ql [QUERY_LIST] --rl [REFERENCE_LIST] -o [OUTPUT_FILE]

Output: Saved to "63Genomes-ANIResults.xlsx" file

Plotting done in R, below is the R script 

#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("ComplexHeatmap")
#install.packages("RColorBrewer")

suppressPackageStartupMessages(library(ComplexHeatmap))
library(RColorBrewer)
library(vegan)

#most basic heatmap with genus level
genusdata = read.csv("OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/ANI/63Genomes-ANIResults.csv",row.names = 1)  # load the data w row names 
matrix = as.matrix(genusdata)

Heatmap(matrix)
Heatmap(matrix,row_names_gp=gpar(cex= .6),row_dend_width = unit(0, "cm"),column_dend_height = unit(6,"cm"))



