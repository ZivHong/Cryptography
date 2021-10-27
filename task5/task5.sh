#!/bin/bash
export _pass=1234
# head -c 1024 /dev/urandom > origin.txt
# truncate -s 1024 origin.txt
for j in cbc cfb ecb ofb; do  
    openssl enc -e -aes-128-$j -in origin.txt -out 1024-$j.txt -pbkdf2 -pass env:_pass
    python corrupt.py 1024-$j.txt 1024bad-$j.txt 
    openssl enc -d -aes-128-$j -in 1024bad-$j.txt -out $j-new.txt -pbkdf2 -pass env:_pass
    rm -rf 1024*
done