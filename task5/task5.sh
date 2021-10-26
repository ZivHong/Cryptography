#!/bin/bash
export _pass=1234
declare -i i=1024
head -c $i /dev/urandom > $i.txt
for j in cbc cfb ecb ofb; do  
    openssl enc -e -aes-128-$j -in $i.txt -out $i-$j.txt -iter 1 -pass env:_pass
done