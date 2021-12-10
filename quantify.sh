#!/bin/bash
#PBS -d  .
#PBS -l walltime=500:00:00 
#PBS -l nodes=1

input=/home/azbukinanadezda/Swiss/datasets/neurons/SraAccList.txt

while IFS=":" read -r line

do
samp=`basename data/${line}`
echo "Processing sample ${samp}"
	
#/home/azbukinanadezda/miniconda3/envs/salmon/bin/salmon quant -i /home/azbukinanadezda/#SRP125604_processing/hum_index -l A -1 data/${line}/${samp}_1.fastq -2 data/${line}/${samp}#_2.fastq -p 8 --validateMappings -o quants-gencode/${samp} --useVBOpt --seqBias

/home/azbukinanadezda/miniconda3/envs/salmon/bin/salmon quant -i /home/Swiss/mice_transc/mouse_index -l A -r /home/azbukinanadezda/Swiss/datasets/neurons/data/${line}/${samp}.fastq  -p 8 --validateMappings -o quants-gencode/${samp} --useVBOpt --seqBias



done < $input
