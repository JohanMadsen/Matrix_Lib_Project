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
./matmult_c.gcc blk 1000 1000 1000 4  >> blk/best_blk.txt
./matmult_c.gcc blk 1000 1000 1000 8  >> blk/best_blk.txt
./matmult_c.gcc blk 1000 1000 1000 16  >> blk/best_blk.txt
./matmult_c.gcc blk 1000 1000 1000 32  >> blk/best_blk.txt
./matmult_c.gcc blk 1000 1000 1000 64  >> blk/best_blk.txt
./matmult_c.gcc blk 1000 1000 1000 128  >> blk/best_blk.txt
./matmult_c.gcc blk 1000 1000 1000 256  >> blk/best_blk.txt
