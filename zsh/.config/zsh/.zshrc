source $ZDOTDIR/aliases.zsh # Include our aliases

# Add some directories to the PATH
export PATH=$HOME/bin:$PATH

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
