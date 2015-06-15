function in_box
  set label $argv[1]
  set command_ $argv[2]
  set command_output (eval $command_)

  # Print the beginning of the top of the box
  set label_beginning  "┏━━━┫ $label ┣━━━"
  set label_beginning_length (echo $label_beginning | wc -m)
  printf $label_beginning

  # Find the longest line in the output
  set max_length (echo -n {$command_output}\n |  wc -L)

  # Finish the top of the box
  for i in (seq 1 (math $max_length - $label_beginning_length + 4))
    echo -n "━"
  end
  echo "┓"

  # Print each line of the command with the left and right edges
  for line in $command_output
    echo -n "┃ $line "

    # Pad some spaces to match length of longest line
    set line_length (echo "┃ $line " | wc -m)
    set pad_by (math $max_length - $line_length + 4)

    # If the longest line is shorter then the label width,
    # add extra padding to make it line up
    set extra_pad 0
    if test $max_length -lt (math $label_beginning_length + 1)
      set extra_pad (math $label_beginning_length - $max_length - 4)
    end

    for i in (seq 1 (math $pad_by + $extra_pad))
      echo -n " "
    end

    # Add the right border
    echo "┃"
  end

  # Add buttom line
  printf "┗"
  for i in (seq 1 (math $max_length + 2 + $extra_pad))
    echo -n "━"
  end
  echo "┛"
end
