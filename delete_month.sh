#! /bin/bash

##################################################################################
# This script truncate the source log directory: remove file and recreate
##################################################################################
deletecreate()
{
    for file in $1/*
    do
	if [ -d "$file" ];then	
	    deletecreate $file $2
	else
            my_base_file=`basename $file`
	    patt=`echo $my_base_file |grep "$2"`
	    if [ -n "$patt" ];then
	       rm -f $file
	       touch $file
	    fi
        fi
    done
}
dolastweek(){
    mydate7=$(date -d "7 day ago" +%Y%m%d)
    mydate8=$(date -d "8 day ago" +%Y%m%d)
    mydate9=$(date -d "9 day ago" +%Y%m%d)
    mydate10=$(date -d "10 day ago" +%Y%m%d)
    mydate11=$(date -d "11 day ago" +%Y%m%d)
    mydate12=$(date -d "12 day ago" +%Y%m%d)
    mydate13=$(date -d "13 day ago" +%Y%m%d)
    echo $mydate7
    echo $mydate8
    echo $mydate9
    echo $mydate10
    echo $mydate11
    echo $mydate12
    echo $mydate13
    deletecreate $1  $mydate7
    deletecreate $1  $mydate8
    deletecreate $1  $mydate9
    deletecreate $1  $mydate10
    deletecreate $1  $mydate11
    deletecreate $1  $mydate12
    deletecreate $1  $mydate13
}

if [ -z "$1" ] ; then
    time=$(date -d "7 day ago" +%Y%m%d)
else
    time=$1
fi

deletecreate /data/v-applogs $time
deletecreate /data/w-applogs $time
