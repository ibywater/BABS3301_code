

# fibroblasts

# my new altered

#DFT H3K9me3
macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K9me3_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n DFT_H3K9me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K9me3_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n DFT_H3K9me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#DFT H3K9ac
macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K9ac_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n DFT_H3K9ac_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#DFT H4K20me3
macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H4K20me3_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n DFT_H4K20me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H4K20me3_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n DFT_H4K20me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#TD H3K4me3
macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K4me3_sorted.bam  \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n DFT_TD_H3K4me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K4me3_sorted.bam  \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n DFT_TD_H3K4me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01



#female TD

#TD H3K9ac
macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K9ac_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n F_TD_H3K9ac_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#TD H3K9me3
macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K9me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n F_TD_H3K9me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K9me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n F_TD_H3K9me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#TD H4K20me3
macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H4K20me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n F_TD_H4K20me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H4K20me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n F_TD_H4K20me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#TD H3K4me3
macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K4me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n F_TD_H3K4me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K4me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n F_TD_H3K4me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01




################################################################################

#jess
macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/F_TD_H3K27me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/female_TD_input_sorted.bam \
--broad \
-g 3.1e9 \
-n F_TD_H3K27me3_broad \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

#jess again
macs3 callpeak \
-t /srv/scratch/waters/Jess/DFT2_Cut_Run/Subread/Sorted/DFT2_H3K9me3_sorted.bam \
-c /srv/scratch/waters/Jess/DFT2_Cut_Run/Subread/Sorted/DFT2_Input_sorted.bam \
--broad \
-g 3.1e9 \
-n DFT2_H3K9me3_broad \
-B \
--outdir /srv/scratch/waters/Jess/DFT2_Cut_Run/macs3/ \
-q 0.01

# my initial one
macs3 callpeak \
-t DFT_TD_H4K20me3_sorted.bam \
-f BAMPE \
-g 3e9 \
--broad \
--broad-cutoff 0.1 \
-n H4K20me3_sample --outdir macs_output

# scite
macs3 callpeak \
-t ChIP.bam \
-c Control.bam \
--broad \
-g hs \
--broad-cutoff 0.1

#FEMALE
macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/F_TD_H3K27me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/female_TD_input_sorted.bam \
--broad \
-g 3.1e9 \
-n F_TD_H3K27me3_broad \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/F_TD_H3K9ac_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/female_TD_input_sorted.bam \
-g 3.1e9 \
-n F_TD_H3K9ac_narrow \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/F_TD_H3K9me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/female_TD_input_sorted.bam \
--broad \
-g 3.1e9 \
-n F_TD_H3K9me3_broad \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/F_TD_H3K9me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/female_TD_input_sorted.bam \
-g 3.1e9 \
-n F_TD_H3K9me3_narrow \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/F_TD_H4K20me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/female_TD_input_sorted.bam \
--broad \
-g 3.1e9 \
-n F_TD_H4K20me3_broad \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/F_TD_H4K20me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/female_TD_input_sorted.bam \
-g 3.1e9 \
-n F_TD_H4K20me3_narrow \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

#DFT
macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/DFT_TD_H3K27me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/DFT_input_sorted.bam \
--broad \
-g 3.1e9 \
-n DFT_TD_H3K27me3_broad \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/DFT_TD_H3K9ac_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/DFT_input_sorted.bam \
-g 3.1e9 \
-n DFT_TD_H3K9ac_narrow \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/DFT_TD_H3K9me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/DFT_input_sorted.bam \
--broad \
-g 3.1e9 \
-n DFT_TD_H3K9me3_broad \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/DFT_TD_H3K9me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/DFT_input_sorted.bam \
-g 3.1e9 \
-n DFT_TD_H3K9me3_narrow \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/DFT_TD_H4K20me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/DFT_input_sorted.bam \
--broad \
-g 3.1e9 \
-n DFT_TD_H4K20me3_broad \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01

macs3 callpeak \
-t /srv/scratch/waters/Jess/Subread/sorted/DFT_TD_H4K20me3_sorted.bam \
-c /srv/scratch/waters/230324_LIS11721_basespace_results/Subread/sorted/DFT_input_sorted.bam \
-g 3.1e9 \
-n DFT_TD_H4K20me3_narrow \
-B \
--outdir /srv/scratch/waters/Jess/macs3/ \
-q 0.01