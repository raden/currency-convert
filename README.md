# tukorduit

 tukorduit.sh

This is supposed to be an executable script.
1) Download it, do `chmod +x tukorduit.sh`
2) Then, execute it with `./tukorduit.sh  <value> <source currency> <intended currency>` 

e.g :/tukorduit.sh 100 usd myr (does not matter upper or lowercase, the script will convert the input for source/target strings into the uppercase anyway)

The other file;
 tukorduit.txt

It exists as a function and it meant to be inserted within your $HOME/.bashrc
1) Put the script inside your $HOME/.bashrc, append it anywhere as you like
2) Then run source $HOME/.bashrc
3) Use the following syntax `tukorduit <value> <source currency> <intended currency>` 

e.g : tukorduit 100 USD MYR


