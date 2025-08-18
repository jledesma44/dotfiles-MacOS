#!/bin/bash

find . -name "log.*" -mtime -1

grep "ERROR" application.log
grep -c "ERROR" application.log
grep -c "FATAL" application.log

grep "FATAL" system.log
grep -c "CRITCAL" system.log
grep -c "CRITICAL" system.log
