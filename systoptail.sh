#!/bin/bash

# Script name: systoptail
# Purpose: Extract log entries from the beginning or end of the /var/log/syslog log file. Let the user provide the number of lines to extract.
# Version: 1.0
# Author: P-C Markovski
# Date (git repo init): 2019-09-25


function syslogtop()
{
	if [[ $# -lt 1 ]]; then
		printf "Number of lines needed.\n"
		exit
	fi
	head -n $1 /var/log/syslog
}

function syslogtail()
{
	if [[ $# -lt 1 ]]; then
		printf "Number of lines needed.\n"
		exit
	fi
	tail -n $1 /var/log/syslog
}

if [[ $# -lt 1 ]]; then
	printf "Usage: funcslogging top/tail lines\n"
	exit
fi

if [[ "$1" == "top" ]]; then
	syslogtop $2
	printf "Checking first %s lines of syslog log\n", $2
fi

if [[ "$1" == "tail" ]]; then
	syslogtail $2
	printf "Checking last %s lines of syslog log\n", $2
fi
