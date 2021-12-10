#!/bin/bash
#PBS -d  .
#PBS -l walltime=500:00:00 
#PBS -l nodes=1



#input=/home/azbukinanadezda/Glau_SRP171120/SraAccList.txt
input=$1

cd $2
mkdir data
cd data

while IFS=":" read -r line
do
mkdir $line
cd $line
echo $line
~/sratoolkit.2.9.2-ubuntu64/bin/prefetch $line
~/sratoolkit.2.9.2-ubuntu64/bin/fasterq-dump -S $line 

~/sratoolkit.2.9.2-ubuntu64/bin/vdb-validate  $line

cd ..
  
done < $input

cd .. 
