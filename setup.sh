#!/bin/bash

## USAGE: setup.sh
## DESCRIPTION: Add now-logger to bashrc

now_logger_filepath="$(readlink -f now-logger.sh)"

echo "source $now_logger_filepath" >> ~/.bashrc
