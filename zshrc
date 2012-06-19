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
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow rvm rails3 gem rake bundler osx vagrant brew)

source $ZSH/oh-my-zsh.sh

# Node export
export NODE_PATH="/usr/local/lib/node"

# PATH export
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/.rvm/bin

# PYTHONPATH export
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

# EDITOR export
export EDITOR=vim

# SHELL export
export SHELL=/usr/local/bin/zsh

# ZSH export
export ZSH=$HOME/.oh-my-zsh

# BYOBU_PREFIX export
export BYOBU_PREFIX=`brew --prefix`

# Auto-correct sucks hard
unsetopt correct_all

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
alias o='open'
alias O='open .'

# misc
alias serve='python -m SimpleHTTPServer'

# cakephp1.3 console
alias cakeconsole13='../cake/console/cake'

# cakephp2 console
alias cakeconsole='./Console/cake'

# ack options (CakePHP and CoffeeScript templates)
export ACK_OPTIONS="--pager=less --type-add php=.ctp --type-add js=.coffee"

# replace built-in vim by MacVim's compiled version w/ ruby support
alias vim='~/Applications/MacVim.app/Contents/MacOS/Vim'
alias v='vim'
alias V='vim .'

# tmux with explicit UTF-8 and 256-color support
alias tmux='tmux -u2'
alias tm='tmux'
