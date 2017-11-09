function zz
  fasd -d | fzf --no-sort --tac | tr -s " " | cut -d " " -f 2 | read -l dir
  if test (count $dir) -gt 0
    cd $dir
    printf "Changed directory to \"%s\"\n" (pwd)
  else
    echo "No directory selected"
  end
end
