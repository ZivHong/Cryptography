#!/bin/bash
# head -c 54 origin.bmp > header
# tail -c +55 lena.bmp > body
if [[ -z $1 && -z $2 ]]; then
    printf "Please select two bmp file\n"
    printf "combine.sh 1.bmp 2.bmp \n"
    exit 1 
fi
head -c 54 $1 > header
tail -c +55 $2 > body
cat header body > new.bmp
rm -rf header body