#!/bin/bash

f=file_output.txt
w=tmp.mp3

#trap "{ rm -f $f $w ; exit 255 }" EXIT

rm -rf $f 
touch $f
for ((;;)); do
    #n=$(echo $(( ( RANDOM % 100 ) )));
    l=$( cat liste.des.numeros.francais.txt | head -n 20 | sort -R | head -n 1);
    num_val=$(echo $l | awk '{print $1}');
    num_str=$(echo $l | awk '{print $2}');
    gtts-cli.py -l 'fr' -o $w "$num_val" &>/dev/null;
    mpg123 tmp.mp3 &>/dev/null
    #rm -rf tmp.mp3
    echo $num_val
    echo $l >> $f
    read
    echo $num_str
    echo
    read
    echo '---'
done

exit 0

