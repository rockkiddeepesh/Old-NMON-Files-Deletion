#!/bin/sh
###
### Static variables
###
nmon_dir=/var/log/applog/nmon
cd $nmon_dir

find $nmon_dir -xdev -type f -mtime +120 -name "*.nmon*" -exec rm {} \;

find $nmon_dir -xdev -type f -mtime +5 -name "*.nmon" -exec gzip {} \;
now=$(date);
echo "The deletion and compression successful on $now" >> /var/log/backuplog/applog_del_log.log
