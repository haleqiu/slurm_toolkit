#!/bin/bash

# Directory containing all experiment folders
root_dir="../slurm"

# Base directory for SLURM scripts (without the date)
base_slurm_scripts_dir="."

# Get the current date in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)

# Path to the SLURM script template
template_path="./slurm_template.slurm"

# Read the SLURM script template from the file
slurm_script_template=$(cat "$template_path")

# Browse through directory and read all *.conf files
find "$root_dir" -type f -name "*.conf" | while read -r config_file; do
    # Extract the config file name without extension and parent directory name
    conf_name=$(basename "$config_file" .conf)
    exp_dir=$(dirname "$config_file")
    parent_dir_name=$(basename "$exp_dir")

    # Create a new folder for SLURM scripts, including the date in the folder name
    slurm_scripts_dir="$base_slurm_scripts_dir/${parent_dir_name}_${current_date}"
    mkdir -p "$slurm_scripts_dir"

    # Replace placeholders in the template
    job_script="${slurm_script_template//JOB_NAME_PLACEHOLDER/$conf_name}"
    job_script="${job_script//CONFIG_FILE_PLACEHOLDER/$config_file}"
    job_script="${job_script//OUTPUT_DIR_PLACEHOLDER/${slurm_scripts_dir//\//\\/}}"

    # Save the SLURM script to a file with the same name as the config file
    script_path="$slurm_scripts_dir/$conf_name.slurm"
    echo "$job_script" > "$script_path"
    echo "Generated SLURM script: $script_path"
done

echo "All SLURM scripts have been generated."
