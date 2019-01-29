# Set out term to 256 colors
set -x TERM "xterm-256color"

# Set default editor
set -x EDITOR "nvim"
set -x VISUAL "emacsclient -c"

# Set default browser
set -x BROWSER "google-chrome"

# Quick function to add a directory to the PATH if it exists
function add_to_path_if_directory_exists
  if test -d $argv[1]
    switch $argv[2]
      case 'start'
        set -x PATH $argv[1] $PATH
      case 'end'
        set -x PATH $PATH $argv[1]
      case '*'
        printf "add to path: You need to specify a start or end for %s\n" $argv[1]
    end
  end
end

# Add a bunch of things to our path
add_to_path_if_directory_exists $HOME/bin "start" # Person scripts
add_to_path_if_directory_exists /usr/local/bin "end"
add_to_path_if_directory_exists /usr/bin/core_perl "end" # Perl bin path
add_to_path_if_directory_exists $HOME/go/bin "start" # Go bin path

# Setup rust and racer
add_to_path_if_directory_exists $HOME/.cargo/bin "end" # Cargo bin
set -x RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
set -x CARGO_HOME $HOME/.cargo

# Stop virtualenv from messing with my prompt
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Load plugins
fundle plugin 'fishgretel/fasd'
fundle plugin 'edc/bass'
fundle plugin 'FabioAntunes/fish-nvm'

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

# Mac specific configs
if test (uname) = "Darwin"
  # Prepend python local to the PATH to overwrite system python
  set -x PATH /usr/local/opt/python/libexec/bin $PATH

  # iTerm shell integration
  test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
end
