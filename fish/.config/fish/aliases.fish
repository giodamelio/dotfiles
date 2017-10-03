# Quickly edit my aliases
function aliasedit
  eval $EDITOR ~/dotfiles/fish/.config/fish/aliases.fish
end

# Shorthands
alias g git
alias t task
alias pe path-extractor
alias rr roamer

# Emacs aliases
alias e  "emacsclient -c"
alias et "emacsclient -t"
function ee
  emacsclient -c . $argv &
end

# For when I type too fast
alias gti git
alias ipa "ip a"
