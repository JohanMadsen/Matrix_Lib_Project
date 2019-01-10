#!/bin/bash

export MATMULT_COMPARE=0
#BSUB -J MATMULT_SIM
#BSUB -o matmult_sim_%J.out
#BSUB -q hpcintro
#BSUB -W 30
#BSUB -R "rusage[mem=8GB]"

module load gcc/8.2.0
mkdir fast

for i in {0..16}
do
	./matmult_c.gcc mkn $((32+128*$i)) $((32+128*$i)) $((32+128*$i)) >> fast/mkn.txt
	./matmult_c.gcc mnk $((32+128*$i)) $((32+128*$i)) $((32+128*$i)) >> fast/mnk.txt
	./matmult_c.gcc nkm $((32+128*$i)) $((32+128*$i)) $((32+128*$i)) >> fast/nkm.txt
	./matmult_c.gcc nmk $((32+128*$i)) $((32+128*$i)) $((32+128*$i)) >> fast/nmk.txt
	./matmult_c.gcc knm $((32+128*$i)) $((32+128*$i)) $((32+128*$i)) >> fast/knm.txt
	./matmult_c.gcc kmn $((32+128*$i)) $((32+128*$i)) $((32+128*$i)) >> fast/kmn.txt
	./matmult_c.gcc lib $((32+128*$i)) $((32+128*$i)) $((32+128*$i)) >> fast/lib.txt
done
