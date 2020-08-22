#! /bin/bash
 
wget -r -q -np -nH --cut-dirs=$3 -R "index.html*" $2
mkdir ./$(basename $2)/my_outputs
a=$(find ./$(basename $2)/inputs/ -name '*.in')
g++ $1
echo "Failed testcases are" >> feedback.txt
count=0
cp "$1" "./"
for x in $a
do
	./a.out < $x > ./$(basename $2)/my_outputs/$(basename $x .in).out
	z=$(diff ./$(basename $2)/my_outputs/$(basename $x .in).out ./$(basename $2)/outputs/$(basename $x .in).out | wc -l)
	if [ $z -gt 0 ]
	then
		let count=count+1
		echo $(basename $x .in) >> feedback.txt
	fi
done
if [ $count -gt 0 ]
then
	echo Some testcases failed.
else
	echo All testcases passed!
fi
