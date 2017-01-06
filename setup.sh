#!/bin/bash

## USAGE: setup.sh
## DESCRIPTION: Add now-logger to bashrc

now_logger_filepath="${PWD}/now-logger.sh"

if [ -f "$now_logger_filepath" ]; then
    echo "Adding $now_logger_filepath to ~/.bashrc"
    echo "source $now_logger_filepath" >> ~/.bashrc && echo "Entry added successfully"
    echo "You should start a new terminal session now."
else
    echo "ERROR: $now_logger_filepath is not a file. Does it exist?"
fi

