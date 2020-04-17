export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="danguita"
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"
export DOTFILES=${DOTFILES:-$HOME/workspace/dotfiles}
export ZSH_CUSTOM=$DOTFILES/zsh/custom

plugins=(git)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
