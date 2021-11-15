# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTFILESIZE=-1

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# auto cd to directories
shopt -s autocd

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
else
  color_prompt=
fi

# Source git-prompt.
[ -f /usr/share/git/git-prompt.sh ] && . /usr/share/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

if [ "$color_prompt" = yes ]; then
  PS1="\[\033[34m\][\t] \[\033[31m\]\h \[\033[32m\]\w\[\033[34m\]\$(__git_ps1 '(%s)')\[$(tput sgr0)\] "
else
  PS1="[\t] \h \w\$(__git_ps1 '(%s)')\[$(tput sgr0)\] "
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Environment definitions.
[ -f ~/.bash_environment ] && . ~/.bash_environment

# Function definitions.
[ -f ~/.bash_functions ] && . ~/.bash_functions

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Source fzf keybindings and completion features.
[ -f /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash
