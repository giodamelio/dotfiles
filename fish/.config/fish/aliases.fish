# Quickly edit my aliases
function aliasedit
  eval $EDITOR ~/dotfiles/fish/.config/fish/aliases.fish
end

# Shorthands
alias t task
alias pe path-extractor
alias rr roamer
alias tf terraform

# Emacs aliases
alias e  "emacsclient -c"
alias et "emacsclient -t"
function ee
  if test (count $argv) -ge 1
    set args $argv
  else
    set args "."
  end

  emacsclient -c $args &
  disown
end

# For when I type too fast
alias gti git
alias gup git
alias gut git
alias ipa "ip a"
