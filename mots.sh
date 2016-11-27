#!/bin/bash

f=file_output.txt
w=tmp.mp3

#trap "{ rm -f $f $w ; exit 255 }" EXIT

rm -rf $f 
touch $f
for i in {1..20}; do
    n=$( cat liste.de.mots.francais.txt | grep 'é' | sort -R liste.de.mots.francais.txt | head -n 1);
    gtts-cli.py -l 'fr' -o $w "$n" &>/dev/null;
    mpg123 tmp.mp3 &>/dev/null
    echo $n >> $f
    rm -rf tmp.mp3
    read
    echo $n
done

exit 0

