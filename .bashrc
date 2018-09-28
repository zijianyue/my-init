# ------------------------
# prompt
# ------------------------
# export PS1="[\w] "
# export PS1="sailor% "

# if [ "$PS" == "" ] ; then
#     export PS1="sailor\$ "
#     if [ "$TERM" == "xterm" ] ; then
#         export PS1="\[\e[34m\]sailor\$ \[\e[0m\]"
#     elif [ "$TERM" == "cygwin" ] ; then
#         export PS1="\[\e[32;1m\]sailor\$ \[\e[0m\]"
#     fi
# fi

# if [ "$TERM" == "xterm" ] ; then
#     PROMPT_COMMAND='echo -ne "\e]0;${HOSTNAME} - ${PWD}\007"'
# fi

export PS1="[\t]\w: "

# export PS1="\w\012emacs@\h(\!) [\t]% "

# ------------------------
# path
# ------------------------
# PATH=.
# PATH=$PATH:/cygdrive/c/programs/bin
# PATH=$PATH:/usr/x11R6/bin
# PATH=$PATH:/usr/bin
# PATH=$PATH:`cygpath -S`
# PATH=$PATH:`cygpath -W`

# ------------------------
# alias
# ------------------------
alias h=history
# alias rm="rm -i"
# alias ls="ls -C"
alias ll="ls -l"
alias ..="cd .."

export http_proxy=http://usrname:password,@proxyaddress
export https_proxy=http://usrname:password,@proxyaddress
