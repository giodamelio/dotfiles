function setdebug
  set -g __FILTER_HISTORY_FILE "/tmp/debug-env-var-previous-filter"

  # Set the DEBUG environment variable and add the filter to the history
  function __set_debug_env_var
    # Print a message
    echo "Set debug filter to \"$argv[1]\""
    set -q DEBUG; and echo "Previous value was \"$DEBUG\""

    # Set the variable
    set -xg DEBUG $argv[1]

    # Add value to list of previous filters if allowed
    set -q $argv[2]; and echo $argv[1] >> $__FILTER_HISTORY_FILE

    # Delete the function after it is used
    functions -e __set_debug_env_var
  end

  # If there is more then one arg, print usage and exit
  if test (count $argv) -gt 1
    echo "Usage: setdebug [filter]"
    return
  end

  # If an argument is given set that as the debug filter
  if test (count $argv) -eq 1
    __set_debug_env_var $argv[1]
    return
  end

  # Get a filter from a list of previous filters
  cat $__FILTER_HISTORY_FILE | \
  fzf --no-sort --tac --print-query --header "Current filter: \"$DEBUG\"" | \
  read --local --array --null new_filter

  # If it is a new filter not in the history, set it
  if test (count $new_filter) -eq 1
    __set_debug_env_var $new_filter[1]
    return
  end

  # Otherwise set the prexisting filter
  # Also don't add the filter to the history
  __set_debug_env_var $new_filter[2] 1
end
