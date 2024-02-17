#!/bin/bash

python update.py $1 || { echo 'Python script failed'; exit 1; }

mkdir -p ~/Library/Application\ Support/typst/packages/local/papertemplate/$1
cp -r paper_template.typ typst.toml "~/Library/Application Support/typst/packages/local/papertemplate/$1"

git add .
git commit -m "Update version to $1"
git tag -a $1 -m $1
git push origin $1
