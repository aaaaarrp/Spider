#!/bin/bash


#1_Users_and_Groups

sudo groupadd meteorology
sudo groupadd maintenance
sudo useradd -s /bin/bash commander
sudo usermod -a -G meteorology,maintenance commander
sudo useradd -G meteorology -s /bin/bash meteorology_head
sudo useradd -G maintenance -s /bin/bash maintenance_manager

for user in {1..10}
do
    sudo useradd -G meteorology -s /bin/bash Meteorologist_$user
done

for user in {1..5}
do
    sudo useradd -G maintenance -s /bin/bash Maintainer_$user
done

#2_Permissions

chmod u-x,g-rx,o-rx /home/commander  #commander_permission

chmod u-x,g-rx,o-rx /home/meteorology_head       #meteorology_head_permission
setfacl -m u:commander:rw- /home/meteorology_head

getfacl --access /home/meteorology_head | setfacl -d -M- /home/maintenance_manager   #ccopying_same_permission_for_maintenance_manager

for user in {1..10}    #meteorologists_permission
do
chmod u-x,g-rx,o-rx /home/Meteorologist_$user
setfacl -m u:meteorology_head:rw- /home/Meteorologist_$user
setfacl -m u:commander:rw- /home/Meteorologist_$user
done

for user in {1..5}    #maintainers_permission
do
chmod u-x,g-rx,o-rx /home/Maintainer_$user
setfacl -m u:maintenance_manager:rw- /home/Maintainer_$user
setfacl -m u:commander:rw- /home/Maintainer_$user
done

#3_Directories_inside_the_home_directory

for user in {1..10}
do
    sudo -u Meteorologist_$user mkdir /home/Meteorologist_$user/data
done

for user in {1..5}
do
    sudo -u Maintainer_$user mkdir /home/Maintainer_$user/complaints_data
    sudo -u Maintainer_$user mkdir /home/Maintainer_$user/status
done

sudo -u meteorology_head mkdir /home/meteorology_head/stats
sudo -u maintenance_manager mkdir /home/maintenance_manager/stats
sudo -u commander mkdir /home/commander/weather

#4_Login_facilities

sudo passwd commander
echo commander_xyz | passwd commander --stdin

for user in Meteorologist_{1..10}
do
    sudo useradd $user
    sudo passwd $user
    echo $user"_xyz" | passwd  $user --stdin
done

for user in Maintainer_{1..5}
do
    sudo useradd $user
    sudo passwd $user
    echo $user"_xyz" | passwd  $user --stdin
done