#!/bin/bash
#add fix to exercise6-fix here
target_server=server1
if [ $(hostname) = server1 ]
then
        target_server=server2
fi
files=( "$@" )
len=${#files[@]}
target_path=${files[$(( $len - 1 ))]}
sudo ssh root@$target_server "mkdir $target_path || true"
total_size=0
for (( i=0; i<len-1; i++ ))
do
        source_file=${files[$i]}
        file_size=$(($(sudo wc -c < "$source_file")))
        total_size=$(( total_size + file_size))
        sudo scp $source_file root@$target_server:$target_path
done
echo $total_size

