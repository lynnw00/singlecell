#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/fastqc.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/fastqc.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at


module load FastQC

### VARIABLES
outDir="/lisc/data/scratch/course/2025w300106/wachelder/results/fastqc"
readsDir="/lisc/data/scratch/course/2025w300106/wachelder"


### EXECUTION
echo "Started job at $(date)"
mkdir $outDir
fastqc -t 2 -o $outDir $readsDir/SRR9045763_1.fastq $readsDir/SRR9045763_2.fastq
echo "Job finished at $(date)"

