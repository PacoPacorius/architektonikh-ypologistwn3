#!/bin/bash

mcpat="${HOME}/Desktop/mcpat"

for benchmark in spec*/*/*
do 
    ${mcpat}/mcpat/mcpat -infile ${benchmark}/cpu.xml > ${benchmark}/mcpat_result.txt
done
