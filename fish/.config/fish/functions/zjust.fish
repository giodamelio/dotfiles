function zjust
  set task (just --summary | tr ' ' '\n' | fzf)
  just $task
end
