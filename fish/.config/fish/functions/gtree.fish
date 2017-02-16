function gtree
  tree -I (cat (printf "%s/.gitignore" (git rev-parse --show-toplevel)) | sed "s:\/\$::" | tr "\n" "|") $argv
end
