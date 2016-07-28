# Set out term to 256 colors
set -x TERM "xterm-256color"

# Set our editor
set -x EDITOR "nvim"
set -x VISUAL "gvim"

# Add a bunch of things to our path
set -x PATH $PATH $HOME/bin  # Personal scripts
set -x PATH $PATH /usr/local/bin/
set -x PATH $PATH /usr/bin/core_perl/  # Append perl bin to path
set -x GOPATH $HOME/Projects/go # Setup GOPATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/bin/elm/.cabal-sandbox/bin $PATH # Elm

# Setup nvm wrapper
source ~/.config/fish/nvm.fish

# Use the fortune command as a greeting
function fish_greeting
  # Only run fortune ~20% of the time
  if test (random) -lt 6553
    fortune -as
  end
end

# Enable fish vi mode
fish_vi_key_bindings

# Remove the default fish vi prompt
function fish_mode_prompt
end function
