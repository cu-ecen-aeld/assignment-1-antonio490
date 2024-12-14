#!/bin/bash

# Check if the correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required. Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Assign arguments to variables
filesdir=$1
searchstr=$2

# Check if the first argument is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory or does not exist."
    exit 1
fi

# Find the number of files in the directory and subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Find the number of matching lines containing the search string
matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the results
echo "The number of files are $file_count and the number of matching lines are $matching_lines"

# Exit successfully
exit 0

