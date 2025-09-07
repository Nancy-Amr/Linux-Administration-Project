#!/bin/bash

user_name="$1"
user_pass="$2"
group_name="$3"


if [[ "$user_name" == "" || "$user_pass" == "" || "$group_name" == "" ]]; then
        echo "Failed to create user. All argyments are required"
        exit 1
fi

if [ "$USER" != "root" ];then
        echo "You have to use sudo command to create a user"
        exit 1
fi

echo "Username: $user_name, Password: $user_pass, Groupname: $group_name"

useradd -m -s /bin/bash -N $user_name
echo "$user_name:$user_pass" | chpasswd

id $user_name

groupadd -g 200 $group_name

usermod -aG $group_name $user_name

id $user_name

usermod -u 1600 $user_name
usermod -g $group_name $user_name

id $user_name