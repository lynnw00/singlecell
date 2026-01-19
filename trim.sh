#!/bin/bash

#SBATCH --job-name=trimmomatic
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=4:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/trimmomatic.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/trimmomatic.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

### ENVIRONMENT
module load Trimmomatic
module list

### VARIABLES
wd="/lisc/data/scratch/course/2025w300106/wachelder"
outDir="$wd/results/trimmomatic"

### EXECUTION
echo "Started job at $(date)"
mkdir -p $outDir

trimmomatic PE -threads 4 -summary $outDir/summary \
  $wd/SRR9045763_1.fastq $wd/SRR9045763_2.fastq \
  -baseout $outDir/SRR9045763_ \
  ILLUMINACLIP:$wd/trim_adapters.fa:2:30:10 \
  SLIDINGWINDOW:4:20 MINLEN:75
echo "Job finished at $(date)"

