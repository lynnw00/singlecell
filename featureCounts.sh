#!/bin/bash

#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/featureCounts.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/featureCounts.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

### Counting reads per gene
module load Subread
module list

path="/lisc/data/scratch/course/2025w300106/wachelder"
gtfFile="$path/test.gtf"
bamfile="$path/results/STAR_trimmed/SRR9045763_filtered.bam"
outDir="$path/results/featureCounts"


### EXECUTION
# I want to use -p for paired ends and counts only 1 read per template
# I want to count only primary alignments
# I believe this is a reverse stranded library
# I want to break free

echo "Started job at $(date)"
mkdir -p $outDir

featureCounts -p --countReadPairs -C -T 4 -s 2 --primary \
	-a $gtfFile -o $outDir/counts.tsv $bamfile
echo "Job finished at $(date)"

# Uses the aligned reads, the BAM file created with STAR.
# The GTF file contains the gene annotations.
# -p, it is paired-end data, looking at fragments and not individual reads.
# countReadPairs one unit per read pair, not two reads.
# -C checks for pair consistency. -T is the threads.
# -s is the strandedness, the data is stranded, reverse strand.
# Only counting primary alignments.
# -a is the annotation file, defining genes, transcripts and exons.
# The counts.tsv will contain gene ID, length and number of read pairs assigned to each gene.
