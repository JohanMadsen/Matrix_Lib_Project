#!/bin/bash

export MATMULT_COMPARE=0
#BSUB -J MATMULT_SIM
#BSUB -o matmult_sim_%J.out
#BSUB -q hpcintro
#BSUB -W 30
#BSUB -R "rusage[mem=8GB]"

module load gcc/8.2.0
mkdir blk

rm -r blk/best3blk.txt

for i in {0..24}
do
	./matmult_c.gcc blk $((32+128*$i)) $((32+128*$i)) $((32+128*$i)) 256 >> blk/best3blk.txt
done
