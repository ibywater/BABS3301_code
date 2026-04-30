######################
### feature counts ###
######################

featureCounts -p -s 2 -a /srv/scratch/waters/Genomes/Devil/NCBI/GCF_902635505.1_mSarHar1.11_genomic.gtf -t exon -g gene_id -o counts_reverse_Nick.txt \
/srv/scratch/waters/Jess/DFT2_RNA_Seq/Subread/Sorted/DFT2_RNA_sorted.bam


### exon H3K9ac ###
featureCounts -p --countReadPairs -B -C -a ~/TD/genome/fasta_file/genomic.gtf \
-t exon -g gene_id -o DFT_TD_H3K9ac_counts.txt \
~/TD/subread/sorted/DFT_TD_H3K9ac_sorted.bam

### gene H3K9ac ###
featureCounts -p --countReadPairs -B -C -a ~/TD/genome/fasta_file/genomic.gtf \
-t gene -g gene_id -o gene_DFT_TD_H3K9ac_counts.txt \
~/TD/subread/sorted/DFT_TD_H3K9ac_sorted.bam


### exon H3K9me3 ###
featureCounts -p --countReadPairs -B -C -a ~/TD/genome/fasta_file/genomic.gtf \
-t exon -g gene_id -o DFT_TD_H3K9me3_counts.txt \
~/TD/subread/sorted/DFT_TD_H3K9me3_sorted.bam