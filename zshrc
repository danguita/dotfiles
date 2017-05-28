export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="simple"
export DEFAULT_USER="$(whoami)"
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"
export DOTFILES=$HOME/work/dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh/custom

# path
export PATH=/usr/X11/bin:$PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

plugins=(git tmux)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh
