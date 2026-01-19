#!/bin/bash

#SBATCH --job-name=stringtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=5G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/stringtie.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/stringtie.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

### ENVIRONMENT
module load StringTie
module list

### VARIABLES
path="/lisc/data/scratch/course/2025w300106/wachelder"
inBam="$path/results/STAR_trimmed/SRR9045763_Aligned.sortedByCoord.out.bam"
outDir="$path/results/StringTie"

### EXECUTION
echo "Started job at $(date)"
mkdir -p $outDir

stringtie $inBam -l ASM -o $outDir/bioDataAnalysis_ASM.gtf -p 4 -j 5 -g 200 -m 200

echo "Job finished at $(date)"
