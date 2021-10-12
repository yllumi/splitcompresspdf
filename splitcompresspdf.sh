#!/bin/bash

name="Ipin"
echo "Get ready, $name!"
echo 

# Get filename
folder=$1

# Read file split specs
while read line; do
    echo $line
    while IFS=" " read -ra COL; do
        first=${COL[0]}
        last=${COL[1]}
        output=${COL[2]}
        pdftk "$folder/source.pdf" cat $first-$last output "$folder/uncompress_$output"
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$folder/$output" $folder/uncompress_$output
    done <<< "$line"
done < "$folder/index.txt"
