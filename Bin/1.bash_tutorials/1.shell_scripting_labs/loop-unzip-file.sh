#!/bin/bash

for file in *.txt.gz; do
  echo "============="
  echo "Unzipping $file"
  echo "============="
  gzip -d "$file"
  echo "============="
done
