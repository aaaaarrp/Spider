#!/bin/bash

for i in {1..5}   #maintainer - i
do 
    for j in $((i*2 - 1)) $((i*2))   #meteorologists - j
    do
        touch /home/Maintainer_$i/complaints_data/meteorologist_$j_complaints.txt
        chmod u-w,g-r,o-r /home/Maintainer_$i/complaints_data/meteorologist_$j_complaints.txt
        setfacl -m u:meteorologist_$j:rw- /home/Maintainer_$i/complaints_data/meteorologist_$j_complaints.txt
    done
done







