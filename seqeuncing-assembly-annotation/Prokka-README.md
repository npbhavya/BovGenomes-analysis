## Genome annotation 

Prokka v1.14.6 - https://github.com/tseemann/prokka 

**Input files** : Assembled genomes of all 61 genomes. 

**Command** :

    prokka --outdir <output folder> --prefix <input genome name> --genus Xenorhabdus --force --kingdom Bacteria --usegenus <input assembly>

**Output**: A directory that outputs the proteins, genes, Genbank file, gff format, log, tabular file and txt file. Saved to One drive as "prokka output"

### Downstream bash commands used

Counting the number of hypothetical proteins in the annotation was performed using the below script

    for f in *; do echo "$f"; grep -c "hypothetical protein" "$f"/*.tsv; done 

