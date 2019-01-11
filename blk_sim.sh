#!/bin/bash

export MATMULT_COMPARE=0
#BSUB -J MATMULT_SIM
#BSUB -o matmult_sim_%J.out
#BSUB -q hpcintro
#BSUB -W 15
#BSUB -R "rusage[mem=8GB]"

module load gcc/8.2.0
mkdir blk

rm -f blk/best_blk.txt
./matmult_c.gcc blk 2500 2500 2500 32  >> blk/best_blk.txt
./matmult_c.gcc blk 2500 2500 2500 64  >> blk/best_blk.txt
./matmult_c.gcc blk 2500 2500 2500 128  >> blk/best_blk.txt
./matmult_c.gcc blk 2500 2500 2500 256  >> blk/best_blk.txt
./matmult_c.gcc blk 2500 2500 2500 512  >> blk/best_blk.txt
