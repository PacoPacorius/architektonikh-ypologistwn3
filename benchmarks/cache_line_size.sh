# #!/bin/bash
gem5="${HOME}/Desktop/gem5"
program_location="${gem5}/spec_cpu2006"
testVariable="cacheline_size"
options="--cpu-type=MinorCPU --caches --l2cache"

command="${program_location}/401.bzip2/src/specbzip -o \"${program_location}/401.bzip2/data/input.program 10\""
benchmark="specbzip/cache_line"
for cache_line in 32 64 128 256 512
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${cache_line} ${gem5}/configs/example/se.py ${options} --${testVariable} ${cache_line} -c ${command} -I 100000000 &
done
wait

command="${program_location}/429.mcf/src/specmcf -o \"${program_location}/429.mcf/data/inp.in\""
benchmark="specmcf/cache_line"
for cache_line in 32 64 128 256 512
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${cache_line} ${gem5}/configs/example/se.py ${options} --${testVariable} ${cache_line} -c ${command} -I 100000000 &
done
wait

command="${program_location}/456.hmmer/src/spechmmer -o \"--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 ${program_location}/456.hmmer/data/bombesin.hmm\""
benchmark="spechmmer/cache_line"
for cache_line in 32 64 128 256 512
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${cache_line} ${gem5}/configs/example/se.py ${options} --${testVariable} ${cache_line} -c ${command} -I 100000000 &
done
wait

command="${program_location}/458.sjeng/src/specsjeng -o ${program_location}/458.sjeng/data/test.txt"
benchmark="specsjeng/cache_line"
for cache_line in 32 64 128 256 512
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${cache_line} ${gem5}/configs/example/se.py ${options} --${testVariable} ${cache_line} -c ${command} -I 100000000 &
done
wait

command="${program_location}/470.lbm/src/speclibm -o \"20 ${program_location}/470.lbm/data/lbm.in 0 1 ${program_location}/470.lbm/data/100_100_130_cf_a.of\""
benchmark="speclibm/cache_line"
for cache_line in 32 64 128 256 512
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${cache_line} ${gem5}/configs/example/se.py ${options} --${testVariable} ${cache_line} -c ${command} -I 100000000 &
done
wait
