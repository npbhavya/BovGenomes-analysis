install.packages("tidyverse")
install.packages("vegan")

library(vegan)
library(tidyverse)
library(readxl)

#importing data from excel, note using the same input as the ANCOVA

DistMMReg_InOut <- read_excel("~/OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/GeoDist/DistMMReg_InOut.xlsx")

#creating new variables 

data2<-DistMMReg_InOut %>%
  mutate(dani=100-ani, dlpclb53=4.45-lpclb53)


#choose key columns and make 3 new dataframes


ani_df<-subset(data2, select=c(iso1, iso2, dani))

gdist_df <-subset(data2, select=c(iso1,iso2,lgeodist))

gflow_df<-subset(data2, select=c(iso1,iso2,dlpclb53))

#convert to distance object
nams <- with(data2, unique(c(as.character(iso1), as.character(iso2))))

ani_dist <- with(ani_df, structure(dani,
                           Size = length(nams),
                           Labels = nams,
                           Diag = FALSE,
                           Upper = FALSE,
                           method = "user",
                           class = "dist"))

gdist_dist <- with(gdist_df, structure(lgeodist,
                                   Size = length(nams),
                                   Labels = nams,
                                   Diag = FALSE,
                                   Upper = FALSE,
                                   method = "user",
                                   class = "dist"))

gflow_dist <- with(gflow_df, structure(dlpclb53,
                                       Size = length(nams),
                                       Labels = nams,
                                       Diag = FALSE,
                                       Upper = FALSE,
                                        method = "user",
                                       class = "dist"))

mantel(ani_dist, gdist_dist, method="pearson", permutations=999, na.rm=TRUE)

mantel(gflow_dist, gdist_dist, method="pearson", permutations=999, na.rm=TRUE)

#repeating with just Indiana isolates

justInd_df<-subset(data2, pclb42>0)

ani42_df<-subset(justInd_df, select=c(iso1, iso2, dani))

gdist42_df <-subset(justInd_df, select=c(iso1,iso2,lgeodist))

gflow42_df<-subset(justInd_df, select=c(iso1,iso2,dlpclb53))

nams42 <- with(justInd_df, unique(c(as.character(iso1), as.character(iso2))))

ani42_dist <- with(ani42_df, structure(dani,
                                       Size = length(nams42),
                                       Labels = nams42,
                                       Diag = FALSE,
                                       Upper = FALSE,
                                       method = "user",
                                       class = "dist"))

gdist42_dist <- with(gdist42_df, structure(lgeodist,
                                           Size = length(nams42),
                                           Labels = nams42,
                                           Diag = FALSE,
                                           Upper = FALSE,
                                           method = "user",
                                           class = "dist"))

gflow42_dist <- with(gflow42_df, structure(dlpclb53,
                                       Size = length(nams42),
                                       Labels = nams,
                                       Diag = FALSE,
                                       Upper = FALSE,
                                       method = "user",
                                       class = "dist"))


mantel(gdist42_dist, ani42_dist, method="pearson", permutations=999)

mantel(gdist42_dist, gflow42_dist, method="pearson", permutations=999)

#repeating with just MC isolates--note not changing df names


justInd_df<-subset(data2, site=="MC")

ani42_df<-subset(justInd_df, select=c(iso1, iso2, dani))

gdist42_df <-subset(justInd_df, select=c(iso1,iso2,lgeodist))

gflow42_df<-subset(justInd_df, select=c(iso1,iso2,dlpclb53))

nams42 <- with(justInd_df, unique(c(as.character(iso1), as.character(iso2))))

ani42_dist <- with(ani42_df, structure(dani,
                                       Size = length(nams42),
                                       Labels = nams42,
                                       Diag = FALSE,
                                       Upper = FALSE,
                                       method = "user",
                                       class = "dist"))

gdist42_dist <- with(gdist42_df, structure(lgeodist,
                                           Size = length(nams42),
                                           Labels = nams42,
                                           Diag = FALSE,
                                           Upper = FALSE,
                                           method = "user",
                                           class = "dist"))

gflow42_dist <- with(gflow42_df, structure(dlpclb53,
                                           Size = length(nams42),
                                           Labels = nams,
                                           Diag = FALSE,
                                           Upper = FALSE,
                                           method = "user",
                                           class = "dist"))


mantel(gdist42_dist, ani42_dist, method="pearson", permutations=999)

mantel(gdist42_dist, gflow42_dist, method="pearson", permutations=999)

#repeating with just LD isolates--note not changing df names


justInd_df<-subset(data2, site=="LD")

ani42_df<-subset(justInd_df, select=c(iso1, iso2, dani))

gdist42_df <-subset(justInd_df, select=c(iso1,iso2,lgeodist))

gflow42_df<-subset(justInd_df, select=c(iso1,iso2,dlpclb53))

nams42 <- with(justInd_df, unique(c(as.character(iso1), as.character(iso2))))

ani42_dist <- with(ani42_df, structure(dani,
                                       Size = length(nams42),
                                       Labels = nams42,
                                       Diag = FALSE,
                                       Upper = FALSE,
                                       method = "user",
                                       class = "dist"))

gdist42_dist <- with(gdist42_df, structure(lgeodist,
                                           Size = length(nams42),
                                           Labels = nams42,
                                           Diag = FALSE,
                                           Upper = FALSE,
                                           method = "user",
                                           class = "dist"))

gflow42_dist <- with(gflow42_df, structure(dlpclb53,
                                           Size = length(nams42),
                                           Labels = nams,
                                           Diag = FALSE,
                                           Upper = FALSE,
                                           method = "user",
                                           class = "dist"))


mantel(gdist42_dist, ani42_dist, method="pearson", permutations=999)

mantel(gdist42_dist, gflow42_dist, method="pearson", permutations=999)
