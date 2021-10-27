#!/bin/bash
# all zero
# truncate -s 5 5byte.txt
export _pass=1234
head -c 64 /dev/urandom > 64.txt
for j in cbc cfb ecb ofb; do  
    openssl enc -e -aes-128-$j -in 64.txt -out 64-$j.txt -iter 1 -pass env:_pass
done
for i in 5 10 16 ;  do  
    head -c $i /dev/urandom > $i.txt
    openssl enc -e -aes-128-cbc -in $i.txt -out $i-cbc.txt -iter 1 -pass env:_pass
    openssl enc -d -aes-128-cbc -in $i-cbc.txt -out $i-new.txt -iter 1 -pass env:_pass
    rm -rf $i.txt
done