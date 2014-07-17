#/bin/bash
#mk-log_dir.sh

src=`find /mnt/nfs/applogs`
dst=/mnt/nfs/gzip-applogs

for i in $src
do
	if [ -d "$i" ];
	then
#		echo $i
		d_dir=${i//applogs/gzip-applogs}
#		echo $d_dir
		mkdir -p $d_dir
	fi
done


#	${string//substring/replacement}
