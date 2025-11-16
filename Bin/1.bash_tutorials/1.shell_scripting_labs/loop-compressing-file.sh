#!/bin/bash

for file in *.txt; do
  echo "============="
  echo "Compressing $file"
  echo "============="
  gzip "$file"
  echo "============="
done
