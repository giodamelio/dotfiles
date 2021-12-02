#!/bin/bash

# Hack to make my dotfiles in Github Codespaces
# Install stow
if [ "$CODESPACES" == "true" ]; then
    if [ -f /etc/alpine-release ]; then
        sudo apk add stow
    else
        sudo apt-get update && sudo apt-get -y install --no-install-recommends stow
    fi
    
    stow -t ~ git neovim
    
    exit 0
fi

stow */

