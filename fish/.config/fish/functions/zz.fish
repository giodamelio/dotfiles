function zz
  fasd -d | fzf --no-sort --tac | tr -s " " | cut -d " " -f 2 | read -l dir
  cd $dir
end
