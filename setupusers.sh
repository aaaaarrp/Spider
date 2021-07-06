#!/bin/bash


#Users_and_Groups

groupadd meteorology
groupadd maintenance
useradd  -m -d /home/commander -s /bin/bash commander
usermod -a -G meteorology,maintenance commander
useradd -G meteorology -m -d /home/meteorology_head -s /bin/bash meteorology_head
useradd -G maintenance -m -d /home/maintenance_manager -s /bin/bash maintenance_manager

for user in {1..10}
do
useradd -G meteorology -m -d /home/meteorologist_$user -s /bin/bash meteorologist_$user
done

for user in {1..5}
do
useradd -G maintenance -m -d /home/maintainer_$user -s /bin/bash maintainer_$user
done

#Permissions

chmod g-rx,o-rx /home/commander  #commander_permission

chmod g-rx,o-rx /home/meteorology_head       #meteorology_head_permission
setfacl -m u:commander:rwx /home/meteorology_head

chmod g-rx,o-rx /home/maintenance_manager    #maintenace_manager_permission
setfacl -m u:commander:rwx /home/maintenance_manager  

for user in {1..10}    #meteorologists_permission
do
chmod g-rx,o-rx /home/meteorologist_$user
setfacl -m u:meteorology_head:rwx /home/meteorologist_$user
setfacl -m u:commander:rwx /home/meteorologist_$user
done

for user in {1..5}    #maintainers_permission
do
chmod g-rx,o-rx /home/maintainer_$user
setfacl -m u:maintenance_manager:rwx /home/maintainer_$user
setfacl -m u:commander:rwx /home/maintainer_$user
done

#Directories_inside_the_home_directory

for user in {1..10}
do
    sudo -u meteorologist_$user mkdir /home/meteorologist_$user/data
done

for user in {1..5}
do
    sudo -u maintainer_$user mkdir /home/maintainer_$user/complaints_data
    sudo -u maintainer_$user mkdir /home/maintainer_$user/status
done

sudo -u meteorology_head mkdir /home/meteorology_head/stats
sudo -u maintenance_manager mkdir /home/maintenance_manager/stats
sudo -u commander mkdir /home/commander/weather


#Login_facilities

echo "commander:123commander" | chpasswd
echo "meteorology_head:123meteorology_head" | chpasswd
echo "maintenance_manager:123maintenance_manager" | chpasswd

for user in {1..10}
do
echo "meteorologist_$user:123meteorologist_$user" | chpasswd
done

for user in {1..5}
do
echo "maintainer_$user:123maintainer_$user" | chpasswd
done










