# Set our editor
set -x EDITOR "emacsclient -t" 
set -x VISUAL "emacsclient -c -a ''"
alias ec "emacsclient -c -a ''"

# Append perl bin to path
set -x PATH $PATH /usr/bin/core_perl/

# Set GOPATH
set -x GOPATH $HOME/Projects/go
set -x PATH $GOPATH/bin $PATH

# Use the fortune command as a greeting
function fish_greeting
    fortune -as
end

