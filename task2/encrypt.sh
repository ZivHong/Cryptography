#!/bin/bash
export _pass=1234
# list all cipher by 'openssl env -list'
for i in aes camellia aria ;  do  
    echo "${i}128:"
    start=$(date +%s.%N)
    openssl enc -e -${i}128 -in plain.txt -out ${i}128.txt -iter 1 -pass env:_pass -p
    echo -e "time cost : \c"
    echo "$(date +%s.%N) - $start " | bc
    echo ""
done