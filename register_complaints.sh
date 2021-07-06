#!/bin/bash

echo
echo "Register your complaint here."
echo "Write your username:" 
read name

if [ "$name" == meteorologist_1 -o "$name" == meteorologist_2 -o "$name" == meteorologist_3 -o "$name" == meteorologist_4 -o "$name" == meteorologist_5 -o "$name" == meteorologist_6 -o "$name" == meteorologist_7 -o "$name" == meteorologist_8 -o "$name" == meteorologist_9 -o "$name" == meteorologist_10 ]
then
    echo
    echo "Choose your complaint type..."
else
    echo "Username doesn't exist! Try again."
    read name  
    until [ "$name" == meteorologist_1 -o "$name" == meteorologist_2 -o "$name" == meteorologist_3 -o "$name" == meteorologist_4 -o "$name" == meteorologist_5 -o "$name" == meteorologist_6 -o "$name" == meteorologist_7 -o "$name" == meteorologist_8 -o "$name" == meteorologist_9 -o "$name" == meteorologist_10 ]
        do
            echo "Username doesn't exist! Try again."
            read name
        done
    echo
    echo "Choose your complaint type..."
fi
echo
echo "Food"
echo "Medical"
echo "Inventory"
echo "Misc"
echo
echo "(Please type the name of your complaint)"
echo
read complaint_type

if [ "$complaint_type" == Food -o "$complaint_type" == food -o "$complaint_type" == Medical -o "$complaint_type" == medical -o "$complaint_type" == Inventory -o "$complaint_type" == inventory -o "$complaint_type" == Misc -o "$complaint_type" == misc ]
then
echo
    echo "Describe your complaint-"
else
    echo "Choose a valid option!!"
    read complaint_type
    until [ "$complaint_type" == Misc -o "$complaint_type" == Food -o "$complaint_type" == Medical -o "$complaint_type" == Inventory -o "$complaint_type" == food -o "$complaint_type" == medical -o "$complaint_type" == inventory -o "$complaint_type" == misc ] 
        do
            echo "Choose a valid option!!"
            read complaint_type
        done
    echo
    echo "Describe your complaint-"
fi
echo
read complaint_description
echo

echo "Severity:"
echo "(Choose in the range of 1 to 5)"
echo
read severity
until [ "$severity" == 1 -o "$severity" == 2 -o "$severity" == 3 -o "$severity" == 4 -o "$severity" == 5 ]
    do
        echo "choose a valid digit"
        read severity
    done
echo
echo "Thank you!"
echo "Your complaint is successfully logged."
echo

date=$(date +%F) 
complaint_id=$(printf '%s\n' "$( uuidgen )")  #To_Print_a_Unique_Complaint_ID_everytime

if [ "$name" == meteorologist_1 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_1/complaints_data/meteorologist_1_complaints.txt
elif [ "$name" == meteorologist_2 ]
 then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_1/complaints_data/meteorologist_2_complaints.txt
elif [ "$name" == meteorologist_3 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_2/complaints_data/meteorologist_3_complaints.txt
elif [ "$name" == meteorologist_4 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_2/complaints_data/meteorologist_4_complaints.txt
elif [ "$name" == meteorologist_5 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_3/complaints_data/meteorologist_5_complaints.txt
elif [ "$name" == meteorologist_6 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_3/complaints_data/meteorologist_6_complaints.txt
elif [ "$name" == meteorologist_7 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_4/complaints_data/meteorologist_7_complaints.txt
elif [ "$name" == meteorologist_8 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_4/complaints_data/meteorologist_8_complaints.txt
elif [ "$name" == meteorologist_9 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_5/complaints_data/meteorologist_9_complaints.txt
elif [ "$name" == meteorologist_10 ]
then
    echo $date $complaint_id $name $complaint_type $complaint_description $severity >> /home/maintainer_5/complaints_data/meteorologist_10_complaints.txt
fi

