# Filesystem
alias cp="cp -i" # confirm
alias mv="mv -i" # confirm
alias rm="rm -i" # confirm
alias o="open"   # open on OSX
alias O="open ." # open on OSX (cwd)

# Misc
alias a="ag"             # The Silver Searcher
alias sed="gsed"         # replace built-in sed (BSD) by GNU sed
alias grep="ggrep"       # replace built-in grep by Homebrew"s one
alias hs="history | ack" # History search
alias tm="ps -ef | ack"  # Process search
alias get="curl -O"      # Get a file via cURL

# Vim
alias vim="/usr/local/bin/vim"
alias vi="vim"
alias Vi="vim ."

# Rubygems
alias chg="chgems ."
alias bundle="chgems . bundle"
alias be="bundle exec"
alias ber="be rails"
alias bek="be rake"

# Git
alias ggup="chgems . git up"
alias gc="git commit -S -v"
alias gc!="gc --amend"
alias gca="git commit -S -v -a"
alias gca!="gca --amend"
alias gcam="git commit -S -a -m"

# Clipboard
alias pbc="pbcopy"
alias pbp="pbpaste"

# Launch Python based HTTP Server
alias serve="python -m SimpleHTTPServer"

# Copy SSH pubkey to clipboard
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo \"Public key copied to clipboard\""

# Play sound
alias beep="afplay /System/Library/Sounds/Ping.aiff -v 10"
