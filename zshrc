export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="agnoster"

export DEFAULT_USER="david" # Hide the user label on theme's prompt

export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"
# export CASE_SENSITIVE="true"
# export DISABLE_LS_COLORS="true"

plugins=(git rvm rails3 osx bundler)

export DOTFILES=$HOME/work/dotfiles

export ZSH_CUSTOM=$DOTFILES/zsh/custom

source $ZSH/oh-my-zsh.sh

# global options --------------------------------------------------------------

unsetopt correct_all # ZSH's auto-correct sucks hard

# environment ------------------------------------------------------------------

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export SHELL=/usr/local/bin/zsh

# rest of environment ---------------------------------------------------------
#
# * $ZSH_CUSTOM/environment.zsh

# includes ---------------------------------------------------------------------

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# aliases & functions ----------------------------------------------------------
#
# * $ZSH_CUSTOM/aliases.zsh
# * $ZSH_CUSTOM/custom.zsh
