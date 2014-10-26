# dotfiles

Here are my dotfiles. To install them you need a bunch of stuff.

 - vim or gvim
 - Node.js
 - tmux
 - fish
 - Dunst

On Arch

    packer -Sy vim nodejs tmux fish-shell-git dunst-git

When you have all the dependencies, just run

    cd ~
    git clone git@github.com:giodamelio/dotfile.git
    cd ~/dotfiles
    ./install.sh

