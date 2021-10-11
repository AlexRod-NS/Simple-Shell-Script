#!/bin/bash

<< 'Comment'
	Input
	3433
	64323
	8
	-1

	Output
	3 + 4 + 3 + 3 = 13
	6 + 4 + 3 + 2 + 3 = 18
	8 = 8
Comment

input(){
	local num=1 
	list_num=()
	while [ $num -gt 0 ];do
		read num
		list_num+=($num);
	done
	list_num=(${list_num[@]/-1})
}
sumDigits(){
	local sumStr=""
	local sumNum=0
	local numb=$1
	let len=$(echo "$numb"| wc -L)
	let it=10**$((len-1))
	while [ $(($it*10)) -gt 1 ];do
		let n=($numb/$it)%10
		let sumNum+=$n
		if [[ $it -ne 1 ]]; then
			sumStr+="$n + "	
		else
			sumStr+="$n = $sumNum"
		fi
		let it=it/10
	done
	echo "$sumStr"
}

input
for i in ${list_num[@]}; do
	sumDigits $i
done


