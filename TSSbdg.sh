

# 1. make working directory for each bdg file

cd /g/data/xl04/jc4878/Jess_GabbyData/pileup
for i in $(ls *.bdg); do mkdir ~/TD/workingdir/${i/.bdg}; done



# 2. Then expand the common gtf gene file. (This script)



cd /g/data/xl04/jc4878/Jess_GabbyData
mkdir gene
export GTF="$HOME/TD/genome/fasta_file/genomic.gtf"
for i in $(awk '$1 !~ /^NW/' ${GTF} | awk '$3 == "gene"' | cut -f1 | sort | uniq); do awk -v i="$i" '$1 == i' ${GTF} | awk '$3 == "gene"' | awk -F '\t'  '{print $1"\t"$4-1"\t"$5"\t"$9"\t"$7}' | awk -F '\t' '{if ($5 == "+") print $1"\t"$2-10000"\t"$2+10001"\t"$4"\t"$5"\t"$2"\t"$3; else if ($5 == "-") print $1"\t"$3-10001"\t"$3+10000"\t"$4"\t"$5"\t"$2"\t"$3 }' | awk -F '\t' 'BEGIN {OFS = "\t"} {for (i=$2; i<$3; i++) print $1, i, i+1, $4, $5, $6, $7}' | awk -F '\t' '{if ($5 == "+") print $0"\t"$2-$6; else if ($5 == "-") print $0"\t"$7-$3}' | awk -F '\t' '{print $1","$2","$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8}' | LANG=en_US.UTF-8 sort --parallel=${PBS_NCPUS} -t $'\t' -k1,1 > gene/gene_$i.gtf; done


# 3. Then expand the bedgraph file into chromosomal parts and combine with the gtf file. (This script)

cd ${workingdir}

export BDG="$HOME/TD/macs3/DFT_H3K9ac_narrow_treat_pileup.bdg"

export BDG_BASE=$(basename ${BDG/.bdg/})

mkdir pileup
mkdir combine

#This script separate the bdg file into its chromosomal part, only relevant chromosomes in the gtf are kept
for i in $(awk '$1 !~ /^NW/' ${GTF} | awk '$3 == "gene"' | cut -f1 | sort | uniq); do awk -v i="$i" '$1 == i' ${BDG} | awk -F '\t' 'BEGIN {OFS = "\t"} {for (i=$2; i<$3; i++) print $1","i","i+1, $4}' | LANG=en_US.UTF-8 sort --parallel=${PBS_NCPUS} -t $'\t' -k1,1 > pileup/${BDG_BASE}_$i.bdg; done

export existing_gene="$HOME/TD/gene"

#combining height info into the TSS bed graph
for i in $(awk '$1 !~ /^NW/' ${GTF} | awk '$3 == "gene"' | cut -f1 | sort | uniq); do LANG=en_US.UTF-8 join -t $'\t' -a 1 -e "NA" -1 1 -2 1 -o1.1,1.2,1.3,1.4,1.5,1.6,2.2 ${existing_gene}/gene_$i.gtf pileup/${BDG_BASE}_$i.bdg | awk -F '\t' '$7 != "NA"' > combine/combined_$i.tsv; done

#compressing to save space
tar cf - pileup | pigz -p 4 > pileup.tar.gz
rm -rf pileup

tar cf - combine | pigz -p 4 > combine.tar.gz
rm -rf combine


## alternative 3?

