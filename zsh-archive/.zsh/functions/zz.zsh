zz() {
  cd $(z | tr -s " " | cut -d " " -f 2- | tail -n +2 | fzf)
}
