#!/bin/bash
#Author: 
#Date: 
#Purpose: tar the applogs to *tar.gz format

date1=`date +%F' '%H:%M:%S`
echo $date apptar.sh start >> /data/om/rsync.log


name=`find /data/applogs/txt-app/ -type f -name "*log*" ! -name "*.gz" ! -name "*.gz" -mtime -3 -exec ls -A {} \;`
for s_file in $name
do
#	${string//substring/replacement}
	filename=`basename $s_file`
	s_dir=`dirname $s_file`
	d_dir=${s_dir//txt/gzip}
	cd $s_dir
	tar -zcvf $d_dir/$filename.tar.gz $filename
done


date=`date +%F' '%H:%M:%S`
echo apptar.sh work: at $date1 start, $date end >> /data/om/rsync.log
echo "" >> /data/om/rsync.log
