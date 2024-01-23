#!/bin/bash
#This is my fruit script!

wc -l fruits.txt

cat fruits.txt | cut -f1 | grep "apple" -c -i

cat fruits.txt | cut -f2 | grep -v "Day2" -c -i

#This is the end!
