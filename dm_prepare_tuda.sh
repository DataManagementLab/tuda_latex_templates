#!/bin/bash

if [ "$1" != "" ]; then
    echo "Using logo file in the following path" $1
else
    echo "Please provide the path to the logo file as first command line argument"
    exit 1
fi

./addlicense.sh

main_tex_file=thesis.tex
archive_name=dm_tuda_templates.zip
rm -f $archive_name

latexmk $main_tex_file

zip -ll -y -r $archive_name thesis.tex bibliography.bib chapters img thesis.pdf README.md dm_logo.png latexmkrc tex $1
