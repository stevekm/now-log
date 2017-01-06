#!/bin/bash

## USAGE: filter_data.sh file.tsv "<filter_string>"
## EXAMPLE: filter_data.sh .now_log.tsv "2017-01"
## DESCRIPTION: This script will filter the log file for the supplied string at the beginning of each line


# ~~~~ PARSE ARGS ~~~~ #
if (( "$#" != "2" )); then
            echo "ERROR: Wrong number of arguments supplied"
            grep '^##' $0
            exit
fi

now_log_file="$1"
date_string="$2"
output_file="${date_string}_billing_log.tsv"

echo -e "Input file is $now_log_file"
echo -e "Filter is $date_string"
echo -e "Output file is $output_file"

now_log_dir="$(dirname $0)"
file_backup_script="${now_log_dir}/file_backup.sh"


# ~~~~ FILTER LOG ~~~~ #
# move the file to a timestamped backup if it already exists
if [ -f "$output_file" ] ; then
    echo -e "Output file already exists, making backup"
    "$file_backup_script" "$output_file" old
fi

# save the filtered entries
if [ ! -f "$output_file" ] ; then
    echo -e "Saving filtered results"
    grep -E "^$date_string" "$now_log_file" > "$output_file"
fi
