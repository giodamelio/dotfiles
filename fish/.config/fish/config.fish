# Set our editor
set -U EDITOR vim

# Append our bin path
set -x PATH ~/.dotfiles/bin $PATH

# Append perl bin to path
set -x PATH $PATH /usr/bin/core_perl/

# Set GOPATH
set -x GOPATH $HOME/Projects/go
set -x PATH $GOPATH/bin $PATH

# Use the fortune command as a greeting
function fish_greeting
    fortune -as
end

