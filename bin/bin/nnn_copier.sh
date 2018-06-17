#!/usr/bin/env bash
platform=$(uname)
if [[ $platform == 'Darwin' ]]; then
  echo -n "$1" | pbcopy
else
  echo -n "$1" | xsel --clipboard --input
fi
