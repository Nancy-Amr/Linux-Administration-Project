#!/bin/bash
directory="NEWDir"
if [ -d "$directory" ]; then
    echo "The directory already exists..."
    echo "Removing the existing directory..."
    rm -r "$directory"
fi
mkdir "$directory"
cd "$directory"
touch {main,hello}.{c,h}
for file in main.c hello.c main.h hello.h; do
    echo "this file is named $file" > "$file"
done
cd ..
tar -czf NEWDir.tar.gz "$directory"
if [ -d "/home/edges" ]; then
    cp NEWDir.tar.gz /home/edges/ && cd /home/edges/ && tar -xzf NEWDir.tar.gz
else
    echo "Home directory /home/edges not found"
    exit 1
fi