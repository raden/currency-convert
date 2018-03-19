#!/bin/bash
# Written by Muhammad Najmi Ahmad Zabidi
PROGNAME=`basename $0`
re='^[0-9]+([.][0-9]+)?$'

usage() {
	printf "\nUsage:\n"
	printf " $PROGNAME <number with or without decimal> <source currency> <intended currency> \n" 
}

tukorduit(){

currency=$(curl "http://finance.google.com/finance/converter?a=$1&from=$2&to=$3" 2>/dev/null |grep class=bld|awk -F"\<\|\>" 2>/dev/null {'print $3, $5'})


if ! [[ $1 =~ $re ]] ; then
	printf "Please insert a valid number or decimal if needed\n" >&2

elif  [[ -z $1  || -z $2 || -z $3 ]]; then
	usage
	exit 0

elif [[ $1 -ne 1 ]]; then
	printf "$currency\n"
	convert=$(echo $currency|awk {'print $4'})
	if [[ $2 == *[a-z]* ]] || [[ $3 == *[a-z]* ]]; then 
		new2=$(echo $2|tr [a-z] [A-Z])
		new3=$(echo $3|tr [a-z] [A-Z])
		printf "Nilai untuk 1 $new2 ialah `echo "scale=4;$convert/$1"|bc` $new3\n"
	else
		printf "Nilai untuk 1 $2 ialah `echo "scale=4;$convert/$1"|bc` $3\n"
	fi

else
	printf "$currency\n"

fi

}

tukorduit $1 $2 $3
