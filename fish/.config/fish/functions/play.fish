function play
  mpc playlist -f '%position% %artist% - %title%' | fzf | cut -d " " -f 1 | xargs mpc play
end

