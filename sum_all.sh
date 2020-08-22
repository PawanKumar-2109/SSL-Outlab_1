#! /bin/bash

if [ $# -gt 0 ]
then
	total=0
	for x in $@
	do
		let total=total+$x
	done
	echo $total
	exit 0
else
	echo No numbers given
	exit 1
fi
