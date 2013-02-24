export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="agnoster"
export DEFAULT_USER="david"
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"

plugins=(git rvm rails3 osx bundler)

export DOTFILES=$HOME/work/dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh/custom

source $ZSH/oh-my-zsh.sh

# Environment ------------------------------------------------------------------
export SHELL=/usr/local/bin/zsh
export PATH=/usr/X11/bin:$PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Includes ---------------------------------------------------------------------
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # RVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"                # NVM
