#!/bin/zsh

HOST="google.com"

ping -c 1 $HOST

if [ "$?" is -eq "0" ]; then
  echo"$HOST is reachable."
else
  echo"$HOST is not reachable."
fi
