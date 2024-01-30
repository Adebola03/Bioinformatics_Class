#!/bin/bash
#This is my script

gunzip ERR020236_1.fastq.gz
awk '(NR%4==2)' ERR020236_1.fastq.gz | wc -l
awk '(NR%4==2)' ERR020236_1.fastq.gz | grep 'N' | wc -l
awk '(NR%4==2)' ERR020236_1.fastq.gz | awk 'NR==59' | grep -o '[ATCG]' | sort | uniq -c

#Thus is the end of my script
#Adebola Agboola
