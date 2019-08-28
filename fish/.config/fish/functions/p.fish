function p
  switch (uname)
    case 'Darwin'
      qlmanage -p $argv
    case 'Linux'
      echo 'No preview system configured for Linux'
  end
end
