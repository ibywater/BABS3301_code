
######### FOLD ENRICHMENT #########

# DFT H3K9ac narrow

macs3 bdgcmp \
  -t DFT_H3K9ac_narrow_treat_pileup.bdg \
  -c DFT_H3K9ac_narrow_control_lambda.bdg \
  -m logFE \
  -p 0.00001 \
  -o bdglogFE/DFT_H3K9ac_narrow_logFE.bdg

bedGraphToBigWig bdglogFE/DFT_H3K9ac_narrow_logFE.bdg genome.chrom.sizes sample.bw

# F TD H3K9ac narrow

macs3 bdgcmp \
  -t F_TD_H3K9ac_narrow_treat_pileup.bdg \
  -c F_TD_H3K9ac_narrow_control_lambda.bdg \
  -m logFE \
  -p 0.00001 \
  -o bdglogFE/F_TD_H3K9ac_narrow_logFE.bdg