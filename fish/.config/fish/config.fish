# Set out term to 256 colors
set -x TERM "xterm-256color"

# Set default editor
set -x EDITOR "emacsclient -t"
set -x VISUAL "emacsclient -c"

# Set default browser
set -x BROWSER "google-chrome"

# Add a bunch of things to our path
set -x PATH $PATH $HOME/bin  # Personal scripts
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH /usr/bin/core_perl  # Append perl bin to path
set -x GOPATH $HOME/Projects/go # Setup GOPATH
set -x PATH $GOPATH/bin $PATH

# Setup rust and racer
set -x PATH $HOME/.cargo/bin $PATH
set -x RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
set -x CARGO_HOME $HOME/.cargo

# Stop virtualenv from messing with my prompt
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Load plugins
fundle plugin 'tuvistavie/fish-nvm'
fundle plugin 'fishgretel/fasd'

fundle init

# Load aliases
source ~/.config/fish/aliases.fish

# Load functions that need to overwrite plugins
source $HOME/.config/fish/functions/zz.fish

# Use the fortune command as a greeting
function fish_greeting
  # Only run fortune ~20% of the time
  if test (random) -lt 6553
    fortune -as
  end
end

# Use new keybindings for fzf plugin
set -U FZF_LEGACY_KEYBINDINGS 0

# Some emacs specific configuration
if test -n "$EMACS"
  # Disable title since ansi-term cannot handle it
  function fish_title
    true
  end
end

# Mac specific configs
if test (uname) = "Darwin"
  # Prepend python local to the PATH to overwrite system python
  set -x PATH /usr/local/opt/python/libexec/bin $PATH

  # iTerm shell integration
  test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
end

# Setup virtualfish
eval (python -m virtualfish)

