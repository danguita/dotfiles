export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="agnoster"
export DEFAULT_USER="$(whoami)"
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"
export DOTFILES=$HOME/work/dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh/custom

plugins=(git rvm rails3 osx bundler)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh
