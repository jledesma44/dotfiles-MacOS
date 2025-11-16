#!/bin/bash

read -p "What is your name?" name
if [ "$name" == "John" ]; then
  echo "Hello John ... You're logged in!"
else
  echo "You are not John, goodbye"
fi
