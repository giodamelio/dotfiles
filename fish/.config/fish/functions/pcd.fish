function pcd
  set PROJECT_PATH (locate $argv[1] | grep -Ev ".git|node_modules" | head -n 1)
  cd $PROJECT_PATH
end

