# Set the foreground color a RGB value
fg() {
  printf "\x1b[38;2;$1;$2;$3m"
}

# A pretty pwd
function collapse_pwd {
  printf $(pwd | sed -e "s,^$HOME,~,")
}

# Function to keep our variables out of the main scope
function prompt() {
  # Set some colors
  local LIGHT_BLUE=$(fg 31 134 206)
  local OLIVE_GREEN=$(fg 133 153 0)
  local PURPLE=$(fg 108 113 196)

  # Set some helper values
  local NEWLINE=$'\n'
  local BOLD=$(tput bold)
  local NORMAL=$(tput sgr0)
  local CURRENT_DIR='$(collapse_pwd)'

  # Set the prompt
  local FIRST_LINE="$LIGHT_BLUE┌─[$OLIVE_GREEN%n@%m$LIGHT_BLUE]─[$OLIVE_GREEN$CURRENT_DIR$LIGHT_BLUE]"
  local SECOND_LINE="└─[$BOLD$PURPLE$CURRENT_GIT_BRANCH$NORMAL$CURRENT_GIT_REMOTE$LIGHT_BULE|$LIGHT_BLUE] "

  setopt prompt_subst
  PROMPT="$FIRST_LINE$NEWLINE$SECOND_LINE"
}
prompt
