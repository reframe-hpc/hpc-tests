#!/bin/bash
#SBATCH --job-name="rfm_Gromacs_HECBioSim_61k_atoms_csd3_cclake_ib_gcc9_ompi3_ucx_56_56_job"
#SBATCH --ntasks=56
#SBATCH --ntasks-per-node=56
#SBATCH --output=rfm_Gromacs_HECBioSim_61k_atoms_csd3_cclake_ib_gcc9_ompi3_ucx_56_56_job.out
#SBATCH --error=rfm_Gromacs_HECBioSim_61k_atoms_csd3_cclake_ib_gcc9_ompi3_ucx_56_56_job.err
#SBATCH --time=1:0:0
#SBATCH --exclusive
#SBATCH --partition=cclake
#SBATCH --account=support-cpu
#SBATCH --exclude=cpu-p-[1-280,337-672]
module load openmpi-3.1.6-gcc-9.1.0-omffmfv
export SLURM_MPI_TYPE=pmix_v3
export UCX_NET_DEVICES=mlx5_0:1
module load gromacs-2016.6-gcc-9.1.0-kgomb67
time \
srun gmx_mpi mdrun -s benchmark.tpr -g 61k-atoms.log -noconfout
