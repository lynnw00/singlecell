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
