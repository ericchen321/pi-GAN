#!/bin/bash
#SBATCH --time=00:15:00
#SBATCH --account=def-rhodin
#SBATCH --job-name=trainCatsOneGPUPilotRun
#SBATCH --gres=gpu:v100l:1
#SBATCH --mem=24G
module load python/3.7
module load StdEnv/2020

cd /home/gxc321/
source PiGanEnv/bin/activate
cd /home/gxc321/scratch/pi-GAN/
export CUDA_VISIBLE_DEVICES=0
python train.py --curriculum CATS --output_dir catOutputDir
