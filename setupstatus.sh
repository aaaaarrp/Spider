#!/bin/bash

for i in {1..5} #maintainer - i
do
    for j in $((i*2 - 1)) $((i*2))  #meteorologist - j
    do
        touch /home/Maintainer_$i/status/meteorologist_$j_status.txt
        chmod g-r,o-r /home/Maintainer_$i/status/meteorologist_$j_status.txt
        setfacl -m u:meteorologist_$j:r-- /home/Maintainer_$i/status/meteorologist_$j_status.txt
    done
done




