# now-log
Write entries to a log to keep track of your projects, notes, and activities

# Installation
First, clone this repository.
```bash
git clone https://github.com/stevekm/now-log.git
```

Next, run the setup script.
```bash
$ cd now-log
$ ./setup.sh
```
Exit the terminal and start a new session for the changes to take effect.

# Usage
## General Logging
Once the `now-logger.sh` has been sourced by your `.bashrc`, the `now` function will be available in the terminal. You can use it at any time to save a message to a central log file. Default log file location is `$HOME/now-logs/.now_log.tsv`. 

```bash
$ now I am going to do some work
Logged in /Users/steve/now-logs/.now_log.tsv

$ now need to build a webserver
Logged in /Users/steve/now-logs/.now_log.tsv

$ cat /Users/steve/now-logs/.now_log.tsv
2017-01-06 13:14:05	I am going to do some work	/Users/steve
2017-01-06 13:16:11	need to build a webserver	/Users/steve

```

Note that the log file `.now_log.tsv` will be hidden by default from file explorers; this is intentional to prevent accidentally moved or deleted by the user. 

Also note that the default location of `$HOME/now-logs/.now_log.tsv` is not the same as the directory of this repository.

## Project Specific Logging
You can specify a 'projects' directory for the logging script. This represents a parent directory where you keep all of your work projects. When you us the `now` function from within this directory, or a subdirectory of it, your message will be added to a project-specific log file additionally, where the project is represented by the subdirectory name. 

```bash
$ mkdir projects
$ cd projects/

$ now start working on some projects
Logged in /Users/steve/now-logs/.now_log.tsv
Logged in /Users/steve/projects//.project_log.tsv

$ mkdir first_project
$ cd first_project/
$ now start setting up the first project
Logged in /Users/steve/now-logs/.now_log.tsv
Logged in /Users/steve/projects/first_project/.project_log.tsv

$ cd ../
$ mkdir second_project
$ cd second_project/
$ now setting up second project cause the boss said so
Logged in /Users/steve/now-logs/.now_log.tsv
Logged in /Users/steve/projects/second_project/.project_log.tsv
```
```bash

```

The default project parent directory is `$HOME/projects`. You can change this by editting the following line in the `now-logger.sh` script

```bash
    # set the project dir location
    local project_dir="$HOME/projects"
```

