# Filesystem
alias cp="cp -i" # confirm
alias mv="mv -i" # confirm
alias rm="rm -i" # confirm

# opens a file in the user's preferred application
command -v xdg-open >/dev/null 2>&1 && alias o="xdg-open" || alias o="open"

# Misc
alias a="ag"             # The Silver Searcher
alias hs="history | a"   # History search
alias tm="ps -ef | a"    # Process search
alias get="curl -O"      # Get a file via cURL

# replace built-in grep with GNU grep if available
command -v ggrep >/dev/null 2>&1 && alias grep="ggrep"

# replace built-in sed with GNU sed if available
command -v gsed >/dev/null 2>&1 && alias sed="gsed"

# Git
alias gc="git commit -S -v"
alias gc!="gc --amend"
alias gca="git commit -S -v -a"
alias gca!="gca --amend"
alias gcam="git commit -S -a -m"

# Vim
alias vim="nvim"
alias v="vim"

# File manager
alias f="ranger"

# Launch Python based HTTP Server
alias serve="python -m SimpleHTTPServer"

# Clipboard management
alias xclip="xclip -selection c"
