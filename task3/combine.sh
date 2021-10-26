#!/bin/bash
head -c 54 origin.bmp > header
tail -c +55 lena.bmp > body
cat header body > new.bmp
rm -rf header body