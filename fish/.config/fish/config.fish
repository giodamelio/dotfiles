# Set our editor
set -x EDITOR "emacsclient -t" 
set -x VISUAL "emacsclient -c -a ''"
alias ec "emacsclient -c -a ''"

# Append perl bin to path
set -x PATH $PATH /usr/bin/core_perl/

# Set GOPATH
set -x GOPATH $HOME/Projects/go
set -x PATH $GOPATH/bin $PATH

# Set elm path
set -x PATH $HOME/bin/elm/.cabal-sandbox/bin $PATH

# Add iojs to the path
set -x PATH $HOME/bin/iojs-v1.0.1-linux-x64/bin $PATH

# Use the fortune command as a greeting
function fish_greeting
    fortune -as
end

