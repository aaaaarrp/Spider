#!/bin/bash

echo
echo "Enter meteorologist name:"
read name
echo
echo "Enter complaint id:"
read complaint_id
echo
echo "Status ?"
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

