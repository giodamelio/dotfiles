#!/bin/bash

# Hack to make my dotfiles in Github Codespaces
# Install stow
if [ "$CODESPACES" == "true" ]; then
    sudo apt-get -y install --no-install-recommends stow
    
    stow git
    stow neovim
    
    exit 0
fi

stow */

