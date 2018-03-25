#!/bin/bash
# Written by Muhammad Najmi Ahmad Zabidi
PROGNAME=`basename $0`
re='^[0-9]+([.][0-9]+)?$'

usage() {
	printf "\nUsage:\n"
	printf " $PROGNAME <number with or without decimal> <source currency> <intended currency> \n" 
}

tukorduit(){

currency=$(lynx -dump https://www.google.com/search?q=$1$2+$3|grep "Malaysian Ringgit"|head -1|awk {'print $1,$5'})
currency2=$(echo $currency|sed 's/,//g'|awk -F " " {'print $1'})
currency3=$(echo $currency|sed 's/,//g'|awk -F " " {'print $2'})
currency4=$(echo "scale=4;$currency3/$currency2"|bc)

if ! [[ $1 =~ $re ]] ; then
	printf "Please insert a valid number or decimal if needed\n" >&2

elif  [[ -z $1  || -z $2 || -z $3 ]]; then
	usage
	exit 0

elif [[ $1 -ne 1 ]]; then
        echo ""
        echo -e "${YELLOW}------------KADAR TUKARAN PASARAN----------${NC}"
        printf "Nilai utk $currency2 ${2^^} ialah $currency3 ${3^^}\n"
        echo -n
        echo -e "Nilai untuk 1 ${2^^} ialah ${GREEN}${3^^} $currency4\n${NC}"
	exit 0

else
	printf "Not sure what to do"

fi

}

tukorduit $1 $2 $3
