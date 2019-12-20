SHELL:=/bin/bash
HOME:=$(shell echo $$HOME)
BASHRC:=$(HOME)/.bashrc
LOG_DIR:=$(HOME)/now-logs
NOW_LOGGER:=$(CURDIR)/now-logger.sh
$(BASHRC):
	touch "$(BASHRC)"
$(LOG_DIR):
	mkdir -p "$(LOG_DIR)"
setup: $(LOG_DIR) $(BASHRC)
	echo "source $(NOW_LOGGER)" >> "$(BASHRC)"
