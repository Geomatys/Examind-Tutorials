#!/bin/bash

# Default values
input_dir="$PWD"
output_file="file_list.txt"

# Parse options
while getopts "i:o:" opt; do
  case $opt in
    i) input_dir="$OPTARG" ;;
    o) output_file="$OPTARG" ;;
    *) echo "Usage: $0 [-i input_folder] [-o output_file]" >&2
       exit 1 ;;
  esac
done

# Check if the input directory exists
if [ ! -d "$input_dir" ]; then
  echo "Error: Directory '$input_dir' does not exist."
  exit 1
fi

# Generate the sorted list
# 1. find: locates files
# 2. sort -f: sorts alphabetically (case-insensitive)
# 3. >: writes to the file
find "$input_dir" -maxdepth 1 -type f -printf "%f\n" | sort -f > "$output_file"

echo "Success: Alphabetical list of files saved to '$output_file'"