# Listing
alias ll="ls -l"
alias la="ls -A"
alias l="ls -CF"

# Filesystem
alias cp="cp -i" # Prompt before overwrite
alias mv="mv -i" # Prompt before overwrite
alias rm="rm -i" # Prompt before overwrite

# Git
alias gc="git commit -S -v"
alias gc!="gc --amend"
alias gca="git commit -S -v -a"
alias gca!="gca --amend"
alias gcam="git commit -S -a -m"
alias gb="git branch"
alias gst="git status"
alias gco="git checkout"
alias gr="git remote"
alias grv="git remote --verbose"
alias gm="git merge"
alias gl="git pull"
alias gp="git push"
alias gd="git diff"
alias gba="git branch --all"
alias gsta="git stash push"
alias gstp="git stash pop"
alias gstl="git stash list"
alias glg="git log"
alias glo="git log --oneline --decorate"
alias gg="git gui &!"

# Misc
alias a="ag"           # The Silver Searcher
alias hs="history | a" # History search
alias tm="ps -ef | a"  # Process search
alias get="curl -O -L" # Get something via cURL

# Vim
alias vim="nvim"
alias vi="vim"
alias v="vim"

# File manager
alias f="ranger"

# Terminal multiplexer
alias t="tmux"

# Opens a file in the user's preferred application
alias open="xdg-open"

# Launches a Python based HTTP Server
alias serve="python -m SimpleHTTPServer"

# Defaults xclip selection to clipboard
alias xclip="xclip -selection c"
