#!/bin/bash

choice=""
while [ "$choice" != "q" ]; do
  echo "Select an option: "
  echo "1. Say Hello"
  echo "2. Show date"
  echo "q. Quit"
  read -p "Enter your choice: " choice
  case $choice in
  1) echo "Hello World" ;;
  2) date ;;
  q) echo "Goodby!" ;;
  4) echo "invalid option" ;;
  esac
done
