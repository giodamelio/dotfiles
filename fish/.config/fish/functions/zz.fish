function zz
  z -l | tr -s " " | cut -d " " -f 2- | tail -n +2 | fzf
end
