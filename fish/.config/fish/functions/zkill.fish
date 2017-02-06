function zkill
  ps aux | fzf --tac | read -l process
  if not test -z $process
    set pid (echo $process | tr -s [:blank:] | cut -d " " -f 2)
    set name (echo $process | tr -s [:blank:] | cut -d " " -f 11-)
    if count $argv
      commandline -rb (printf "kill %s %s # %s" $argv $pid $name)
    else
      commandline -rb (printf "kill %s # %s" $pid $name)
    end
    commandline -f repaint
  else
    echo "Process not found"
  end
end
