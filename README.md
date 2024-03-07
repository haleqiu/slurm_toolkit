# Generate SLURM Scripts Tool

This tool automates the creation of SLURM job scripts from experiment configuration files. It scans a specified directory for `.conf` files, generates a SLURM job script for each found configuration, and organizes the scripts into date-stamped directories.

## Setup

1. **SLURM Script Template:** Prepare a SLURM script template named `slurm_template.sh` and place it in a known directory. Ensure the template includes placeholders for dynamic content:
    - `JOB_NAME_PLACEHOLDER` for the job name
    - `OUTPUT_DIR_PLACEHOLDER` for the output directory
    - `CONFIG_FILE_PLACEHOLDER` for the configuration file path

## Usage

1. Edit `slurm_from.sh` to specify:
    - The root directory containing your `.conf` files (`root_dir` variable).
    - The base directory where the SLURM scripts should be saved (`base_slurm_scripts_dir` variable).
    - The path to your `slurm_template.sh` file (`template_path` variable).

2. Run the script:
    ```bash
    ./slurm_from.sh
    ```

3. SLURM job scripts will be generated in the specified base directory, organized into subdirectories named after the parent directory of each `.conf` file and the current date (e.g., `experimentName_YYYY-MM-DD`).

4. Submit the generated SLURM scripts to your cluster as usual, for example:
    ```bash
    sbatch /path/to/slurm_scripts/experimentName_YYYY-MM-DD/configName.slurm
    ```

## Notes

- Ensure your SLURM script template (`slurm_template.sh`) matches your job requirements and environment settings.
- Modify the placeholders in `slurm_from.sh` as necessary to fit your specific project structure and requirements.

## Submitting SLURM Scripts

To efficiently submit all SLURM job scripts from a specified directory, utilize the `run_sbatch.sh` script. This facilitates the batch submission of multiple job scripts, streamlining the process.

### Usage

"""bash
./run_sbatch.sh /path/to/slurm_scripts_directory
"""