function tmd
  # Use fzf to select tmux sessions
  # If there is no sessions exit without prompting for fzf
  # TODO: check in on fzf-tmux
  # Uses fzf --height <half of terminal height> because fzf-tmux is really slow right now
  # See https://github.com/junegunn/fzf/issues/810
  tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --height (math "floor($LINES / 2)") --exit-0 | read -l session
  tmux kill-session -t $session 2>/dev/null; or echo "No tmux session found"
end
