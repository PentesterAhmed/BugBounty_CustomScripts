#!/bin/bash

# Define colors for formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'  # No Color


# ________________ BANNER CODE _________________
# ANSI escape code for dark bright red
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

# ________________ BANNER CODE _________________



# Display the author's banner
echo -e "${YELLOW}Author: BudSec${NC}"
echo -e "${GREEN}--- Path Extractor Script ---${NC}"

# Check if a file contains file paths
if [ $# -ne 1 ]; then
    echo -e "${RED}Usage: $0 <file_path>${NC}"
    exit 1
fi

file="$1"

if [ -f "$file" ]; then
    # Use grep to find and print file paths without URLs
    found_paths=$(grep -oE '\/[[:alnum:]_/.-]+' "$file" | grep -vE 'https?://[[:alnum:]/.-]+')

    if [ -n "$found_paths" ]; then
        echo -e "${GREEN}File paths found in the file (excluding URLs):${NC}"
        echo "$found_paths"
    else
        echo -e "${RED}No file paths found in the file (excluding URLs).${NC}"
    fi
else
    echo -e "${RED}File does not exist.${NC}"
fi
