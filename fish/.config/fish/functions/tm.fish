function tm
  # Choose whether to switch sessions or connect to a session
  if test -n "$TMUX"
    set change "switch-client"
  else
    set change "attach-session"
  end

  # If a name is passed try to switch to it, or create it if it does not exist
  if test (count $argv) -eq 1
    tmux $change -t "$argv[1]" 2>/dev/null; or tmux new-session -s "$argv[1]"
  else
    # If no name is passes use fzf to select from current sessions
    # If there is only one session select it by default (--select-1)
    # If there is no sessions exit without prompting for fzf
    # TODO: check in on fzf-tmux
    # Uses fzf --height <half of terminal height> because fzf-tmux is really slow right now
    # See https://github.com/junegunn/fzf/issues/810
    tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --height (math $LINES / 2) --select-1 --exit-0 | read -l session
    tmux $change -t $session 2>/dev/null; or echo "No tmux sessions found"
  end
end
