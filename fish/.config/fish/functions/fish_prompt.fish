function fish_prompt
    # Save the status of the last command
    set -l last_status $status

    #### First line ####
    set_color blue
    printf "┌─["

    # Username and hostname
    set_color green
    printf "%s@%s" (whoami) (hostname)

    set_color blue
    printf "] ─ ["

    # Show virtualenv if we are in one
    if set -q VIRTUAL_ENV
        set_color green
        printf (basename $VIRTUAL_ENV)
        set_color blue
        printf "] ─ ["
    end

    # Show nix-shell if we are in one
    if set -q IN_NIX_SHELL; or set -q QUICK_NIX_PACKAGE_NAME
        set_color green
        printf "nix-shell"
        if set -q QUICK_NIX_PACKAGE_NAME
          set_color blue
          printf ":"
          set_color green
          set colored_comma (printf "%s,%s" (set_color blue) (set_color green))
          printf "%s" (string trim -- $QUICK_NIX_PACKAGE_NAME | sed "s/ /$colored_comma/g")
        end
        set_color blue
        printf "] ─ ["
    end

    # Working directory
    set_color green
    printf "%s" (prompt_pwd)
    set_color blue
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
    set_color blue
    printf "]"

    # Regular user or root
    set_color blue
    if test (command whoami) = root
        printf " ─ [%%] "
    else
        printf " ─ [\$] "
    end
    set_color normal

    # If the last command took longer the ten seconds, send a notification
    # if test $CMD_DURATION
    #     echo $CMD_DURATION
    #     echo $CMD_DURATION | wc -m
        
    #     # If there is a letter m in it, it has taken more then ten seconds
    #     if test !(echo $CMD_DURATION | grep -q "m")
    #         notify-send "$history[1]" "Returned $last_status, took $CMD_DURATION seconds" -t 5000 -i emblem-default
    #     else
    #         # If there is no m, remove the s and see if it less then ten
    #         set time (echo $CMD_DURATION | sed "s/s//g")
    #         if test (math "($time+0.5)/1") -gt 10
    #             notify-send "$history[1]" "Returned $last_status, took $CMD_DURATION seconds" -t 5000 -i emblem-default
    #         end
    #     end
    # end
end

