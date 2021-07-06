#!/bin/bash

echo
echo "Enter meteorologist's name:"
read name
echo

if [ "$name" == meteorologist_1 -o "$name" == meteorologist_2 -o "$name" == meteorologist_3 -o "$name" == meteorologist_4 -o "$name" == meteorologist_5 -o "$name" == meteorologist_6 -o "$name" == meteorologist_7 -o "$name" == meteorologist_8 -o "$name" == meteorologist_9 -o "$name" == meteorologist_10 ]
then
    echo
    echo "Enter complaint ID:"
    read complaint_id
else
    echo "Name doesn't exist! Try again."
    read name  
    until [ "$name" == meteorologist_1 -o "$name" == meteorologist_2 -o "$name" == meteorologist_3 -o "$name" == meteorologist_4 -o "$name" == meteorologist_5 -o "$name" == meteorologist_6 -o "$name" == meteorologist_7 -o "$name" == meteorologist_8 -o "$name" == meteorologist_9 -o "$name" == meteorologist_10 ]
        do
            echo "Name doesn't exist! Try again."
            read name
        done
    echo
    echo "Enter complaint ID:"
    read complaint_id
fi
echo
echo "Status ?"
echo
echo '(Reply with either "Pending" or "Completed")'
echo
read status

if [ "$status" == Pending -o "$status" == Completed -o "$status" == pending -o "$status" == completed ]
then
    echo
else
    echo "Invalid"
    echo
    read status
    until [ "$status" == Pending -o "$status" == Completed -o "$status" == pending -o "$status" == completed ]
        do
            echo "Invalid"
            echo
            read status
        done
    echo
fi
echo "Successfully logged."
echo

if [ "$name" == meteorologist_1 ]
then
    echo $name $complaint_id $status >> /home/maintainer_1/status/meteorologist_1_status.txt
elif [ "$name" == meteorologist_2 ]
 then
    echo $name $complaint_id $status >> /home/maintainer_1/status/meteorologist_2_status.txt
elif [ "$name" == meteorologist_3 ]
then
    echo $name $complaint_id $status >> /home/maintainer_2/status/meteorologist_3_status.txt
elif [ "$name" == meteorologist_4 ]
then
    echo $name $complaint_id $status >> /home/maintainer_2/status/meteorologist_4_status.txt
elif [ "$name" == meteorologist_5 ]
then
    echo $name $complaint_id $status >> /home/maintainer_3/status/meteorologist_5_status.txt
elif [ "$name" == meteorologist_6 ]
then
    echo $name $complaint_id $status >> /home/maintainer_3/status/meteorologist_6_status.txt
elif [ "$name" == meteorologist_7 ]
then
    echo $name $complaint_id $status >> /home/maintainer_4/status/meteorologist_7_status.txt
elif [ "$name" == meteorologist_8 ]
then
    echo $name $complaint_id $status >> /home/maintainer_4/status/meteorologist_8_status.txt
elif [ "$name" == meteorologist_9 ]
then
    echo $name $complaint_id $status >> /home/maintainer_5/status/meteorologist_9_status.txt
elif [ "$name" == meteorologist_10 ]
then
    echo $name $complaint_id $status >> /home/maintainer_5/status/meteorologist_10_status.txt
fi

