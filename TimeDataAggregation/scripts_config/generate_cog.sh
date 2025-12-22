#!/bin/bash

# Default values: Current Directory
input_dir="$PWD"
output_dir="$PWD"

# Parse options
while getopts "i:o:" opt; do
  case $opt in
    i) input_dir="$OPTARG" ;;
    o) output_dir="$OPTARG" ;;
    *) echo "Usage: $0 [-i input_folder] [-o output_folder]" >&2
       exit 1 ;;
  esac
done

# Ensure the output directory exists
mkdir -p "$output_dir"

# Inform the user of the paths being used
echo "Input directory:  $input_dir"
echo "Output directory: $output_dir"
echo "--------------------------"

for file in "$input_dir"/*.tif
do
  # Check if file exists to avoid errors if no .tif files are found
  if [ -f "$file" ]
  then
    base=$(basename "$file" .tif)
    output_path="$output_dir/$base.cog.tif"

    echo "Converting: $base.tif"

    gdal_translate -of COG \
      -co "BIGTIFF=YES" \
      -co "COMPRESS=DEFLATE" \
      -co "PREDICTOR=2" \
      "$file" "$output_path"
  else
    echo "No .tif files found in $input_dir"
    break
  fi
done

echo "Processing complete."