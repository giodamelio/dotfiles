function experiment
  # Create the experiment name
  set experiment_name $argv[1] "unnamed"
  set experiment_id (printf "experiment-%s-%s" $experiment_name[1] (openssl rand -hex 4))

  # Create the directory and switch to it
  set experiment_directory (mktemp -d $HOME/tmp/$experiment_id)
  cd $experiment_directory

  # If we are inside a tmux session create and new session and connect to it
  if test -n "$TMUX"
    tmux new-session -d -s $experiment_id -c $experiment_directory
    tmux switch-client -t $experiment_id
  else
    echo "Experiment '$experiment_name[1]' started"
  end
end
