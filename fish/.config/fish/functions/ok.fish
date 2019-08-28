function ok
  # See if the .ok file exists
  if ! test -e .ok
    echo "No .ok file found"
    return 1
  end

  if test (count $argv) -eq 0
    # Print the .ok file with line numbers the comments colored grey
    sed -Ee 's/(#.+$)/'(set_color 666)'\1'(set_color normal)'/' .ok | nl
  else
    # Put the command in the shell
    set -l command (sed $argv[1]'!d' .ok)
    if test -z $command
      printf "Line of index %s not in .ok file" $argv[1]
      return 1
    end
    commandline -rb $command
    commandline -f repaint
  end
end
