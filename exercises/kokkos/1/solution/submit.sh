#!/bin/bash
#

#SBATCH --job-name=submit
#SBATCH --gres=gpu:1
#SBATCH --time=00:01:00
#SBATCH --partition=gpu-cascade
#SBATCH --qos=gpu

# Load the required modules
module load gcc cuda kokkos

export OMP_PLACES=cores
export OMP_PROC_BIND=close

for threads in 1 2 4 8; do
    export OMP_NUM_THREADS=$threads
    echo "OMP_NUM_THREADS=$OMP_NUM_THREADS"
    ./01_Exercise.OpenMP
done
