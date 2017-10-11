function fish_right_prompt
  set_color blue
  printf "["

  set_color green
  printf "%s" (date +%H:%M:%S)

  set_color blue
  printf "]"
end
