function copy
  switch (uname)
    case 'Darwin'
      pbcopy
    case 'Linux'
      xclip -selection 'clipboard' $argv
  end
end

