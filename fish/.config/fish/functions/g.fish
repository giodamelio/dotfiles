function g
  # Make sure there is exactly one argument
  if test (count $argv) -ne 1
    fzf | read input
  else
    set input $argv[1]
  end

  if test -f $input # Input is a file
    if test (file $input | egrep "(text|empty|no\ magic)") # Input is a text file
      if test -w $input # Input is writeable
        eval $EDITOR $input # Open input in editor
      else
        echo "$input is not writeable"
        return 1
      end
    else # Input is not a text file
      open $input
    end
  else if test -d $input # Input is a directory
    cd $input
  else # No sure what to do
    echo "Not sure what to do with $input"
    return 1
  end
end
