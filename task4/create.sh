#!/bin/bash
export _pass=1234
head -c 30 /dev/urandom > 30.txt
for j in cbc cfb ecb ofb; do  
    openssl enc -e -aes-128-$j -in 30.txt -out 30-$j.txt -iter 1 -pass env:_pass
done
for i in 5 10 16 ;  do  
    head -c $i /dev/urandom > $i.txt
    openssl enc -e -aes-128-cbc -in $i.txt -out $i-cbc.txt -iter 1 -pass env:_pass
    openssl enc -d -aes-128-cbc -in $i-cbc.txt -out $i-new.txt -iter 1 -pass env:_pass -nopad
    rm -rf $i-cbc.txt
done