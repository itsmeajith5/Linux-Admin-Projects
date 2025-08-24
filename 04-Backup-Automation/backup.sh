#!/bin/bash

if [ $# -ne 2 ];
then
	echo " please enter source dir and dest dir"
fi
if
! command -v rsync >> /dev/null 2>&1;
then
	echo "rsync is not installed"
        exit 1
fi

cur_date=$(date +%Y-%m-%d)
rsync_opt=" -avb --backup-dir $2/$cur_date --delete"

$(which rsync) $rsync_opt "$1" "$2/current" >> backup_$cur_date.log
