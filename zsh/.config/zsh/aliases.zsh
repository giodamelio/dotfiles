# ls accounting for differences between os's
case "$OSTYPE" in
  darwin*)
    # -G shows colors, -F shows listing postfixes by item type
    alias ls='ls -GF'
    alias la='ls -ahGF'
    alias ll='ls -lGF'
  ;;
  linux*)
    alias ls='ls --color=auto'
    alias la='ls -ah --color=auto'
    alias ll='ls -l --color=auto'
  ;;
esac

# Make Vim point to Neovim
alias vim='nvim'
alias vimdiff='nvim -d'

# Refresh the Antibody plugins file
alias antibody-refresh='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh'

# Misc
alias tf=terraform

# Improved version of core commands
alias cat=bat
alias fd=fdfind
alias help=tldr
alias ping='prettyping --nolegend'
alias top=htop
