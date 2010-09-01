# Custom system-wide bashrc for interactive shells.
#[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

[ -f /etc/profile ] && . /etc/profile
[ -f ~/.profile ] && . ~/.profile

[ -z "$PS1" ] && return


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


alias xterm="aterm -bg black -fg green -cr darkgreen"
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:~/bin #::$PATH

set bell-style none
#export EDITOR=vif
shopt -s cdspell extglob no_empty_cmd_completion checkwinsize histappend
#PROMPT_COMMAND='history -a'
ulimit -c unlimited

case $TERM in
  xterm*|rxvt|Eterm|eterm)
     PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"; history -a'
     ;;
  screen)
     PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"; history -a'
     ;;
esac


umask 003
#!/bin/sh
# aliases and functions

f(){
   find -iname \*$*\*
}
g(){
    grep --color -rIin "$*" *
}
p(){
#    ps aux | grep --color=always $*
	ps -eALo pid,spid,user,priority,ni,pcpu,vsize,time,args | grep $@
}
pps(){
    ps -eL -o user,pid,ppid,%mem,state,eip,wchan=WIDE,command | egrep --color=always $*
}

rsym(){
    if [ -z "$1" ]
        then
        echo "Test linkage of one or more libs. But you gotta tell me which lib."
        return
    fi
    _tmpfile=`tempfile -p rsym_`
    _ldflags="-L/opt/norman/npm/lib"
    if [ -n "$LD_LIBRARY_PATH" ]
        then
        _ldflags="-L$LD_LIBRARY_PATH $_ldflags"
    fi
    _dummyf=`tempfile -p rsym_ -s .c`
    cat > $_dummyf << 'EOF'
#include <stdio.h>
main(){
    printf("Dummy!\n");
}
EOF

    for lib in $@
    do
        _ldflags="$_ldflags -l$lib"
        gcc /src/dummy.c $_ldflags -o $_tmpfile
    done
    #rm -f $_tmpfile $_dummyf
}

fsym(){
    if [ -z "$1" ]
        then
        echo "Hunt for a symbol. What symbol, sire?"
        return
    fi
    files=`find $2 -name '*.o' -or -name '*.so'`
    for i in $files
        do
        if nm $i | grep $1
            then
            echo "found in $i"
        fi
    done
}


# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
   #eval "`dircolors -b ~/.dircolors.db`"
   alias ls='ls --color=auto'
   alias dir='ls --color=auto --format=vertical'
   alias vdir='ls --color=auto --format=long'
   alias grep='grep --color=auto'
   alias gi='grep -rIin'
   alias less='less -FRX'
   alias ll='ls -l'
   alias la='ls -A'
   alias l='ls -CF'
   alias ..="cd .."
   alias ...="cd ../.."
   alias ....="cd ../../.."
   alias .....="cd ../../../.."
   alias ......="cd ../../../../.."
   alias .......="cd ../../../../../.."
   alias ........="cd ../../../../../../.."
   alias .........="cd ../../../../../../../.."
   alias ..........="cd ../../../../../../../../.."
   alias ...........="cd ../../../../../../../../../.."
   alias ............="cd ../../../../../../../../../../.."
fi
if [ "$PS1" ]; then
	eval "$(lesspipe)"
	#fortune
fi
