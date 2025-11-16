#!/bin/bash

for file in *.sh; do
  echo "============="
  echo "Reading $file"
  echo "============="
  cat "$file"
  echo "============="
done
