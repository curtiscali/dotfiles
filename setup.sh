#!/bin/bash

cp .vimrc $HOME
cp .zshrc $HOME
cp .bashrc $HOME

STARSHIP_CONFIG_DIR=$HOME/config

if [! -d "$STARSHIP_CONFIG_DIR"]; then
    mkdir $STARSHIP_CONFIG_DIR
fi

cp starship.toml $STARSHIP_CONFIG_DIR
