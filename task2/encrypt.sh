#!/bin/bash
start=$(date +%s.%N)
openssl enc -e -aes128 -in plain.txt -out aes128.txt -pbkdf2 -pass pass:1234 -p
echo "$(date +%s.%N) - $start" | bc
start=$(date +%s.%N)
openssl enc -e -camellia128 -in plain.txt -out came128.txt -pbkdf2 -pass pass:1234 -p 
echo "$(date +%s.%N) - $start" | bc
start=$(date +%s.%N)
openssl enc -e -aria128 -in plain.txt -out aria128.txt -pbkdf2 -pass pass:1234 -p
start=$(date +%s.%N)
echo "$(date +%s.%N) - $start" | bc