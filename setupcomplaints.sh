#! /bin/bash




x="_complaints"

for i in {1..5}   #maintainer - i
do
    for j in $((i*2 - 1)) $((i*2))   #meteorologists - j
    do
        touch /home/maintainer_$i/complaints_data/meteorologist_$j$x.txt
        chown maintainer_$i /home/maintainer_$i/complaints_data/meteorologist_$j$x.txt
        chmod u-w,g-r,o-r /home/maintainer_$i/complaints_data/meteorologist_$j$x.txt
        setfacl -m u:meteorologist_$j:rw- /home/maintainer_$i/complaints_data/meteorologist_$j$x.txt
    done
done
