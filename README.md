# now-log
Write entries to a log to keep track of your projects, notes, and activities

# Installation
First, clone this repository.

```
git clone https://github.com/stevekm/now-log.git
```

Next, add `now-logger.sh` to your `~/.bashrc`.

```
echo "source /path/to/now-log/now-logger.sh" >> "$HOME/.bashrc"
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

You can change the location of the log file by editting these lines in the `now-logger.sh` script

```bash
    local log_dir="$HOME/now-logs"
    local log_file="${log_dir}/.now_log.tsv"
```

# Filtering By Date
The `filter_data.sh` script can be used to filter the log for all entries that match a given date. This is useful when its the end of the month and you need a list of entries for billing.

```bash
$ cat .now_log.tsv
2017-01-06 13:14:05	I am going to do some work	/Users/steve
2017-01-06 13:16:11	need to build a webserver	/Users/steve
2017-01-06 13:30:29	start setting up the first project	/Users/steve/projects/first_project
2017-02-06 13:33:27	setting up second project cause the boss said so	/Users/steve/projects/second_project
2017-02-06 14:12:02	doing more work	/Users/steve/projects/second_project
2017-03-06 14:12:14	doing a thing	/Users/steve/projects/second_project
2017-03-06 14:12:31	update the docs	/Users/steve/projects/first_project
2017-04-06 14:12:49	debugging errors in the foobar script	/Users/steve/projects/first_project

$ ~/now-log/filter_data.sh .now_log.tsv "2017-02"
Input file is .now_log.tsv
Filter is 2017-02
Output file is 2017-02_billing_log.tsv
Saving filtered results

$ cat 2017-02_billing_log.tsv
2017-02-06 13:33:27	setting up second project cause the boss said so	/Users/steve/projects/second_project
2017-02-06 14:12:02	doing more work	/Users/steve/projects/second_project
```

If the output file already exists, the old copy will be moved to a backup location with a timestamp.

```bash
$ ~/now-log/filter_data.sh .now_log.tsv "2017-02"
Input file is .now_log.tsv
Filter is 2017-02
Output file is 2017-02_billing_log.tsv
Output file already exists, making backup
Moving 2017-02_billing_log.tsv to old/2017-02_billing_log.tsv_20170106t192816.tsv
File backed up to: old/2017-02_billing_log.tsv_20170106t192816.tsv
Saving filtered results
```
