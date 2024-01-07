#!/bin/bash


# PROFESSIONAL BANNER
DARK_BRIGHT_RED='\033[38;5;196m'
NC='\033[0m'  # Reset to default colors



echo "----------------------------------------------------------------------------
"

# ASCII art in dark bright red
echo -e "	${DARK_BRIGHT_RED}888888b.                 888  .d8888b.${NC}                    "
echo -e "	${DARK_BRIGHT_RED}888  \"88b                888 d88P  Y88b${NC}                   "
echo -e "	${DARK_BRIGHT_RED}888  .88P                888 Y88b.     ${NC}                  "
echo -e "	${DARK_BRIGHT_RED}8888888K.  888  888  .d88888  \"Y888b.    .d88b.   .d8888b${NC}  "
echo -e "	${DARK_BRIGHT_RED}888  \"Y88b 888  888 d88\" 888     \"Y88b. d8P  Y8b d88P\"${NC}    "
echo -e "	${DARK_BRIGHT_RED}888    888 888  888 888  888       \"888 88888888 888${NC}      "
echo -e "	${DARK_BRIGHT_RED}888   d88P Y88b 888 Y88b 888 Y88b  d88P Y8b.     Y88b.${NC}    "
echo -e "	${DARK_BRIGHT_RED}8888888P\"   \"Y88888  \"Y88888  \"Y8888P\"   \"Y8888   \"Y8888P${NC}"
echo "
----------------------------------------------------------------------------"


echo "Author: BudSec"

echo "
----------------------------------------------------------------------------"

if [ $# -ne 1 ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

domain="$1"




echo "Running Subfinder..."

subfinder --silent -d $domain  -o subfinder_$domain.txt

exit

echo "
----------------------------------------------------------------------------"

echo "Running knockpy..."

mkdir kp_"$domain"

knockpy "$domain" -o kp_"$domain"

cd kp_"$domain"

cat * | jq 'to_entries[] | .key' | sed 's/["“”]//g'  > ../subs-knocpy.txt

cd ..

echo "
----------------------------------------------------------------------------"

echo "Running Sublist3r..."

sublist3r --domain "$domain" -o sublist3r_$domain.txt

echo "
----------------------------------------------------------------------------"

echo "Running assetfinder..."

assetfinder --subs-only "$domain" > assetfinder_$domain.txt

echo "
----------------------------------------------------------------------------"

echo "Running Custom Wordlists"

python /media/kali/Ex-Disk/TOOLS/Dome/dome.py -d "$domain" -w /media/kali/Ex-Disk/Wordlists/SecLists/Discovery/DNS/bitquark-subdomains-top100000.txt -m passive
