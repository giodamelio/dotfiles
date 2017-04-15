# Emacs aliases
alias e  "emacsclient -c"
alias et "emacsclient -t"
function ee
  emacsclient -c . $argv &
end
