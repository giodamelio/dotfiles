# Set out term to 256 colors
set -x TERM "xterm-256color"

# Set our editor
set -x EDITOR "nvim"
set -x VISUAL "gvim"

# Add ~/bin to the path
set -x PATH $PATH $HOME/bin

# Append perl bin to path
set -x PATH $PATH /usr/bin/core_perl/

# Set GOPATH
set -x GOPATH $HOME/Projects/go
set -x PATH $GOPATH/bin $PATH

# Set elm path
set -x PATH $HOME/bin/elm/.cabal-sandbox/bin $PATH

# Setup nvm wrapper
source ~/.config/fish/nvm.fish

# Use the fortune command as a greeting
function fish_greeting
    # Only run fortune ~20% of the time
    if test (random) -lt 6553
        fortune -as
    end
end

# Replace vim with neovim
alias vim="nvim"

