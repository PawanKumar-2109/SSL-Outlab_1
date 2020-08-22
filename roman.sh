#! /bin/bash

a=("" I II III IV V VI VII VIII IX X)
i=("" X XX XXX)
x=("" L C CL CC)
b=("" L C CL XL XC CXL CXC)
f(){
	let c=($1-1)/50+4
	let d=$1%10
	echo ${b[$c]}${a[$d]}
}
y(){
	let e=$1/50
	let h=$1%10
	let g=($1-e*50)/10
	echo ${b[$e]}${i[$g]}${a[$h]}
}
let p=$1%50
let q=$1/50
if [ $p -eq 0 ]
then
	echo ${x[$q]}
elif [ $p -lt 40 ]
then
	y $1
else
	f $1
fi
