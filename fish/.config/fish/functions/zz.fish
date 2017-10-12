function zz
  fasd -d | fzf | tr -s " " | cut -d " " -f 2 | read -l dir
  cd $dir
end
