#!/bin/env python

import re
import argparse
import os
from colorama import Fore, Style


# PROFESSIONAL BANNER
DARK_BRIGHT_RED = '\033[38;5;196m'
NC = '\033[0m'  # Reset to default colors

banner = f"""
----------------------------------------------------------------------------

	{DARK_BRIGHT_RED}888888b.                 888  .d8888b.{NC}
	{DARK_BRIGHT_RED}888  "88b                888 d88P  Y88b{NC}
	{DARK_BRIGHT_RED}888  .88P                888 Y88b.     {NC}
	{DARK_BRIGHT_RED}8888888K.  888  888  .d88888  "Y888b.    .d88b.   .d8888b{NC}
	{DARK_BRIGHT_RED}888  "Y88b 888  888 d88" 888     "Y88b. d8P  Y8b d88P"{NC}
	{DARK_BRIGHT_RED}888    888 888  888 888  888       "888 88888888 888{NC}
	{DARK_BRIGHT_RED}888   d88P Y88b 888 Y88b 888 Y88b  d88P Y8b.     Y88b.{NC}
	{DARK_BRIGHT_RED}8888888P"   "Y88888  "Y88888  "Y8888P"   "Y8888   "Y8888P{NC}

----------------------------------------------------------------------------
"""

# Print the banner
print(banner)

print("Author: BudSec")



def extract_urls(input_file):
    # Updated regular expression with non-capturing groups
    pattern = r'\bhttps?:\/\/(?:[a-zA-Z0-9-]+\.)*[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(?::\d+)?(?:\/|\\{1,3})[a-zA-Z0-9-_.\/\\]*\b'

    try:
        with open(input_file, 'r') as file:
            for line in file:
                matches = re.findall(pattern, line)
                for match in matches:
                    print(f"{Fore.GREEN}Found URL: {Style.RESET_ALL}{match}")
    except FileNotFoundError:
        print(f"{Fore.RED}Error: File not found - {input_file}{Style.RESET_ALL}")
    except IOError as e:
        print(f"{Fore.RED}I/O error({e.errno}): {e.strerror}{Style.RESET_ALL}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="URLs Extractor Script")
    parser.add_argument("-file", required=True, help="Input file path")
    args = parser.parse_args()

    if os.path.exists(args.file):
        extract_urls(args.file)
    else:
        print(f"{Fore.RED}Error: The file '{args.file}' does not exist.{Style.RESET_ALL}")
