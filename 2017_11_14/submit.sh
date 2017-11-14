#!/bin/bash
for m in {49..52}
do
 for c in {1..3}
 do
  sbatch --job-name=m$m.$c.5dx --mem-per-cpu=20G --qos=infinite --ntasks=1 --error=m$m.$c.5dx.err --output=m$m.$c.5dx.out --export=m=$m,c=$c cmdstan_call.sbatch
 done
done
