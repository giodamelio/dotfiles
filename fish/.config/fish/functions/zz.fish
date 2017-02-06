function zz
  z -l | tr -s " " | cut -d " " -f 2- | tail -n +2 | fzf +s | read -l select
  if not test -z $select
    commandline -rb (printf $select)
    commandline -f repaint
  end
end
