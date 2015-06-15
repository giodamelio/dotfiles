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
    for i in (seq 1 (math $max_length - (echo "┃ $line " | wc -m) + 4))
      echo -n " "
    end

    # Add the right border
    echo "┃"
  end

  # Add buttom line
  printf "┗"
  for i in (seq 1 (math $max_length + 2))
    echo -n "━"
  end
  echo "┛"
end

function disks
  in_box "Mount Points" "lsblk -a"
  in_box "Disk Usage" "df -h"
end
