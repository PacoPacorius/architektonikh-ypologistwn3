#!/bin/bash

for parameter in cache\_line l1d\_assoc l1d\_size l1i\_assoc l1i\_size l2\_assoc l2\_size
do
    gnuplot -e "filename='${parameter}'" plotScript
done
