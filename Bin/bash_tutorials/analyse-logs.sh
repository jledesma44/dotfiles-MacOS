#!/bin/bash

LOG_DIR="/Users/jaimeledesma/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

echo "analysing log files"
echo "======================="

ehco -e "\nList of log files updated in the last 24 hours"

find LOG_DIR -name "log.*" -mtime -1

echo

grep "ERROR" application.log
grep -c "ERROR" application.log
grep -c "FATAL" application.log

grep "FATAL" system.log
grep -c "CRITCAL" system.log
grep -c "CRITICAL" system.log
