# #!/bin/bash
gem5="${HOME}/Desktop/gem5"
program_location="${gem5}/spec_cpu2006"
testVariable="l2_size"
options="--cpu-type=MinorCPU --caches --l2cache"

command="${program_location}/401.bzip2/src/specbzip -o \"${program_location}/401.bzip2/data/input.program 10\""
benchmark="specbzip/l2_size"
for l2_size in 32kB 64kB 128kB 256kB 512kB 1MB 2MB 4MB
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${l2_size} ${gem5}/configs/example/se.py ${options} --${testVariable} ${l2_size} -c ${command} -I 100000000 &
done
wait

command="${program_location}/429.mcf/src/specmcf -o \"${program_location}/429.mcf/data/inp.in\""
benchmark="specmcf/l2_size"
for l2_size in 32kB 64kB 128kB 256kB 512kB 1MB 2MB 4MB
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${l2_size} ${gem5}/configs/example/se.py ${options} --${testVariable} ${l2_size} -c ${command} -I 100000000 &
done
wait

command="${program_location}/456.hmmer/src/spechmmer -o \"--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 ${program_location}/456.hmmer/data/bombesin.hmm\""
benchmark="spechmmer/l2_size"
for l2_size in 32kB 64kB 128kB 256kB 512kB 1MB 2MB 4MB
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${l2_size} ${gem5}/configs/example/se.py ${options} --${testVariable} ${l2_size} -c ${command} -I 100000000 &
done
wait

command="${program_location}/458.sjeng/src/specsjeng -o ${program_location}/spec_cpu2006/458.sjeng/data/test.txt"
benchmark="specsjeng/l2_size"
for l2_size in 32kB 64kB 128kB 256kB 512kB 1MB 2MB 4MB
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${l2_size} ${gem5}/configs/example/se.py ${options} --${testVariable} ${l2_size} -c ${command} -I 100000000 &
done
wait

command="${program_location}/470.lbm/src/speclibm -o \"20 ${program_location}/470.lbm/data/lbm.in 0 1 ${program_location}/470.lbm/data/100_100_130_cf_a.of\""
benchmark="speclibm/l2_size"
for l2_size in 32kB 64kB 128kB 256kB 512kB 1MB 2MB 4MB
do
    eval ${gem5}/build/ARM/gem5.opt -d ${benchmark}/${l2_size} ${gem5}/configs/example/se.py ${options} --${testVariable} ${l2_size} -c ${command} -I 100000000 &
done
wait
