# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Hide default user label on prompt
DEFAULT_USER=david

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

DOTFILES=$HOME/work/dotfiles

ZSH_CUSTOM=$DOTFILES/zsh/custom

source $ZSH/oh-my-zsh.sh

# global options --------------------------------------------------------------

unsetopt correct_all # ZSH's auto-correct sucks hard

# environment ------------------------------------------------------------------

# system
PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
SHELL=/usr/local/bin/zsh
EDITOR=vim

# locale
LC_ALL=en_US.UTF-8
LC_CTYPE=en_US.UTF-8

# python
PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

# nodejs
NODE_PATH="/usr/local/lib/node"

# ack
ACK_OPTIONS="--pager=less --type-add php=.ctp --type-add js=.coffee" # CakePHP and CoffeeScript templates

# Java
JAVA_HOME="$(/usr/libexec/java_home)"

# Amazon EC2 API/AMI tools
EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
EC2_URL='https://ec2.eu-west-1.amazonaws.com' # Set default region

# includes ---------------------------------------------------------------------

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# aliases & functions ---------------------------------------------------------
# at $ZSH_CUSTOM
