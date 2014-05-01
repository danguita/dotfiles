# Ruby version management: chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Node Version Manager
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh ]]

# gh alias git
[[ -s `brew --prefix`/bin/gh ]] && eval "$(gh alias -s)"

# DMSTK tools
[[ -s "$HOME/work/domestika-tools/bin/dmstk" ]] && eval "$($HOME/work/domestika-tools/bin/dmstk init -)"
