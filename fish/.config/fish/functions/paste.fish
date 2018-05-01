function paste
  switch (uname)
    case 'Darwin'
      pbpaste
    case 'Linux'
      echo "You should probably add a command to paste on linux..."
  end
end

