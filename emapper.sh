#!/bin/bash

#SBATCH --job-name=eggnogmapper
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/eggnogmapper.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/eggnogmapper.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

### ENVIRONMENT
module load eggnogmapper 
module list

### VARIABLES
path="/lisc/data/scratch/course/2025w300106/wachelder"
outDir="${path}/results/emapper_results"

### EXECUTION
echo "Started job at $(date)"
mkdir -p $outDir

emapper.py -i ${path}/proteins.fasta --go_evidence experimental --output_dir ${outDir} -o eggresults \
--cpu 16 --itype proteins -m diamond --evalue 1e-5 --temp_dir ${path}/tempDir

echo "Job finished at $(date)"

# Input is the protein FASTA file.
# go_evidence only assigns GO terms with experimental evidence, not predicted ones. This
# produces high-confidence functional annotations.
# -o is again the prefix for the output file.
# Using 16 CPU threads because EggNOG can parallelize searches.
# -m diamond is a search method, it is a fast sequence alignment method.
# evalue sets a threshold, only hits with e-value < 1e-5 are considered, this filters out
# weak homology matches.
# temp_dir for storing temporary files in this directory.
