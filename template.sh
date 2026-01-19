#!/bin/bash

#SBATCH --job-name=StringTie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/StringTie.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/StringTie.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

### ENVIRONMENT
module load StringTie
module list

### VARIABLES
path="/lisc/data/scratch/course/2025w300106/wachelder"


### EXECUTION
echo "Started job at $(date)"
mkdir -p $outDir

<code>

echo "Job finished at $(date)"
