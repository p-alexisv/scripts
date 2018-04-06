#!/bin/bash

comp=$1	# component name provided in ARGV[0]
ltotal=0

for i in `ls`
do 
	gdir=$i/$comp
	newlog=$gdir/$comp.stdout.log
	oldlog=$newlog.7.gz
	newestlogt=`head -1 $newlog | awk -F, '{print $1}' | awk -F: '{print $2}' | sed -e 's/"//g' | ~/scripts/epoch2dtime.py`
	oldestlogt=`gzcat $oldlog | tail -1 | awk -F, '{print $1}' | awk -F: '{print $2}' | sed -e 's/"//g' | ~/scripts/epoch2dtime.py`
	log0=`cat $newlog|wc -l`
	log1=`gzcat $newlog.1.gz | wc -l`
	log2=`gzcat $newlog.2.gz | wc -l`
	log3=`gzcat $newlog.3.gz | wc -l`
	log4=`gzcat $newlog.4.gz | wc -l`
	log5=`gzcat $newlog.5.gz | wc -l`
	log6=`gzcat $newlog.6.gz|wc -l`
	log7=`gzcat $newlog.7.gz | wc -l`
	itot=`echo $log0+$log1+$log2+$log3+$log4+$log5+$log6+$log7|bc`
	echo "instance : $i"
	echo "	oldest log datetime 	: $oldestlogt"
	echo "	newest log datetime 	: $newestlogt"
	echo "	log count		: $itot"
	ltotal=`echo $ltotal+$itot|bc`
done
echo
echo "Total logs : $ltotal"
