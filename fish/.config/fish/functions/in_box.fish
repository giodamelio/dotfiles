function in_box
  function print_usage
    echo "Usage: in_box [<title>] <command> [<charset>]"
  end

  # Default charset
  set c_horizontal "━"
  set c_vertical "┃"
  set c_corner_up_left "┏"
  set c_corner_up_right "┓"
  set c_corner_down_left "┗"
  set c_corner_down_right "┛"
  set c_t_right "┣"
  set c_t_left "┫"

  # Handle the parameters
  switch (count $argv)
    case 0
      print_usage
      return 1
    case 1
      set command_ $argv[1]
    case 2
      set label $argv[1]
      set command_ $argv[2]
    case 3
      set label $argv[1]
      set command_ $argv[2]
      set charset $argv[3]

      # Make sure it is a valid charset
      switch $charset
        case "thin"
          set c_horizontal "─"
          set c_vertical "│"
          set c_corner_up_left "┌"
          set c_corner_up_right "┐"
          set c_corner_down_left "└"
          set c_corner_down_right "┘"
          set c_t_right "├"
          set c_t_left "┤"
        case "thick"
        case "double"
          set c_horizontal "═"
          set c_vertical "║"
          set c_corner_up_left "╔"
          set c_corner_up_right "╗"
          set c_corner_down_left "╚"
          set c_corner_down_right "╝"
          set c_t_right "╠"
          set c_t_left "╣"
        case "*"
          print_usage
          echo "Charset must be one of ['thin', 'thick', 'double']"
          return 1
      end
    case "*"
      print_usage
      return 1
  end

  # Get the output of the command,
  # if it fails, exit
  set command_output (eval $command_)
  set command_exit_code $status
  if test $command_exit_code -eq 127
    echo "Command \"$command_\" not found $command_exit_code"
    return $command_exit_code
  end

  # Print the beginning of the top of the box
  if set -q label
    set label_beginning  "$c_corner_up_left$c_horizontal$c_horizontal$c_horizontal$c_t_left $label $c_t_right$c_horizontal$c_horizontal$c_horizontal"
    set label_beginning_length (echo $label_beginning | wc -m)
    echo -n $label_beginning
  else
    set label_beginning  "$c_corner_up_left$c_horizontal$c_horizontal$c_horizontal"
    set label_beginning_length (echo $label_beginning | wc -m)
    echo -n $label_beginning
  end

  # Find the longest line in the output
  set max_length (echo -n {$command_output}\n |  wc -L)

  # Finish the top of the box
  for i in (seq 1 (math $max_length - $label_beginning_length + 4))
    echo -n "$c_horizontal"
  end
  echo "$c_corner_up_right"

  # Print each line of the command with the left and right edges
  for line in $command_output
    echo -n "$c_vertical $line "

    # Pad some spaces to match length of longest line
    set line_length (echo "$c_vertical $line " | wc -m)
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
    echo "$c_vertical"
  end

  # Add buttom line
  echo -n "$c_corner_down_left"
  for i in (seq 1 (math $max_length + 2 + $extra_pad))
    echo -n "$c_horizontal"
  end
  echo "$c_corner_down_right"
end
