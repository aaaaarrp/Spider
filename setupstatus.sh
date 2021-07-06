#!/bin/bash


x="_status"

for i in {1..5} #maintainer - i
do
    for j in $((i*2 - 1)) $((i*2))  #meteorologist - j
    do
        touch /home/maintainer_$i/status/meteorologist_$j$x.txt
        chown maintainer_$i /home/maintainer_$i/status/meteorologist_$j$x.txt
        chmod g-r,o-r /home/maintainer_$i/status/meteorologist_$j$x.txt
        setfacl -m u:meteorologist_$j:r-- /home/maintainer_$i/status/meteorologist_$j$x.txt
    done
done




