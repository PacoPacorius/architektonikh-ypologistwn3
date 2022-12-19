#!/bin/bash

mcpat="${HOME}/Desktop/mcpat"

#for benchmark in spec*/*/*
#do 
#    ${mcpat}/mcpat/mcpat -infile ${benchmark}/cpu.xml > ${benchmark}/mcpat_result.txt
#done

#benchmark="specsjeng/l2_size"
#value="64kB"
#cd ${benchmark}


parameter="l2_size"
echo "${parameter} 32kB 64kB 128kB 256kB 512kB 1MB 2MB 4MB" > ${parameter}.dat
#for size in 32kB 64kB 128kB 256kB 512kB 1MB 2MB 4MB
for benchmark in spec*
do
    echo -n "${benchmark} " >> ${parameter}.dat
    #for benchmark in spec*/${parameter}/${size}/mcpat_result.txt
    for size in 32kB 64kB 128kB 256kB 512kB 1MB 2MB 4MB
    #for benchmark in spec*/
    do
        file="${benchmark}/${parameter}/${size}/mcpat_result.txt"
        grep "Peak Power" ${file} | cut -d " " -f 6 | tr '\n' ' ' >> ${parameter}.dat
    done
    echo "" >> ${parameter}.dat
    #echo -n "${value} " >> Peak_Power.dat
    #grep "Peak Power" ${value}/mcpat_result.txt | cut -d " " -f 6 >> Peak_Power.dat
done


parameter="l1i_size"
echo "${parameter} 2kB 4kB 8kB 16kB 32kB 64kB 128kB" > ${parameter}.dat
for benchmark in spec*
do
    echo -n "${benchmark} " >> ${parameter}.dat
    for size in 2kB 4kB 8kB 16kB 32kB 64kB 128kB
    do
        file="${benchmark}/${parameter}/${size}/mcpat_result.txt"
        grep "Peak Power" ${file} | cut -d " " -f 6 | tr '\n' ' ' >> ${parameter}.dat
    done
    echo "" >> ${parameter}.dat
done


parameter="l1d_size"
echo "${parameter} 2kB 4kB 8kB 16kB 32kB 64kB 128kB" > ${parameter}.dat
for benchmark in spec*
do
    echo -n "${benchmark} " >> ${parameter}.dat
    for size in 2kB 4kB 8kB 16kB 32kB 64kB 128kB
    do
        file="${benchmark}/${parameter}/${size}/mcpat_result.txt"
        grep "Peak Power" ${file} | cut -d " " -f 6 | tr '\n' ' ' >> ${parameter}.dat
    done
    echo "" >> ${parameter}.dat
done


parameter="l2_assoc"
echo "${parameter} 1 2 4 8 16" > ${parameter}.dat
for benchmark in spec*
do
    echo -n "${benchmark} " >> ${parameter}.dat
    for size in 1 2 4 8 16
    do
        file="${benchmark}/${parameter}/${size}/mcpat_result.txt"
        grep "Peak Power" ${file} | cut -d " " -f 6 | tr '\n' ' ' >> ${parameter}.dat
    done
    echo "" >> ${parameter}.dat
done

parameter="l2_assoc"
echo "${parameter} 1 2 4 8 16" > ${parameter}.dat
for benchmark in spec*
do
    echo -n "${benchmark} " >> ${parameter}.dat
    for size in 1 2 4 8 16
    do
        file="${benchmark}/${parameter}/${size}/mcpat_result.txt"
        grep "Peak Power" ${file} | cut -d " " -f 6 | tr '\n' ' ' >> ${parameter}.dat
    done
    echo "" >> ${parameter}.dat
done

parameter="l1i_assoc"
echo "${parameter} 1 2 4 8 16" > ${parameter}.dat
for benchmark in spec*
do
    echo -n "${benchmark} " >> ${parameter}.dat
    for size in 1 2 4 8 16
    do
        file="${benchmark}/${parameter}/${size}/mcpat_result.txt"
        grep "Peak Power" ${file} | cut -d " " -f 6 | tr '\n' ' ' >> ${parameter}.dat
    done
    echo "" >> ${parameter}.dat
done

parameter="l1d_assoc"
echo "${parameter} 1 2 4 8 16" > ${parameter}.dat
for benchmark in spec*
do
    echo -n "${benchmark} " >> ${parameter}.dat
    for size in 1 2 4 8 16
    do
        file="${benchmark}/${parameter}/${size}/mcpat_result.txt"
        grep "Peak Power" ${file} | cut -d " " -f 6 | tr '\n' ' ' >> ${parameter}.dat
    done
    echo "" >> ${parameter}.dat
done



parameter="cache_line"
echo "${parameter} 32 64 128 256 512" > ${parameter}.dat
for benchmark in spec*
do
    echo -n "${benchmark} " >> ${parameter}.dat
    for size in 32 64 128 256 512
    do
        file="${benchmark}/${parameter}/${size}/mcpat_result.txt"
        grep "Peak Power" ${file} | cut -d " " -f 6 | tr '\n' ' ' >> ${parameter}.dat
    done
    echo "" >> ${parameter}.dat
done

