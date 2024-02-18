if status is-interactive
    # Commands to run in interactive sessions can go here
end
function scl_source
    for line in (command scl_source $argv)
        eval $line
    end
end

scl_source enable devtoolset-10 rh-git227 rh-mariadb105

eval /usr/bin/modulecmd bash load mpi/openmpi3-x86_64

alias ... 'cd ../..'
alias libratask_src_exe "sh -c 'cd ./LibraTask/src && python3 RetargetProjectDissectTests.py'"
alias ctest "ctest -L '(smoking|golden)'"
# alias doconfig "rm /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build;ln -s /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build-rel /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build;sh -c 'cd /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build;cmake .. -DCMAKE_BUILD_TYPE=release -DGTEST=1 -DCMAKE_CXX_CLANG_TIDY="" -DYUWEI_MAKE_RELEASE=1 -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_LIBRARY=/usr/lib64/libpython3.so'"
alias doconfig "cmake .. -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=release -DWITH_FDTD_SOLVER=OFF -DCMAKE_CXX_CLANG_TIDY='' -DCMAKE_C_COMPILER=/opt/rh/devtoolset-10/root/usr/bin/gcc -DCMAKE_CXX_COMPILER=/opt/rh/devtoolset-10/root/usr/bin/g++ -DGTEST=1 -DYUWEI_MAKE_RELEASE=1 -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_LIBRARY=/usr/lib64/libpython3.so"
# alias doconfig_debug "rm /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build;ln -s /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build-dbg /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build;sh -c 'cd /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build;cmake .. -DCMAKE_BUILD_TYPE=debug -DGTEST=1 -DBIAS_RULE=1 -DCMAKE_CXX_CLANG_TIDY="" -DYUWEI_MAKE_RELEASE=1 -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_LIBRARY=/usr/lib64/libpython3.so'"
alias doconfig_debug "cmake .. -DCMAKE_BUILD_TYPE=debug -G 'Unix Makefiles' -DWITH_FDTD_SOLVER=OFF -DCMAKE_CXX_CLANG_TIDY='' -DGTEST=1 -DYUWEI_MAKE_RELEASE=1 -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_LIBRARY=/usr/lib64/libpython3.so"
alias docmake2 'cmake --build . --parallel 2'
# alias docmake_brief10 'cmake --build . --parallel 10'
alias domake 'cmake --build . --parallel 4'
alias doclear 'rm CMakeCache.txt CMakeFiles/ -rf Makefile *.cmake _deps/'
alias h history
alias docmake_task 'cmake --build ./LibraTask/ --parallel 10'
alias bco bcompare
alias term=gnome-terminal
alias e=emacs
alias sou="source ~/.config/fish/config.fish"
alias ff=find_file
alias fb=open_file_below
alias pullall='git submodule foreach git pull --ff-only'
alias syncsub='git submodule update --recursive --init'
alias ls='ls -a --color=auto --group-directories-first'
alias ll='ls -l'
alias batchcpso='cd /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build/LibraTask/src
cp *.so* ~/tmpVer
cd /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build/LibraModel/src
cp *.so* ~/tmpVer
cd /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build/LibraGeometry/src
cp *.so* ~/tmpVer
cd /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build/LibraInfrastructure/src/
cp *.so* ~/tmpVer
cd /home/gezijian/Yuwei/Libra/LibraPackAutoVersion/build/'
alias batchcpso2='cd /home/gezijian/Yuwei/LibraPackAutoVersion/build/LibraTask/src
cp *.so* ~/tmpVer
cd /home/gezijian/Yuwei/LibraPackAutoVersion/build/LibraModel/src
cp *.so* ~/tmpVer
cd /home/gezijian/Yuwei/LibraPackAutoVersion/build/LibraGeometry/src
cp *.so* ~/tmpVer
cd /home/gezijian/Yuwei/LibraPackAutoVersion/build/LibraInfrastructure/src/
cp *.so* ~/tmpVer
cd /home/gezijian/Yuwei/LibraPackAutoVersion/build/'
# base func for vterm
function vterm_printf;
    if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end 
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

# vterm-clear-scrollback
if [ "$INSIDE_EMACS" = 'vterm' ]
    function clear
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    end
end
# print the title for vterm-buffer-name-string
function fish_title
    hostname
    echo ":"
    prompt_pwd
end
# Directory tracking and Prompt tracking
function vterm_prompt_end;
    vterm_printf '51;A'(whoami)'@'(hostname)':'(pwd)
end

# 仅在 vterm_old_fish_prompt 不存在时复制，避免source时报错
if ! functions --query vterm_old_fish_prompt
   functions --copy fish_prompt vterm_old_fish_prompt
end  
function fish_prompt --description 'Write out the prompt; do not replace this. Instead, put this at end of your file.'
    # Remove the trailing newline from the original prompt. This is done
    # using the string builtin from fish, but to make sure any escape codes
    # are correctly interpreted, use %b for printf.
    printf "%b" (string join "\n" (vterm_old_fish_prompt))
    vterm_prompt_end
end

# Message passing
function vterm_cmd --description 'Run an Emacs command among the ones been defined in vterm-eval-cmds.'
    set -l vterm_elisp ()
    for arg in $argv
        set -a vterm_elisp (printf '"%s" ' (string replace -a -r '([\\\\"])' '\\\\\\\\$1' $arg))
    end
    vterm_printf '51;E'(string join '' $vterm_elisp)
end
# find_file命令可以在vterm中使用，即用当前emacs打开指定文件，不加参数就会用dired打开当前目录
function find_file
    set -q argv[1]; or set argv[1] "."
    vterm_cmd find-file (realpath "$argv")
end
# 在vterm窗口下面打开
function open_file_below
    set -q argv[1]; or set argv[1] "."
    vterm_cmd find-file-below (realpath "$argv")
end

function say
    vterm_cmd message "%s" "$argv"
end

# Rust配置
if status is-interactive
    set -x PATH $HOME/.cargo/bin $PATH
end
alias gitdiffcolor='git diff | colordiff'
set -x EDITOR "emacs -nw -Q"
set -x VISUAL "$EDITOR"
# export EDITOR="emacs -nw -Q" # 这是启动终端模式的emacs，而不是一个新窗口
# set -e http_proxy
# set -e https_proxy
# set -x http_proxy "http://127.0.0.1:9910"
# set -x https_proxy "http://127.0.0.1:9910"
export PATH="/opt/cmake-3.23.2-linux-x86_64/bin:$PATH"
export PATH="/opt/llvm-15.0.7/bin/:$PATH"
set -x PATH /home/gezijian/Downloads/tools/fd-v8.7.0-x86_64-unknown-linux-musl $PATH
set -x PATH /usr/local/texlive/2023/bin/x86_64-linux $PATH
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval (eval /usr/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<
alias cirun='ctest --extra-verbose -S CTestRunnerJob.cmake'
alias ec='emacsclient -c -a ""'
alias rimedeploy='touch ~/.config/ibus/rime/; ibus restart'

# 单独执行一个用例
# sh -c 'cd ./LibraTask/src && python3 -m unittest EdgeBiasTests.EdgeBiasTests.testcase_bias_reset_new_connect_edge';date
