#!/bin/bash

#SBATCH --job-name=STAR_trim
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/STAR_trim.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/STAR_trim.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

## ENVIRONMENT
module load STAR
module list

## VARIABLES
wd="/lisc/data/scratch/course/2025w300106/wachelder"
outDir="$wd/results/STAR_trimmed"

## EXECUTION
echo "Started job at $(date)"
mkdir -p $outDir

STAR --genomeDir $wd/ASM_STAR \
--runThreadN 16 --readFilesIn $wd/results/trimmomatic/SRR9045763__1P $wd/results/trimmomatic/SRR9045763__2P \
--outFileNamePrefix $outDir/ --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate
echo "Job finished at $(date)"

