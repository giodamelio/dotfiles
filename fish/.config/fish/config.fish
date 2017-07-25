# Set out term to 256 colors
set -x TERM "xterm-256color"

# Set default editor
set -x EDITOR "emacsclient -t"
set -x VISUAL "emacsclient -c"

# Set default browser
set -x BROWSER "google-chrome"

# Add a bunch of things to our path
set -x PATH $PATH $HOME/bin  # Personal scripts
set -x PATH $PATH /usr/local/bin/
set -x PATH $PATH /usr/bin/core_perl/  # Append perl bin to path
set -x GOPATH $HOME/Projects/go # Setup GOPATH
set -x PATH $GOPATH/bin $PATH

# Setup rust and racer
set -x PATH $HOME/.cargo/bin $PATH
set -x RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
set -x CARGO_HOME $HOME/.cargo

# Stop virtualenv from messing with my prompt
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Load aliases
source ~/.config/fish/aliases.fish

# Use the fortune command as a greeting
function fish_greeting
  # Only run fortune ~20% of the time
  if test (random) -lt 6553
    fortune -as
  end
end

# Use new keybindings for fzf plugin
set -U FZF_LEGACY_KEYBINDINGS 0

# Setup virtualfish
eval (python -m virtualfish)

# Some emacs specific configuration
if test -n "$EMACS"
  # Disable title since ansi-term cannot handle it
  function fish_title
    true
  end
end
