#################################
#######   PLOTTING!!!!!   #######
#################################

##### automated for each directory ########


# for both

# (note that dft samples don't have the dft in front of the output files oops but female samples have F_ at the beginning)

for bw in *.bw; do
    sample="${bw%.bw}"
    
    if [[ "$bw" == F_* ]]; then
        auto_beds="$HOME/TD/quartiles/F_auto_Q1.bed $HOME/TD/quartiles/F_auto_Q2.bed $HOME/TD/quartiles/F_auto_Q3.bed $HOME/TD/quartiles/F_auto_Q4.bed"
        x_beds="$HOME/TD/quartiles/F_X_Q1.bed $HOME/TD/quartiles/F_X_Q2.bed $HOME/TD/quartiles/F_X_Q3.bed $HOME/TD/quartiles/F_X_Q4.bed"
    else
        auto_beds="$HOME/TD/quartiles/auto_Q1.bed $HOME/TD/quartiles/auto_Q2.bed $HOME/TD/quartiles/auto_Q3.bed $HOME/TD/quartiles/auto_Q4.bed"
        x_beds="$HOME/TD/quartiles/X_Q1.bed $HOME/TD/quartiles/X_Q2.bed $HOME/TD/quartiles/X_Q3.bed $HOME/TD/quartiles/X_Q4.bed"
    fi

    computeMatrix reference-point -S ./"$bw" \
        -R $auto_beds \
        --referencePoint TSS -b 10000 -a 10000 --binSize 50 \
        -out gz/"${sample}_auto.gz" &

    computeMatrix reference-point -S ./"$bw" \
        -R $x_beds \
        --referencePoint TSS -b 10000 -a 10000 --binSize 50 \
        -out gz/"${sample}_X.gz" &

    wait
done

# for DFT

for bw in *.bw; do
    sample="${bw%.bw}"
    
    computeMatrix reference-point -S ./"$bw" \
        -R ~/TD/quartiles/auto_Q1.bed ~/TD/quartiles/auto_Q2.bed ~/TD/quartiles/auto_Q3.bed ~/TD/quartiles/auto_Q4.bed \
        --referencePoint TSS -b 10000 -a 10000 --binSize 50 \
        -out gz/"${sample}_auto.gz" &

    computeMatrix reference-point -S ./"$bw" \
        -R ~/TD/quartiles/X_Q1.bed ~/TD/quartiles/X_Q2.bed ~/TD/quartiles/X_Q3.bed ~/TD/quartiles/X_Q4.bed \
        --referencePoint TSS -b 10000 -a 10000 --binSize 50 \
        -out gz/"${sample}_X.gz" &

    wait
done

# for female

for bw in *.bw; do
    sample="${bw%.bw}"
    
    computeMatrix reference-point -S ./"$bw" \
        -R ~/TD/quartiles/F_auto_Q1.bed ~/TD/quartiles/F_auto_Q2.bed ~/TD/quartiles/F_auto_Q3.bed ~/TD/quartiles/F_auto_Q4.bed \
        --referencePoint TSS -b 10000 -a 10000 --binSize 50 \
        -out gz/"${sample}_auto.gz" &

    computeMatrix reference-point -S ./"$bw" \
        -R ~/TD/quartiles/F_X_Q1.bed ~/TD/quartiles/F_X_Q2.bed ~/TD/quartiles/F_X_Q3.bed ~/TD/quartiles/F_X_Q4.bed \
        --referencePoint TSS -b 10000 -a 10000 --binSize 50 \
        -out gz/"${sample}_X.gz" &

    wait
done




########## actual plotting to check if it worked #########

plotProfile \
  -m DFT_H3K9ac_narrow_logFE.gz \
  --perGroup \
  --colors blue green orange red \
  -out quartile_profile.png

for gz in *.gz; do
    sample="${gz%.gz}"
    plotProfile \
        -m "$gz" \
        --perGroup \  # need to remove this line
        --colors blue green orange red \
        -out plot/"${sample}_trial.png"
done

plotProfile \
        -m DFT_H3K4me3_narrow_auto.gz \
        --colors blue green orange red \
        -out randommm.png



for gz in *.gz; do
    sample="${gz%.gz}"
    plotProfile \
        -m "$gz" \
        --outFileNameData "${sample}_data.tsv" \
        -out plot/"together_${sample}.png"
done

mv *tsv ~/TD/tsv_plots


plotProfile \
  -m DFT_H3K9ac_narrow_logFE.gz \
  --perGroup \
  --outFileNameData profile_data.tsv \
  -out temp.png





######### OLD #############


# H3K4me3

computeMatrix reference-point \
  -S DFT_H3K4me3_broad.bw \
  -R ~/TD/quartiles/auto_Q1.bed ~/TD/quartiles/auto_Q2.bed ~/TD/quartiles/auto_Q3.bed ~/TD/quartiles/auto_Q4.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out gz/DFT_H3K4me3_broad_auto.gz

