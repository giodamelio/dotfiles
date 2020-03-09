#### Plugins ##################################################################
# Load Antibody plugins
source ~/.zsh_plugins.sh

# Load fasd
eval "$(fasd --init auto)"

# Load Direnv
eval "$(direnv hook zsh)"

# Load all files from functions/ directory
# I should probably learn how to use ZSH autoloading at somepoint
if [ -d $ZDOTDIR/functions ]; then
  for file in $ZDOTDIR/functions/*.zsh; do
    source $file
  done
fi

#### Source external files ####################################################
source $ZDOTDIR/aliases.zsh # Include our aliases

#### PATH additions ###########################################################
# Our personal bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH

# Load bins from nix
if [ -e /home/giodamelio/.nix-profile/etc/profile.d/nix.sh ]; then . /home/giodamelio/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

#### Settings #################################################################
# Set our editor
export EDITOR=nvim

# Put the shell into vim mode
bindkey -v

# Enable editing current command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line # Vim style
bindkey '^xe' edit-command-line # Emacs style
bindkey '^x^e' edit-command-line

# Enable advanced completion
autoload -U compinit
compinit

#### Histdb ###################################################################
# Replace the reverse history finder with the one from histdb
bindkey '^r' _histdb-isearch

# Make zsh-autozuggestions use data from histdb
_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=(histdb_top_here completion)

#### Prompt with Starship #####################################################
eval "$(starship init zsh)"
