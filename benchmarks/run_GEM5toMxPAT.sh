mcpat="${HOME}/Desktop/mcpat"

for benchmark in spec*/*/*
do 
    ${mcpat}/Scripts/GEM5ToMcPAT.py ${benchmark}/stats.txt ${benchmark}/config.json ${mcpat}/mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o ${benchmark}/cpu.xml
done
