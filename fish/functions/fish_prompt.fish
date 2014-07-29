function fish_prompt
    # Save the status of the last command
    set -l last_status $status

    #### First line ####
    set_color -o blue
    printf "┌─["

    # Username and hostname
    set_color -o 555
    printf "%s@%s" (whoami) (hostname -s)
    set_color -o blue
    printf "] ─ ["

    # Working directory
    set_color -o 555
    printf "%s" (prompt_pwd)
    set_color -o blue
    printf "]"
    echo
    
    #### Second line ####
    # Git status
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_hide_untrackedfiles 1

    set -g __fish_git_prompt_color_branch magenta --bold
    set -g __fish_git_prompt_showupstream "informative"
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_prefix ""

    set -g __fish_git_prompt_char_stagedstate "●"
    set -g __fish_git_prompt_char_dirtystate "✚"
    set -g __fish_git_prompt_char_untrackedfiles "…"
    set -g __fish_git_prompt_char_conflictedstate "✖"
    set -g __fish_git_prompt_char_cleanstate "✔"

    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles blue
    set -g __fish_git_prompt_color_cleanstate green --bold
    printf "└─[%s" (__fish_git_prompt "%s")
    set_color -o blue
    printf "]"

    # Regular user or root
    set_color -o blue
    if test (command whoami) = root
        printf " ─ [%%] "
    else
        printf " ─ [\$] "
    end
    set_color normal

    # If the last command took longer the ten seconds, send a notification
    if test $CMD_DURATION
        if test (expr $CMD_DURATION \> 10) = "1"
            notify-send "$history[1]" "Returned $last_status, took $CMD_DURATION seconds" -t 5000 -i emblem-default
        end
    end
end

