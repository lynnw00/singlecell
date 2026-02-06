#!/bin/bash

#SBATCH --job-name=cellranger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/wachelder/logs/cellranger.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/wachelder/logs/cellranger.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lynn.wachelder@univie.ac.at

### ENVIRONMENT
module load CellRanger
module list

### VARIABLES
path="/lisc/data/scratch/course/2025w300106"
index="${path}/common/NV2_fluo"
fastq_dir="${path}/common/blastula.12h/run1,${path}/common/blastula.12h/run2,${path}/common/blastula.12h/run3"
sample="89085"
outDir="${path}/wachelder/results/cellranger"
id="blastula_12h"

### EXECUTION
echo "Started job at $(date)"
mkdir -p ${outDir}
cd ${outDir}

cellranger count --transcriptome $index \
	--fastqs $fastq_dir \
	--sample $sample \
	--force-cells 10000 \
	--nosecondary \
	--localcores 16 \
	--id $id --create-bam false \

echo "Job finished at $(date)"

# Reference transcriptome, raw FASTQ files, sample ID.
# force-cells, to consider up to 10000 cells.
# nosecondary does not create secondary output files.
# 16 CPU cores to parallelize alignment, barcode processing and UMI counting.
# create-bam will not generate BAM file of reads, speeds up the run and reduces storage use.

