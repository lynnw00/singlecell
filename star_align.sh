#!/bin/bash

#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/STAR.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/STAR.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

## ENVIRONMENT
module load STAR
module list

## EXECUTION
STAR --genomeDir /lisc/data/scratch/course/2025w300106/wachelder/ASM_STAR --runThreadN 16 --readFilesIn /lisc/data/scratch/course/2025w300106/wachelder/SRR9045763_1.fastq /lisc/data/scratch/course/2025w300106/wachelder/SRR9045763_2.fastq --outFileNamePrefix /lisc/data/scratch/course/2025w300106/wachelder/results/map/SRR9045763_ASM_ --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate 