for BDG in ~/TD/macs3/*.bdg; do

    BDG_BASE=$(basename "$BDG" .bdg)

    mkdir -p pileup combine

    for i in $(awk '$1 !~ /^NW/' ${GTF} | awk '$3 == "gene"' | cut -f1 | sort | uniq); do

        awk -v i="$i" '$1 == i' "$BDG" \
        | awk -F '\t' 'BEGIN {OFS="\t"} {for (i=$2; i<$3; i++) print $1","i","i+1, $4}' \
        | sort -t $'\t' -k1,1 \
        > pileup/${BDG_BASE}_$i.bdg

    done

done

# alternative alternative 3

# Go to your working directory
cd "${workingdir}"

# Set paths (IMPORTANT: use $HOME instead of ~)
export BDG_DIR="$HOME/TD/macs3"
export GTF="$HOME/TD/genome/fasta_file/genomic.gtf"
export existing_gene="$HOME/TD/gene"

# Set CPUs safely (works on HPC and locally)
export PBS_NCPUS=${PBS_NCPUS:-4}

# Make output folders once
mkdir -p pileup combine

# Loop over all bedGraph files
for BDG in ${BDG_DIR}/*.bdg; do

    # Extract sample name
    BDG_BASE=$(basename "$BDG" .bdg)
    echo "Processing sample: $BDG_BASE"

    # Loop over chromosomes
    for i in $(awk '$1 !~ /^NW/' "$GTF" | awk '$3 == "gene"' | cut -f1 | sort | uniq); do

        # STEP 1: Create per-base pileup
        awk -v i="$i" '$1 == i' "$BDG" \
        | awk -F '\t' 'BEGIN {OFS="\t"} {for (pos=$2; pos<$3; pos++) print $1","pos","pos+1, $4}' \
        | LANG=en_US.UTF-8 sort --parallel=${PBS_NCPUS} -t $'\t' -k1,1 \
        > pileup/${BDG_BASE}_$i.bdg

        # STEP 2: Join with gene/TSS annotation
        LANG=en_US.UTF-8 join -t $'\t' -a 1 -e "NA" \
            -1 1 -2 1 \
            -o1.1,1.2,1.3,1.4,1.5,1.6,2.2 \
            ${existing_gene}/gene_$i.gtf \
            pileup/${BDG_BASE}_$i.bdg \
        | awk -F '\t' '$7 != "NA"' \
        > combine/${BDG_BASE}_combined_$i.tsv

    done

done

# Compress outputs
tar cf - pileup | pigz -p ${PBS_NCPUS} > pileup.tar.gz
rm -rf pileup

tar cf - combine | pigz -p ${PBS_NCPUS} > combine.tar.gz
rm -rf combine



tar cf - pileup/DFT_H3K9ac* | pigz -p 4 > pileup_DFT_H3K9ac.tar.gz

rm -rf pileup

tar cf - combine | pigz -p 4 > combine.tar.gz
rm -rf combine


tar cf - combine/sample1_* combine/sample2_* | pigz -p 4 > combined_samples_1_2.tar.gz

tar cf - pileup/sample1_* pileup/sample2_* | pigz -p 4 > pileup_samples_1_2.tar.gz
rm pileup/sample1_* pileup/sample2_*




## ermmm one more try

# Go to your working directory
cd "${workingdir}"

# Set paths (IMPORTANT: use $HOME instead of ~)
export BDG_DIR="$HOME/TD/macs3"
export GTF="$HOME/TD/genome/fasta_file/genomic.gtf"
export existing_gene="$HOME/TD/gene"

# Set CPUs safely (works on HPC and locally)
export PBS_NCPUS=${PBS_NCPUS:-4}

# Make output folders once
mkdir -p pileup combine



cd ${workingdir}

export BDG="$HOME/TD/macs3/DFT_H3K9ac_narrow_treat_pileup.bdg"

export BDG_BASE=$(basename ${BDG/.bdg/})

#mkdir pileup
#mkdir combine

echo "Processing sample: $BDG_BASE"

#This script separate the bdg file into its chromosomal part, only relevant chromosomes in the gtf are kept
for i in $(awk '$1 !~ /^NW/' ${GTF} | awk '$3 == "gene"' | cut -f1 | sort | uniq); do awk -v i="$i" '$1 == i' ${BDG} | awk -F '\t' 'BEGIN {OFS = "\t"} {for (i=$2; i<$3; i++) print $1","i","i+1, $4}' | LANG=en_US.UTF-8 sort --parallel=${PBS_NCPUS} -t $'\t' -k1,1 > pileup/${BDG_BASE}_$i.bdg; done
echo "Doing $i"
export existing_gene="$HOME/TD/gene"

#combining height info into the TSS bed graph
for i in $(awk '$1 !~ /^NW/' ${GTF} | awk '$3 == "gene"' | cut -f1 | sort | uniq); do LANG=en_US.UTF-8 join -t $'\t' -a 1 -e "NA" -1 1 -2 1 -o1.1,1.2,1.3,1.4,1.5,1.6,2.2 ${existing_gene}/gene_$i.gtf pileup/${BDG_BASE}_$i.bdg | awk -F '\t' '$7 != "NA"' > combine/combined_$i.tsv; done

#compressing to save space
tar cf - pileup | pigz -p 4 > pileup.tar.gz
rm -rf pileup

tar cf - combine | pigz -p 4 > combine.tar.gz
rm -rf combine