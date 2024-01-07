#!/bin/bash

# All Colors
PINK='\033[48;2;255;105;180m'
PINK1='\033[38;5;205m'

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

echo "Script Name:  Juicy Data Extractor"

echo "Author: BudSec"

# Check if a file path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File does not exist."
    exit 1
fi

echo -e "${PINK1}----------------------------------------------------------------------------------------------------------${NC}"
echo "FOUND API KEYS:"

# This regex matches apiKey: "anything_here" and captures "anything_here"
api1=$(grep -Eo -i 'apiKey: "[^"]+"' "$file")

# Print the extracted API keys
if [ -n "$api1" ]; then
    echo "$api1"
else
    echo "No API keys found in the file."
fi

grep -i 'api-key' "$file"

api1=$(grep -o -E '"accessKeyID"\s*[:'"'"']\s*"[^"'"'"']*["'"'"']' "$file")

echo "$api1"

aws1=$(grep -i "secretAccessKey" "$file")

echo "$aws1"


aws2=$(grep -o -P '"accessKeyID":\s*'\''\S+'\''\s*' "$file")
echo "$aws2"

# Searching for "AWS_KEY"
grep -o -P -i "AWS_KEY.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "KEY"
grep -o -P -i "KEY.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "AWS-KEY"
grep -o -P -i "AWS-KEY.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

echo -e "

${PINK1}----------------------------------------------------------------------------------------------------------${NC}"
echo "FOUND username:
"

# Searching for "username"
grep -o -P -i "username.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

echo -e "

${PINK1}----------------------------------------------------------------------------------------------------------${NC}"
echo "FOUND SSN:
"
# Searching for "SSN"
grep -o -P -i "SSN.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500




# Searching for "DOB"
grep -o -P -i "DOB.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "password"
grep -o -P -i "password.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "uname"
grep -o -P -i "uname.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "encryption-key"
grep -o -P -i "encryption-key.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "encryptionkey"
grep -o -P -i "encryptionkey.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "secretkey"
grep -o -P -i "secretkey.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "secret_key"
grep -o -P -i "secret_key.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "secret-key"
grep -o -P -i "secret-key.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "aeskey"
grep -o -P -i "aeskey.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "passphrase"
grep -o -P -i "passphrase.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "wombat"
grep -o -P -i "wombat.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "SECRET"
grep -o -P -i "SECRET.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "SECRET-KEY"
grep -o -P -i "SECRET-KEY.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "SECRETKEY"
grep -o -P -i "SECRETKEY.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "tokenURL"
grep -o -P -i "tokenURL.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "ASP.NET_SessionId"
grep -o -P -i "ASP.NET_SessionId.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "ASPSESSIONID"
grep -o -P -i "ASPSESSIONID.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "SITESERVER"
grep -o -P -i "SITESERVER.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "cfid"
grep -o -P -i "cfid.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "cftoken"
grep -o -P -i "cftoken.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "jsessionid"
grep -o -P -i "jsessionid.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "sessid"
grep -o -P -i "sessid.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "sid"
grep -o -P -i "sid.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "viewstate"
grep -o -P -i "viewstate.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "zenid"
grep -o -P -i "zenid.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500

# Searching for "PHPSESSID"
grep -o -P -i "PHPSESSID.*" "$file" | awk '{print substr($0, index($0, $3))}' | cut -c 1-500





# ----------------------  Searching for email address
echo -e "${PINK1}----------------------------------------------------------------------------------------------------------${NC}
FOUND EMAIL ADDRESSES :"

grep -oE '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b' "$file"


























