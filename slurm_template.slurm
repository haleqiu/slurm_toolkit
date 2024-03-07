#!/bin/sh
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=10G
#SBATCH --job-name="JOB_NAME_PLACEHOLDER"
#SBATCH --output=OUTPUT_DIR_PLACEHOLDER/JOB_NAME_PLACEHOLDER.script.out
#SBATCH -e OUTPUT_DIR_PLACEHOLDER/job-%x.%j.err
...
