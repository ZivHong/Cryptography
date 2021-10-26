#!/bin/bash
# all zero
# truncate -s 5 5byte.txt
export _pass=1234
for i in 5 10 16 ;  do  
    head -c $i /dev/urandom > $i.txt
    for j in cbc cfb ecb ofb; do  
        openssl enc -e -aes-128-$j -in $i.txt -out $i-$j.txt -iter 1 -pass env:_pass
    done
done