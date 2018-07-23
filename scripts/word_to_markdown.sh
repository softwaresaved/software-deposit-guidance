#!/bin/bash

# Usage: source work_to_markdown.sh *.docx
#
# Uses w2m to convert <FILE>.docx into markdown/<FILE>.md.
# If markdown/ does not exist, it is created.
# If <FILE>.md exists, it is overwritten.

FILES=$@

mkdir -p markdown
for file in $@; do
    echo "Converting $file"
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    mdfilename="markdown/"$filename".md"
    w2m $i > $mdfilename
done
