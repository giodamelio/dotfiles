# Set our editor
set -U EDITOR vim

# Append our bin path
set -x PATH ~/.dotfiles/bin $PATH

# Set GOPATH
set -x GOPATH $HOME/Projects/go
set -x PATH $GOPATH/bin $PATH

# Use the fortune command as a greeting
function fish_greeting
    fortune -as
end

