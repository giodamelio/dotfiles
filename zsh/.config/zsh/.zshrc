# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/aliases.zsh # Include our aliases

# Add some directories to the PATH
export PATH=$HOME/bin:$PATH
# Load bins from nix
if [ -e /home/giodamelio/.nix-profile/etc/profile.d/nix.sh ]; then . /home/giodamelio/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Load Antibody plugins
source ~/.zsh_plugins.sh

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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
