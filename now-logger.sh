#!/bin/bash


## USAGE: now <your message here>
## DESCRIPTION: This script will add a message to a log file, with timestamp and pwd 
## source this from your bashrc to add the `now` command

# (BASIC USAGE) this script sets up a custom function that creates a log file in your Home directory
# for storing quick notes about what you are doing at the time
# log file here: $HOME/.now.tsv

# (ADVANCED USAGE) this script will automatically detect if your pwd is 
# in your 'projects' dir (i.e. you are working on a project)
# and also add the note to a separate log file for the project you are working in 
# logfile here: $project_dir_log_path/.now.projectlog.tsv

# log files are in .tsv format, with timestamped and pwd-stamped entries

# # FUTURE DEVELOPMENTS FOR THIS SCRIPT
# # issue: shell interpretted special characters break the script a bit; solution: Don't use ', ", ;, etc. ....
# # # don't use anything listed on this page in your note: http://tldp.org/LDP/abs/html/special-chars.html
# # allow for user-set list of project dirs
# # make script/function exit if the logdir path is invalid - DONE


now() {
    # ~~~~ BASIC LOGGING ~~~~ #
    # set the date
    local my_date=$(date "+%Y-%m-%d %H:%M:%S")

    # the arguments passed to the script
    local my_message="$@"

    # # write the entry to the now log file
    echo -e "$my_date\t$my_message\t$PWD" >> $HOME/now.log/.now.tsv
    echo -e "Logged in $HOME/now.log/.now.tsv"

    # ~~~~ PROJECT LOGGING ~~~~ #
    # if the current working directory is a project directory
    # then add message to a project-specific log as well

    # set the project dir location
    local project_dir="$HOME/projects"


    # check if project_dir is a part of pwd file path
    case "$PWD" in
        *"$project_dir"*)
        # set up the logfile path
        # project_root_dir; strip anything after the path
        # # this will allow for items in front of the path
        local project_root_dir="${PWD%$project_dir*}$project_dir"

        # dir path of the pwd within the project dir; strip anything before the path
        local project_dir_pwd="${PWD#*$project_dir/}"

        # basename of the current proj dir; strip everything after the dirname
        local project_dir_basename="${project_dir_pwd%%/*}"

        # path for the log file; within the base proj dir
        local project_dir_log_path="$project_root_dir/$project_dir_basename"

        # the actual log file 
        local log_file="$project_dir_log_path/.now.projectlog.tsv"

        # make sure the directory exists
        if [ ! -d "$project_dir_log_path" ]; then
          echo "Warning: Project log dir does not exist;"
          echo "$project_dir_log_path"
          echo "check the now log script"
          exit 
        fi

        # write the project log entry
        echo -e "$my_date\t$my_message\t$PWD" >> $log_file
        echo -e "Logged in $log_file"

        ;;
    esac

    # if [[ "$PWD" == *"$project_dir"* ]]; then
    # fi
}
