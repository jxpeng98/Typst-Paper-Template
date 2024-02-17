#!/bin/bash

python update.py $1

mkdir -p "$HOME/Library/Application Support/typst/packages/local/papertemplate/$1"
if [ ! -d "$HOME/Library/Application Support/typst/packages/local/papertemplate/$1" ]; then
    echo "Failed to create directory"
    exit 1
fi

cp paper_template.typ typst.toml -r "$HOME/Library/Application Support/typst/packages/local/papertemplate/$1"

git add .
git commit -m "Update version to $1"
git tag -a $1 -m "$1"
git push origin $1
