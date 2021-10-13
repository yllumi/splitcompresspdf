#!/bin/bash

name="Ipin"
echo "Get ready, $name!"
echo 

# Get folder name
folder=$1

# Compress pdf
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$folder/source.min.pdf" "$folder/source.pdf"

# Read file split specs
while read line; do
    echo $line
    while IFS=" " read -ra COL; do
        first=${COL[0]}
        last=${COL[1]}
        output=${COL[2]}
        
        # Split pdf based on spec
        pdftk "$folder/source.min.pdf" cat $first-$last output "$folder/$output"
    done <<< "$line"
done < "$folder/index.txt"
