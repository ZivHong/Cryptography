#!/bin/bash
head -c 54 origin.bmp > header
export _pass=1234
for i in cbc ecb; do 
    openssl enc -e -aes-128-$i -in origin.bmp -out ${i}.bmp -iter 1 -pass env:_pass
    tail -c +55 ${i}.bmp > body
    rm -rf ${i}.bmp 
    cat header body > new_${i}.bmp
done
rm -rf header body