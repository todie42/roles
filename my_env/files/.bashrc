
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
 if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -s globstar


alias ll='ls -alph --color=auto'
alias lt='ls -laprth --color=auto'
alias ls='ls -aph --color=auto'
if [ -f ~/.bashrc_sudo ]; then
  alias sudosu='sudo bash --init-file ~/.bashrc_sudo'
fi


export BC_ENV_ARGS=~/.bc
export HISTIGNORE='up:upp:uppp:upppp:dn:dnn:dnnn:dnnnn:history:ll'
export HISTTIMEFORMAT='%F %T '
export TITLEBAR='\[\e]0;\w\a\]'
export PROMPT='\[\e[1;32m\]\u@\h \w\n\$\[\e[1;32m\]\[\e[0m\]'
export PS1="${TITLEBAR}${PROMPT}"
function stitle() { PS1="\[\e]0;$*\a\]${PROMPT}"; }


function cd() { builtin cd "$@" && ls -lpah --color=auto; }
alias up='pushd .. >/dev/null; cd .'
alias upp='pushd ../.. >/dev/null; cd .'
alias uppp='pushd ../../.. >/dev/null; cd .'
alias upppp='pushd ../../../.. >/dev/null; cd .'
alias uppppp='pushd ../../../../.. >/dev/null; cd .'

alias dn='popd >/dev/null; cd .'
alias dnn='popd >/dev/null; popd >/dev/null; cd .'
alias dnnn='popd >/dev/null; popd >/dev/null; popd >/dev/null; cd .'
alias dnnnn='popd >/dev/null; popd >/dev/null; popd >/dev/null; popd >/dev/null; cd .'

