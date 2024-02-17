#!/bin/bash

python update.py $1

mkdir -p "$HOME/Library/Application Support/typst/packages/local/papertemplate/$1"
if [ ! -d "$HOME/Library/Application Support/typst/packages/local/papertemplate/$1" ]; then
    echo "Failed to create directory"
    exit 1
fi

if [ -f paper_template.typ ] && [ -f typst.toml ]; then
    cp -r paper_template.typ typst.toml "$HOME/Library/Application Support/typst/packages/local/papertemplate/$1"
    echo "Successfully copied files to $HOME/Library/Application Support/typst/packages/local/papertemplate/$1"
else
    echo "One or more files do not exist in the current directory."
    exit 1
fi


git add .
git commit -m "Update version to $1"
git tag -a $1 -m "$1"
git push origin $1
