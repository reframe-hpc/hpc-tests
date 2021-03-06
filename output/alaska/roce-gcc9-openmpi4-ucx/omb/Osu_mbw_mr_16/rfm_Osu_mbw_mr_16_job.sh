#!/bin/bash
#SBATCH --job-name="rfm_Osu_mbw_mr_16_job"
#SBATCH --ntasks=16
#SBATCH --ntasks-per-node=8
#SBATCH --output=rfm_Osu_mbw_mr_16_job.out
#SBATCH --error=rfm_Osu_mbw_mr_16_job.err
#SBATCH --time=0:15:0
#SBATCH --exclusive
module load gcc/9.3.0-5abm3xg
module load openmpi/4.0.3-qpsxmnc
export SLURM_MPI_TYPE=pmix_v2
export UCX_NET_DEVICES=mlx5_1:1
module load osu-micro-benchmarks/5.6.2-vx3wtzo
srun osu_mbw_mr
