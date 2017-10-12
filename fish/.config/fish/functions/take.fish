function take
  if test (count $argv) -eq 1
    mkdir -p $argv[1]
    cd $argv[1]
  else
    echo "You must pass a path to create/changedir into"
  end
end