computeMatrix reference-point \
  -S DFT_H3K4me3_broad.bw \
  -R ~/TD/quartiles/X_Q1.bed ~/TD/quartiles/X_Q2.bed ~/TD/quartiles/X_Q3.bed ~/TD/quartiles/X_Q4.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out gz/DFT_H3K4me3_broad_X.gz


  computeMatrix reference-point \
  -S DFT_TD_H3K4me3_narrow.bw \
  -R ~/TD/quartiles/auto_Q1.bed ~/TD/quartiles/auto_Q2.bed ~/TD/quartiles/auto_Q3.bed ~/TD/quartiles/auto_Q4.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out gz/DFT_H3K4me3_narrow_auto.gz

computeMatrix reference-point \
  -S DFT_TD_H3K4me3_narrow.bw \
  -R ~/TD/quartiles/X_Q1.bed ~/TD/quartiles/X_Q2.bed ~/TD/quartiles/X_Q3.bed ~/TD/quartiles/X_Q4.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out gz/DFT_H3K4me3_narrow_X.gz


  computeMatrix reference-point \
  -S F_H3K4me3_broad_normalised.bw \
  -R ~/TD/quartiles/auto_Q1.bed ~/TD/quartiles/auto_Q2.bed ~/TD/quartiles/auto_Q3.bed ~/TD/quartiles/auto_Q4.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out gz/F_H3K4me3_broad_auto.gz

computeMatrix reference-point \
  -S F_H3K4me3_broad_normalised.bw \
  -R ~/TD/quartiles/X_Q1.bed ~/TD/quartiles/X_Q2.bed ~/TD/quartiles/X_Q3.bed ~/TD/quartiles/X_Q4.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out gz/F_H3K4me3_broad_X.gz
  

  computeMatrix reference-point \
  -S F_H3K4me3_narrow_normalised.bw \
  -R ~/TD/quartiles/auto_Q1.bed ~/TD/quartiles/auto_Q2.bed ~/TD/quartiles/auto_Q3.bed ~/TD/quartiles/auto_Q4.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out gz/F_H3K4me3_narrow_auto.gz

computeMatrix reference-point \
  -S F_H3K4me3_narrow_normalised.bw \
  -R ~/TD/quartiles/X_Q1.bed ~/TD/quartiles/X_Q2.bed ~/TD/quartiles/X_Q3.bed ~/TD/quartiles/X_Q4.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out gz/F_H3K4me3_narrow_X.gz


  plotProfile \
  -m DFT_H3K9ac_narrow_logFE.gz \
  --perGroup \
  --colors blue green orange red \
  -out quartile_profile.png

  plotProfile \
  -m DFT_H3K9ac_narrow_logFE.gz \
  --perGroup \
  --outFileNameData profile_data.tsv \
  -out temp.png

  plotProfile \
  -m DFT_H3K9ac_narrow_normalised.gz \
  --outFileNameData DFT_H3K9ac_profile_data.tsv















################# OLD^2 ############################

computeMatrix reference-point \
  -S DFT_H3K9ac_narrow_logFE.bw \
  -R ~/TD/quartiles/genes_Q0.bed ~/TD/quartiles/genes_Q1.bed ~/TD/quartiles/genes_Q2.bed ~/TD/quartiles/genes_Q3.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out DFT_H3K9ac_narrow_logFE.gz


  plotProfile \
  -m DFT_H3K9ac_narrow_logFE.gz \
  --perGroup \
  --colors blue green orange red \
  -out quartile_profile.png

  plotProfile \
  -m DFT_H3K9ac_narrow_logFE.gz \
  --perGroup \
  --outFileNameData profile_data.tsv \
  -out temp.png

  plotProfile \
  -m DFT_H3K9ac_narrow_normalised.gz \
  --outFileNameData DFT_H3K9ac_profile_data.tsv



  ############ new method using bamcoverage ############

  computeMatrix reference-point \
  -S DFT_TD_H3K9ac_narrow_normalised.bw \
  -R ~/TD/quartiles/genes_Q0.bed ~/TD/quartiles/genes_Q1.bed ~/TD/quartiles/genes_Q2.bed ~/TD/quartiles/genes_Q3.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  -out DFT_H3K9ac_narrow_normalised.gz

  plotProfile \
  -m DFT_H3K9ac_narrow_normalised.gz \
  --perGroup \
  --colors blue green orange red \
  -out trial1.png


  computeMatrix reference-point \
  -S DFT_TD_H3K9ac_narrow_normalised.bw \
  -R ~/TD/quartiles/genes_Q0.bed ~/TD/quartiles/genes_Q1.bed ~/TD/quartiles/genes_Q2.bed ~/TD/quartiles/genes_Q3.bed \
  --referencePoint TSS \
  -b 10000 -a 10000 \
  --binSize 50 \
  --skipZeros \
  -out DFT_H3K9ac_skipzeroes.gz \
  -p 8

  plotProfile \
  -m DFT_H3K9ac_skipzeroes.gz \
  --perGroup \
  --colors blue green orange red \
  -out trial1_skipzeroes.png

