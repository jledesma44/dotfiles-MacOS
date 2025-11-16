#!/bin/bash

echo -n "Enter your name:"
read name
echo "Hello $name."

# -n flag stands for "Do not create a new line" so you can type next the prompt text
echo -n "Hey $name Enter your Age:"
read age
echo "Your are $age years old."

# -s flag stands for secret or silent and the -p flag stands for password
read -s -p "Enter your password:" Password
echo

echo "password accepted."
