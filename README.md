# Bioinformatics Pipeline for CUT&RUN and RNA-seq data #
<p align="center">
  <img width="392" height="801" alt="bioinformatics_pipeline drawio (3)" src="https://github.com/user-attachments/assets/c8df5575-9e61-4cb9-9d20-7906b89e2555" />
</p>

*Quality control of Sequencing Data* 

Each of the samples underwent quality control using FastQC (Version X). Analysing the per base sequence quality and per base sequence content, as well as overrepresented sequences allows for determining where to trim the reads. Trimming was done using Trim Galore (Version X). Low quality and unstable base content at the 3’ end of the resulted in the decision to trim the ends, and the presence of an overrepresented poly-G tail resulted in the addition of the --2-colour flag to account for the technical artifact that occurs due to the 2 colour method of base calling used in the sequencing technology. FastQC and MultiQC were utilised after the trimming to ensure the reads were sufficient quality for downstream processes.

*Alignment to Genome*

The reads were aligned to the Tasmanian devil genome using Subread (Version X). The resultant .bam file was sorted using samtools (Version X) to organise it by chromosomal location.

*Identification of enriched regions*

The sorted and aligned file was used to identify regions of significant enrichment using Macs3 callpeak (Version X). The resultant bedgraph files were then normalised using normalisation factors calculated from the number of mapped reads from the alignment step.

*RPKM expression analysis*

RPKM analysis was done on the cleaned-up RNA-seq data. The genes were then organised into quantiles based on the RPKM values. Quantile 1 were the genes with 0 expression. The remaining genes were split evenly into quantiles 2, 3, and 4, with Q4 containing the genes with the highest RPKM values. The dataframes for each quantile were then exported as BED files containing the chromosome, genomic start and end locations, and gene name for each gene.

*Intersection of RNA-seq and CUT&RUN data*

Using the deepTools (Version X) function computeMatrix, a matrix of signal values was computed for each sample. These signal values were computed around the transcription start site (TSS) for each of the four quantiles separately, and resulted in a numeric signal value for 50bp increments 10kb either side of the TSS for each quantile. The plotProfile function in deepTools was used to export the data into a tsv file to be cleaned up in R.

*Visualisation of plots*

RStudio was used to visualise the data that had been produced in the intersection step for each of the samples. The resulting plots are shown below in the results section.
