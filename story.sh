#! /bin/bash

get_next(){
	for x in $(ls $1)
	do
		if [ "$(cut -d$'\n' -f2 ./$1/$x)" = "$2" ]
		then
			echo $(cut -d$'\n' -f3 ./$1/$x)
		fi
	done
}

get_file(){
	for x in $(ls $1)
	do
		if [ "$(cut -d$'\n' -f3 ./$1/$x)" = "$2" ]
		then
			echo $(cut -d$'\n' -f1 ./$1/$x)
		fi
	done
}

next=$(get_next $1 $2)
while [ 1 -eq 1 ]
do
	if [ "$next" = "" ]
	then
		break
	else
		echo $(get_file $1 $next) >> $3
		next=$(get_next $1 $next)
	fi
done
