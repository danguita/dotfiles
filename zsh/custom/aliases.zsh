# Filesystem
alias cp="cp -i" # confirm
alias mv="mv -i" # confirm
alias rm="rm -i" # confirm
alias o="open"   # open on OSX
alias O="open ." # open on OSX (cwd)

# Misc
alias a="ag"             # The Silver Searcher
alias hs="history | ack" # History search
alias tm="ps -ef | ack"  # Process search
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

# Launch Python based HTTP Server
alias serve="python -m SimpleHTTPServer"

# Copy SSH pubkey to clipboard
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo \"Public key copied to clipboard\""

# Play sound
alias beep="afplay /System/Library/Sounds/Ping.aiff -v 10"
