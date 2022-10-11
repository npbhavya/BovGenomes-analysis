## Pangenomic analysis using Roary

Roary v3.13.0

**Input files**: 

  The gff files from prokka output for just the 53 X. Bovienii genomes. 

**Command**: 

    roary gff-bov/* -p 10 -f bov-53-90pid-rerun2022 -e -n -I 90 -z 

**Output**: 
  
  gene_presence_and_absence.csv"

### Visulaizing the gene presence and absence table as UMAP
Visualising the gene presence and absence as UMAP using R 


    install.packages("gh");
    install.packages("crayon")
    install.packages("usethis");
    install.packages("covr");
    install.packages("roxygen2");
    install.packages("rversions");
    install.packages("devtools");
    library(devtools)
    install_github("vqv/ggbiplot")

    library(devtools)
    library(ggbiplot)

    #####################################################################################
    #install_github("crj32/M3C")
    library(M3C)

    ### flexible genes
    data=read.table("OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/Roary/bov-53-90pid-rerun2022/gene_presence_absence2.csv", sep = ",", header = TRUE, row.names = 1)
    Data=data[-c(1),]
    data=as.data.frame(sapply(data, as.numeric))
    data_t=as.data.frame(t(data))
    umap(data,colvec=c('skyblue'))
    sample=c( "LD05", "LD08", "LD21", "LD27A",	"LD27B",	"LD28",	"LD45B",	"LD52B",
              "LD03",	"MC010",	"MC011",	"MC015",	"MC019",	"MC044",	"MC047",	"MC052",
              "MC059",	"MC066",	"MC067",	"MC078",	"MC081",	"MC094",	"MC095",	"MC096",	
              "MC200",	"MC202",	"MC211",	"MC214",	"MC216",	"MC218",	"MC221",	"MC226",
              "MC228",	"MC233",	"MC235",	"MC239",	"MC241",	"MC250",	"MC255",	"MC266",
              "MM01",	"MM17A",	"CS03",	"SS2004",	"feltiae Florida", "feltiae France", "feltiae Moldova",	"intermedium",	
              "jollieti",	 "kraussei BU",	"kraussei Quebec", "oregonense",	"puntauvense")

    host=c("S.kraussei", "S.intermedium", "S.intermedium", "S.texanum",	"S.texanum",	"S.affine",	"S.intermedium",	"S.intermedium",
    "S.intermedium",	"S.affine",	"S.texanum",	"S.texanum",	"S.texanum",	"S.kraussei",	"S.kraussei",	"S.affine",
    "S.kraussei",	"S.affine",	"S.kraussei",	"S.affine",	"S.affine",	"S.affine",	"S.kraussei",	"S.kraussei",	
    "unknown",	"S.affine",	"S.affine",	"S.texanum",	"S.affine",	"S.affine",	"unknown",	"S.affine",
    "S.affine",	"S.texanum",	"S.affine",	"S.kraussei",	"S.texanum",	"S.texanum",	"S.affine",	"S.kraussei",
    "S.intermedium",	"S.texanum",	"Reference",	"Reference",	"Reference", "Reference", "Reference",	"Reference",	
    "Reference",	 "Reference",	"Reference", "Reference",	"Reference")

    as.factor(host)
    umap(data,labels=as.factor(host),colvec = c("black", "cyan", "dark blue", "hot pink", "red", "grey"),controlscale = TRUE, scale=3, text = sample, textlabelsize = 3, dotsize=3, printheight = 50, printwidth = 50)

    The data was also visualised using a nMDS, R2=0.979 (non metric fit), R2=0.929 (linear fit)
    ## MDS plots
    #nMDS 
    library(vegan)
    data=read.table("OneDrive - Indiana University/BovGenomeShared/Paper_AllAnalyses/Roary/bov-53-90pid-rerun2022/gene_presence_absence2.csv", sep = ",", header = TRUE, row.names = 1)
    data=as.data.frame(sapply(data, as.numeric))
    data_t=as.matrix(t(data))
    set.seed(123)
    mds=metaMDS(d, distance = "bray", k=3, maxit = 999, trymax = 500, wascores = TRUE)
    nmds

    # Shepards test/goodness of fit
    goodness(mds) # Produces a results of test statistics for goodness of fit for each point
    stressplot(mds) # Produces a Shepards diagram

    plot(nmds)
    #extract NMDS scores (x and y coordinates)
    data.scores = as.data.frame(scores(nmds)$sites)
    sample=c( "LD05", "LD08", "LD21", "LD27A",	"LD27B",	"LD28",	"LD45B",	"LD52B",
              "LD03",	"MC010",	"MC011",	"MC015",	"MC019",	"MC044",	"MC047",	"MC052",
              "MC059",	"MC066",	"MC067",	"MC078",	"MC081",	"MC094",	"MC095",	"MC096",	
              "MC200",	"MC202",	"MC211",	"MC214",	"MC216",	"MC218",	"MC221",	"MC226",
              "MC228",	"MC233",	"MC235",	"MC239",	"MC241",	"MC250",	"MC255",	"MC266",
              "MM01",	"MM17A",	"CS03",	"SS2004",	"feltiae Florida", "feltiae France", "feltiae Moldova",	"intermedium",	
              "jollieti",	 "kraussei BU",	"kraussei Quebec", "oregonense",	"puntauvense")

    host=c("S.kraussei", "S.intermedium", "S.intermedium", "S.texanum",	"S.texanum",	"S.affine",	"S.intermedium",	"S.intermedium",
           "S.intermedium",	"S.affine",	"S.texanum",	"S.texanum",	"S.texanum",	"S.kraussei",	"S.kraussei",	"S.affine",
           "S.kraussei",	"S.affine",	"S.kraussei",	"S.affine",	"S.affine",	"S.affine",	"S.kraussei",	"S.kraussei",	
           "unknown",	"S.affine",	"S.affine",	"S.texanum",	"S.affine",	"S.affine",	"unknown",	"S.affine",
           "S.affine",	"S.texanum",	"S.affine",	"S.kraussei",	"S.texanum",	"S.texanum",	"S.affine",	"S.kraussei",
           "S.intermedium",	"S.texanum",	"Reference",	"Reference",	"Reference", "Reference", "Reference",	"Reference",	
           "Reference",	 "Reference",	"Reference", "Reference",	"Reference")
    #add columns to data frame 
    data.scores$Sample = sample
    data.scores$host = host
    head(data.scores)

    library(ggplot2)

    xx = ggplot(data.scores, aes(x = NMDS1, y = NMDS2, label=sample)) + 
      geom_point(size = 4, aes(colour = host))+ 
      geom_text(hjust=0.8, vjust=1)+
      theme(axis.text.y = element_text(colour = "black", size = 12, face = "bold"), 
            axis.text.x = element_text(colour = "black", face = "bold", size = 12), 
            legend.text = element_text(size = 12, face ="bold", colour ="black"), 
            legend.position = "right", axis.title.y = element_text(face = "bold", size = 14), 
            axis.title.x = element_text(face = "bold", size = 14, colour = "black"), 
            legend.title = element_text(size = 14, colour = "black", face = "bold"), 
            panel.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA, size = 1.2),
            legend.key=element_blank()) + 
      labs(x = "NMDS1", colour = "Time", y = "NMDS2", shape = "Type")  + 
      scale_colour_manual(values =  c("black", "cyan", "dark blue", "hot pink", "red", "grey")) 

    xx
