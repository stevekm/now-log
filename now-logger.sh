#!/bin/bash

## USAGE: now <your message here>

## DESCRIPTION: This script will add a message to a log file, with timestamp and pwd
## if you are in the 'project_dir' or a subdirectory of it, the message will logged there too

## NOTE: source this from your bashrc to add the `now`
## NOTE: Use the provided 'test.sh' script for testing this function
## NOTE: shell interpretted characters might not work. Don't use ', ", ;, etc.
## avoid using characters listed on this page: http://tldp.org/LDP/abs/html/special-chars.html




now() {
    # ~~~~ BASIC LOGGING ~~~~ #
    # set the default log file location
    local log_dir="$HOME/now-logs"
    local log_file="${log_dir}/.now.tsv"

    # set the date
    local my_date=$(date "+%Y-%m-%d %H:%M:%S")

    # the arguments passed to the script
    local my_message="$@"

    local host_name="${HOSTNAME:-none}"
    local user_name="${USER:-none}"

    # create log entry
    local log_entry="${my_date}\t${my_message}\t$PWD\t${host_name}\t${user_name}"

    # # write the entry to the now log file
    printf "${log_entry}\n" >> "$log_file" && echo "Logged in $log_file" || echo "Error: could not add entry to log file: $log_file"
}


# # ~~~~ PROJECT LOGGING ~~~~ #
# # if the current working directory is a project directory
# # then add message to a project-specific log as well
#
# # set the project dir location
# local project_dir="$HOME/projects"
#
# # check if the user is in a project dir or subdir
# case "$PWD" in
#     *"$project_dir"*)
#     # set up the logfile path
#     # project_root_dir; strip anything after the path
#     # # this will allow for items in front of the path
#     local project_root_dir="${PWD%$project_dir*}$project_dir"
#
#     # dir path of the pwd within the project dir; strip anything before the path
#     local project_dir_pwd="${PWD#*$project_dir/}"
#
#     # basename of the current proj dir; strip everything after the dirname
#     local project_dir_basename="${project_dir_pwd%%/*}"
#
#     # path for the log file; within the base proj dir
#     local project_dir_log_path="$project_root_dir/$project_dir_basename"
#
#     # the actual log file
#     local project_log_file="$project_dir_log_path/.now.projectlog.tsv"
#
#     # make sure the directory exists
#     if [ ! -d "$project_dir_log_path" ]; then
#       echo "Warning: Project log dir does not exist;"
#       echo "$project_dir_log_path"
#       echo "check the now log script"
#       exit
#     fi
#
#     # write the project log entry
#     printf "${log_entry}\n" >> $project_log_file && echo -e "Logged in $project_log_file"
#
#     ;;
# esac
