source $ZDOTDIR/aliases.zsh # Include our aliases

# Add some directories to the PATH
export PATH=$HOME/bin:$PATH

# Load Antibody plugins
source ~/.zsh_plugins.sh

# Replace the reverse history finder with the one from histdb
bindkey '^r' _histdb-isearch
