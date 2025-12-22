# Resources

## Configuration

This is the configuration file used to create a datacube in Examind for this time data aggregation:

- [config.json](scripts_config/config.json) : An Example configuration file in JSON format. This file defines the structure and parameters for creating a temporal datacube in Examind.

## Script to generate COG (Cloud Optimized GeoTIFF) from original GeoTIFF files

- [generate_cog.sh](scripts_config/generate_cog.sh) : A shell script that converts original GeoTIFF files into Cloud Optimized GeoTIFF (COG) format using `gdal_translate`. 
- This is important for optimizing data storage and access in cloud environments.

## Script and Example to generate config.json file

- [generate_file_lists.sh](scripts_config/generate_file_lists.sh) : A shell script that generates text files listing the paths of the time series data files. These text files are used as input for the `generate_config.sh` script.
- [generate_config.sh](scripts_config/generate_config.sh) : A shell script that generates the `config.json` file. You can run this script in a Unix-like environment with bash.
- [file_list.txt](scripts_config/file_list.txt) : An example text file containing a list of file paths to be included in the datacube (input for the `generate_config.sh` script).

:::{note}
Generate your own `file_list.txt` with the paths to your time series data files before running the `generate_config.sh` script.
You will maybe need to modify the script to fit your specific file structure and naming conventions.
In this example we assume that the files are named with a date format `NDVI_AYYYYDDD_MOD13Q1.006.tif`.
:::