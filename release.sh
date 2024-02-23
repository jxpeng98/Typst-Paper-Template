#!/bin/bash

python update.py $1

# check system and move files to correct location

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on macOS"
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

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Running on Linux"

    mkdir -p "$HOME/.local/share/typst/packages/local/papertemplate/$1"
    if [ ! -d "$HOME/.local/share/typst/packages/local/papertemplate/$1" ]; then
        echo "Failed to create directory"
        exit 1
    fi

    if [ -f paper_template.typ ] && [ -f typst.toml ]; then
        cp -r paper_template.typ typst.toml "$HOME/.local/share/typst/packages/local/papertemplate/$1"
        echo "Successfully copied files to $HOME/.local/share/typst/packages/local/papertemplate/$1"
    else
        echo "One or more files do not exist in the current directory."
        exit 1
    fi

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # %APPDATA%
    echo "Running on Windows"

    mkdir -p "$APPDATA/typst/packages/local/papertemplate/$1"

    if [ ! -d "$APPDATA/typst/packages/local/papertemplate/$1" ]; then
        echo "Failed to create directory"
        exit 1
    fi

    if [ -f paper_template.typ ] && [ -f typst.toml ]; then
        cp -r paper_template.typ typst.toml "$APPDATA/typst/packages/local/papertemplate/$1"
        echo "Successfully copied files to $APPDATA/typst/packages/local/papertemplate/$1"
    else
        echo "One or more files do not exist in the current directory."
        exit 1
    fi

fi



git add .
git commit -m "Update version to $1"
git tag -a $1 -m "$1"
git push origin $1
