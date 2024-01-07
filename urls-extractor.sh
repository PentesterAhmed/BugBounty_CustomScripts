#!/bin/bash

# Define colors for formatting
RED='\033[0;31m'
# Change the green color to a different color (e.g., light blue)
NEW_COLOR='\033[0;36m'
YELLOW='\033[0;33m'
PINK='\033[1;35m'
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


echo "	NOTE: The Script Extracts all the urls from the given file
"

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

# Use grep to extract URLs from the file
# This regular expression matches URLs more accurately
urls=$(grep -Eo 'https?://[A-Za-z0-9.-_]*\.[A-Za-z]{2,6}[^"'\''<>]*' "$file")

# Print the extracted URLs
if [ -n "$urls" ]; then
    echo "Extracted URLs from the file (filtered):"
    echo "$urls"
else
    echo "No URLs found in the file."
fi



