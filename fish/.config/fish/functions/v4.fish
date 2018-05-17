function v4
  uuidgen | tr '[:upper:]' '[:lower:]' | sed "s/-//g"
end
