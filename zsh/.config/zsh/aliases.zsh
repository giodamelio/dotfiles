# ls
alias ls='ls --color=auto'
alias la='ls -ah --color=auto'
alias ll='ls -l --color=auto'

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
