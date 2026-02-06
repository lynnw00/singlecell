#!/bin/bash

#SBATCH --job-name=filtered_featureCounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/filtered_featureCounts.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/filtered_featureCounts.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

### Counting reads per gene
module load Subread
module list

path="/lisc/data/scratch/course/2025w300106/wachelder"
gtfFile="$path/results/StringTie/filtered_gene_models.gtf"
bamfile="$path/results/STAR_trimmed/SRR9045763_filtered.bam"
outDir="$path/results/filtered_featureCounts"


### EXECUTION
# Changed some things to fit use the filtered gtf file rather than the other one.

echo "Started job at $(date)"
mkdir -p $outDir

featureCounts -p --countReadPairs -C -T 4 -s 2 --primary \
	-a $gtfFile -o $outDir/counts.tsv $bamfile
echo "Job finished at $(date)"
