#!/bin/bash

HOST="googleee.comm"

ping -c 1 $HOST

RETURN_CODE=$?

if [ "$RETURN_CODE" -ne "0" ]; then
  echo "$HOST is unreachable."
  echo "return code is:$RETURN_CODE"
fi
