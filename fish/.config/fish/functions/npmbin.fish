function npmbin
  if test -d "./node_modules/.bin"
    echo "Adding local npm bin to path"
    set -x PATH (realpath "./node_modules/.bin/") $PATH
  else
    echo "Node modules folder does not exist"
  end
end
