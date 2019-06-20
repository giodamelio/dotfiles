function statusmode
  if test $statusmode -ne 0
    echo "statusmode disabled"
    set statusmode 0
  else
    echo "statusmode enabled"
    set statusmode 1
  end
end
