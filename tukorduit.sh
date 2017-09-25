#!/bin/bash

#PROGNAME=`basename $0`
#re='^[0-9]+([.][0-9]+)?$'

#usage() {
#	printf "\nUsage:\n"
#	printf " $PROGNAME <number with or without decimal> <intended currency> <source currency>\n" 
#}

tukorduit(){

currency=$(curl "http://finance.google.com/finance/converter?a=$1&from=$2&to=$3" 2>/dev/null |grep class=bld|awk -F"\<\|\>" 2>/dev/null {'print $3, $5'})


#if ! [[ $1 =~ $re ]] ; then
#	printf "Please insert a valid number or decimal if needed\n" >&2

if [[ $1 -ne 1 ]]; then
#elif [[ $1 -ne 1 ]]; then
	printf "$currency\n"
	convert=$(echo $currency|awk {'print $3'})
	printf "$convert\n"
#	printf "Nilai untuk 1 ${2^^} ialah `echo "scale=4;$convert/$1"|bc` ${3^^}\n"

else

	printf "$currency\n"

fi

}

tukorduit
