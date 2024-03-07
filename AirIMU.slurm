#!/bin/bash

# SLURM Resource Parameters

#SBATCH -N 1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=4
#SBATCH -t 2-00:00 # D-HH:MM
#SBATCH --mail-user=yuhengq@andrew.cmu.edu
#SBATCH --mail-type=ALL
#SBATCH -p a100-gpu-full
#SBATCH --gres=gpu:1
#SBATCH --mem=32G
#SBATCH --job-name=JOB_NAME_PLACEHOLDER
#SBATCH --output=OUTPUT_DIR_PLACEHOLDER/JOB_NAME_PLACEHOLDER.script.out
#SBATCH -e OUTPUT_DIR_PLACEHOLDER/job-%x.%j.err

# Executable


singularity exec --nv /data2/datasets/yuhengq/sif/pypose.sif sh run_exp.sh --dir=/home/yuhengq/workspace/AirIMU/IMUnet --conf=CONFIG_FILE_PLACEHOLDER