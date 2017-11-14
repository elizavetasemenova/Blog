#!/bin/bash
comm/stan/l383_spat sample num_samples=2000 num_warmup=2000 thin=1 adapt delta=0.99 algorithm=hmc engine=nuts max_depth=15 data file=data/getdata_m$m.R init=data/getinits_m$m.R output file=samples_m${m}_c${c}.csv
