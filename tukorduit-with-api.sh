#!/bin/bash -l

if [ -z `which jq` ]; then
	printf "You need to install jq, a JSON parsing tool \n"
	exit
fi

sourcemoney=$(echo $2|tr '[:lower:]' '[:upper:]')
target=$(echo $3|tr '[:lower:]' '[:upper:]')

sumber=$(curl https://exchangeratesapi.io/api/latest?base=$sourcemoney 2>/dev/null\
|jq '.'|grep -i $target |awk -F":\|," {'print $2'} 2>/dev/null)

jumlah=$(echo "$1*$sumber"|bc)

printf "Price per unit: $sumber\n"
printf "Source monies: $sourcemoney $1\n"
printf "Total monies after the conversion: $target $jumlah \n"
printf "Thank you! \n"

