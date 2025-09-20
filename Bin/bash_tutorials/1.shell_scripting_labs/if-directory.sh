#!/bin/bash

read -p "What directory do you want to check for?  e.g. /Users/jaimeledesma/: " directory
if [ -d "$directory" ]; then
  echo "The directory exists"
else
  echo "That directory does not exist."
fi
