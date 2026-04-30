#!/bin/bash


cd ~/TD/data/DFT1/raw

fastqc *.fastq.gz -o ~/TD/data/DFT1/FastQC

cd ~/TD/data/F_TD/raw

fastqc *.fastq.gz -o ~/TD/data/F_TD/FastQC



#inputs
cd ~/TD/data/DFT1/raw

fastqc DFT_input*.fastq.gz -o ~/TD/data/DFT1/FastQC

cd ~/TD/data/F_TD/raw

fastqc female*.fastq.gz -o ~/TD/data/F_TD/FastQC


#H3K4me3

cd ~/TD/data/DFT1/raw

fastqc DFT_H3K4me3*.fastq.gz -o ~/TD/data/DFT1/FastQC

cd ~/TD/data/F_TD/raw

fastqc fem_TD*.fastq.gz -o ~/TD/data/F_TD/FastQC