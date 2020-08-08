#!/usr/bin/env bash
# slurm template for serial jobs

# Set SLURM options
#SBATCH --job-name=serial_test                  # Job name
#SBATCH --output=serial_test-%j.out             # Standard output and error log
#SBATCH --mail-user=username@middlebury.edu     # Where to send mail	
#SBATCH --mail-type=NONE                        # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mem=100mb                             # Job memory request
#SBATCH --partition=standard                    # Partition (queue) 
#SBATCH --time=00:05:00                         # Time limit hrs:min:sec

# print SLURM envirionment variables
echo "Job ID: ${SLURM_JOB_ID}"
echo "Node: ${SLURMD_NODENAME}"
echo "Starting: "`date +"%D %T"`

# Your calculations here
RUNPATH=$HOME
cd $RUNPATH
source $HOME/.virtualenvs/AdS/bin/activate
echo "Job ID: ${SLURM_JOB_ID}"
echo "Node: ${SLURMD_NODENAME}"
echo "Starting: "`date +"%D %T"`
cd $HOME/HPC/sample-slurm-scripts/
pip3 install -r requirements.txt
pip list
python3  test.py

deactivate


# End of job info
echo "Ending:   "`date +"%D %T"`
