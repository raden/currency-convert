#!/bin/bash -l
# Written by Muhammad Najmi Ahmad Zabidi, 2018

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ -z `which jq` ]; then
	printf "You need to install jq, a JSON parsing tool \n"
	exit
fi

sourcemoney=$(echo $2|tr '[:lower:]' '[:upper:]')
target=$(echo $3|tr '[:lower:]' '[:upper:]')

sumber=$(curl https://exchangeratesapi.io/api/latest?base=$sourcemoney 2>/dev/null\
|jq '.'|grep -i $target |awk -F":\|," {'print $2'} 2>/dev/null)

jumlah=$(echo "$1*$sumber"|bc)

echo -e "Price per unit: ${GREEN}1 $sourcemoney${NC} =  ${YELLOW}$sumber $target${NC}"
echo -n

echo -e "Source monies: ${YELLOW}$sourcemoney $1${NC}"
echo -n

echo -e "Total monies after the conversion: ${YELLOW}$target $jumlah${NC}"
echo -n

