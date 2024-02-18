function fish_prompt
    # Disable PWD shortening by default.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 3
    
    if test -n "$SSH_TTY"
        set abbr_prompt_hostname (string replace workstation ws (prompt_hostname))
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)$abbr_prompt_hostname' '
        ＃echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color blue)(prompt_pwd)' '

    set_color -o
    if fish_is_root_user
        echo -n (set_color red)'# '
    end
    # echo -n (set_color brblue)'['(set_color brblue)(date "+%H:%M")(set_color brblue)'] '
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end
