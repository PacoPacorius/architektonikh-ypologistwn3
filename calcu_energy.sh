#!/usr/bin/bash

# need to calculate the total energy consumed, power*time
# Step 1: extract the Peak Power from McPat files
# Step 2: extract time run by GEM5 files
# Step 3: multiply, put all results in one file

OUTPUT=~/simeiwseis/7o_eksamino/architektonikh/ergasia3/energy2.md
echo '' > $OUTPUT
cd ~/simeiwseis/7o_eksamino/architektonikh/ergasia3/benchmarks
for i in specbzip spechmmer speclibm specmcf specsjeng; do
    cd $i
    echo "#### $i" >> $OUTPUT
    echo '```' >> $OUTPUT
    for j in cache_line l1d_assoc l1d_size l1i_assoc l1i_size l2_assoc l2_size; do
        cd $j
        for k in *; do
            cd $k
            time=$(awk '$1=="sim_seconds" {print $2}' stats.txt)
            #time=$(cat stats.txt | grep sim_seconds | cut -c 46- | cut -c -8)
            #power=$(cat mcpat_result.txt | grep "Peak Power" | cut -c 16- | tr -dc '[. [:digit:]]')
            power=$(awk '$1=="Peak" && $2=="Power" {print $4}' mcpat_result.txt)
            energy=$(echo $time*$power | bc -l) 
            echo "$j $k: $energy  " >> $OUTPUT
            cd ..
        done
        cd ..
    done
    cd ..
    echo '```' >> $OUTPUT
    echo '' >> $OUTPUT
done
cat $OUTPUT
