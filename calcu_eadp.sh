#!/usr/bin/bash

# eadp is energy delay area product, meaning energy*delay*area => power*time * cpi*clock * area

OUTPUT=~/simeiwseis/7o_eksamino/architektonikh/ergasia3/eadp.md
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
            energy=$(echo $time*$power | bc) 
            cpi=$(awk '$1=="system.cpu.cpi" {print $2}' stats.txt)
            tick_freq=$(awk '$1=="sim_freq" {print $2}' stats.txt)
            tick_clk=$(awk '$1=="system.cpu_clk_domain.clock" {print $2}' stats.txt)
            freq=$(echo $tick_freq/$tick_clk | bc)
            delay=$(echo $cpi*$freq | bc)
            area=$(awk '$1=="Area" {print $3}' mcpat_result.txt | head -n 1)
            eadp=$(echo $energy*$delay*$area | bc)
            echo "$j $k: $eadp  " >> $OUTPUT
            cd ..
        done
        cd ..
    done
    cd ..
    echo '```' >> $OUTPUT
    echo '' >> $OUTPUT
done
cat $OUTPUT
