#!/bin/bash

THRESHOLD=80

echo "Checking disk usage..."

for usage in $(df -h --output=pcent,target | tail -n +2); do
    percent=$(echo $usage | cut -d% -f1)
    mount=$(echo $usage | awk '{print $2}')
    
    if [ "$percent" -ge "$THRESHOLD" ]; then
        echo "⚠️  $mount is ${percent}% full!"
    else
        echo "✅ $mount is OK (${percent}%)"
    fi
done