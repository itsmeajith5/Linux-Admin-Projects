#!/bin/bash
# Simple Disk Monitor - All Partitions

threshold=80

df -hP | grep -vE '^Filesystem|tmpfs|overlay' | while read line; do
    usage=$(echo $line | awk '{print $5}' | sed 's/%//')
    partition=$(echo $line | awk '{print $6}')

    if [ $usage -ge $threshold ]; then
        echo "Warning: $partition is ${usage}% full!"
    else
        echo "OK: $partition is ${usage}% used."
    fi
done