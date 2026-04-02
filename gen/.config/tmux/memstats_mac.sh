#!/usr/bin/env bash

# Page size in bytes
pagesize=4096

# Get active and inactive pages, remove trailing dot
active=$(vm_stat | awk '/Pages active/ {gsub(/\./,"",$3); print $3}')
inactive=$(vm_stat | awk '/Pages inactive/ {gsub(/\./,"",$3); print $3}')

# Calculate memory in MB
used=$(( (active + inactive) * pagesize / 1024 / 1024 ))

# Output
echo "${used}MB"
