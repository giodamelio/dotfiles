export NNN_TMPFILE="/tmp/nnn"

function n --description 'nnn shortcut with cd capibility'
  nnn $argv

  if test -e $NNN_TMPFILE
    . $NNN_TMPFILE
    rm $NNN_TMPFILE
  end
end
