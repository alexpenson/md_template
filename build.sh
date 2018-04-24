#!/bin/bash
date_string=$(date +"%F")
commit_tag=$(git rev-parse --verify --short HEAD)
output_name=paper-$date_string-$commit_tag.docx

for i in figs/*.pdf; do 
    convert $i $i.png 
done

pandoc \
    -r markdown \
    --standalone \
    --metadata=commit:$commit_tag \
    --filter ./panflute/metavars.py \
    --filter pandoc-crossref \
    --filter pandoc-citeproc \
    --filter pandoc-docx-pagebreak \
    --bibliography=paper.bib \
    -o $output_name \
    paper.md

