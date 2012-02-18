# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow rvm brew)

source $ZSH/oh-my-zsh.sh

# Node export
export NODE_PATH="/usr/local/lib/node"

# PATH export
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# PYTHONPATH export
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

# EDITOR export
export EDITOR=vim

# ZSH export
export ZSH=$HOME/.oh-my-zsh

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# functions:

# attach single GNU screen through ssh
# usage: sshs user_name@server_name
sshs() { ssh -t $1 screen -r; }

# attach tmux session through ssh
# usage: ssht user_name@server_name session_name
ssht() { ssh -t $1 tmux attach -t $2; }

# aliases:

# common actions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# cakephp1.3 console
alias cakeconsole13='../cake/console/cake'

# cakephp2 console
alias cakeconsole='./Console/cake'

# force tmux 256color mode
# alias tmux='TERM=screen-256color tmux'

# ack options (CakePHP and CoffeeScript templates)
export ACK_OPTIONS="--pager=less --type-add php=.ctp --type-add js=.coffee"

# replace built-in vim by MacVim's compiled version w/ ruby support
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# customize prompt
# PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
# ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
