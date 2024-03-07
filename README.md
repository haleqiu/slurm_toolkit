# Generate SLURM Scripts Tool

This tool automates the creation of SLURM job scripts from experiment configuration files. It scans a specified directory for `.conf` files, generates a SLURM job script for each found configuration, and organizes the scripts into date-stamped directories.

## Requirements

- Bash shell
- Access to a SLURM-managed compute cluster

## Setup

1. **SLURM Script Template:** Prepare a SLURM script template named `slurm_template.sh` and place it in a known directory. Ensure the template includes placeholders for dynamic content:
    - `JOB_NAME_PLACEHOLDER` for the job name
    - `OUTPUT_DIR_PLACEHOLDER` for the output directory
    - `CONFIG_FILE_PLACEHOLDER` for the configuration file path

2. **Script File:** Ensure `generate_slurm_scripts.sh` is in your desired location and has execute permissions:
    ```bash
    chmod +x generate_slurm_scripts.sh
    ```

## Usage

1. Edit `generate_slurm_scripts.sh` to specify:
    - The root directory containing your `.conf` files (`root_dir` variable).
    - The base directory where the SLURM scripts should be saved (`base_slurm_scripts_dir` variable).
    - The path to your `slurm_template.sh` file (`template_path` variable).

2. Run the script:
    ```bash
    ./generate_slurm_scripts.sh
    ```

3. SLURM job scripts will be generated in the specified base directory, organized into subdirectories named after the parent directory of each `.conf` file and the current date (e.g., `experimentName_YYYY-MM-DD`).

4. Submit the generated SLURM scripts to your cluster as usual, for example:
    ```bash
    sbatch /path/to/slurm_scripts/experimentName_YYYY-MM-DD/configName.slurm
    ```

## Notes

- Ensure your SLURM script template (`slurm_template.sh`) matches your job requirements and environment settings.
- Modify the placeholders in `generate_slurm_scripts.sh` as necessary to fit your specific project structure and requirements.
