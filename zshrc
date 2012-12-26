# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

DEFAULT_USER=david # used on theme's prompt build

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
plugins=(git rvm rails3 osx bundler)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all # ZSH's auto-correct sucks hard

# environment ------------------------------------------------------------------

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# EDITOR
export EDITOR=vim

# SHELL
export SHELL=/usr/local/bin/zsh

# ZSH
export ZSH=$HOME/.oh-my-zsh

# python
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

# nodejs
export NODE_PATH="/usr/local/lib/node"

# ACK
export ACK_OPTIONS="--pager=less --type-add php=.ctp --type-add js=.coffee" # CakePHP and CoffeeScript templates

# locale
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Java
export JAVA_HOME="$(/usr/libexec/java_home)"

# Amazon EC2 API/AMI tools
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export EC2_URL='https://ec2.eu-west-1.amazonaws.com' # Set default region

# imports ----------------------------------------------------------------------

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# functions --------------------------------------------------------------------

# attach single GNU screen through ssh
# usage: sshs user_name@server_name
sshs() { ssh -t $1 screen -r; }

# attach tmux session through ssh
# usage: ssht user_name@server_name session_name
ssht() { ssh -t $1 tmux attach -t $2; }

# aliases ----------------------------------------------------------------------

# common actions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias o='open'
alias O='open .'

# vim
alias v='vim'
alias V='vim .'
alias altvim='~/Applications/MacVim.app/Contents/MacOS/Vim' # replace built-in vim by MacVim's compiled version w/ ruby support

# tmux
alias tmux='tmux -u2' # explicit UTF-8 and 256-color support
alias t='tmux'

# git
alias gx='gitx'

# heroku
alias h='heroku' # gem
alias ht='/usr/bin/heroku' # toolbelt binary

# postgresql
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pgrestart='pgstop && pgstart'

# cakephp
alias cakeconsole13='../cake/console/cake' # 1.3 console
alias cakeconsole='./Console/cake' # 2.x console

# clipboard
alias pbc='pbcopy'
alias pbp='pbpaste'

# misc
alias serve='python -m SimpleHTTPServer'
