# Remove the alias added by fasd
unalias zz

zz() {
  fasd -d | fzf --no-sort --tac | tr -s " " | cut -d " " -f 2 | read dir

  if [ -d $dir ]; then
    cd $dir
    printf "Changed directory to \"%s\"\n" $(pwd)
  else
    echo "No directory selected"
  fi
}
