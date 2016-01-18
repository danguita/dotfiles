# Filesystem
alias cp="cp -i" # confirm
alias mv="mv -i" # confirm
alias rm="rm -i" # confirm
alias o="open"   # open on OSX
alias O="open ." # open on OSX (cwd)

# Misc
alias c="clear"
alias a="ag"             # The Silver Searcher
alias sed="gsed"         # replace built-in sed (BSD) by GNU sed
alias grep="ggrep"       # replace built-in grep by Homebrew"s one
alias hs="history | ack" # History search
alias tm="ps -ef | ack"  # Process search
alias get="curl -O"      # Get a file via cURL

# Shorts
alias gx="gitx"                  # GitX short
alias t="tig"                    # Tig short
alias h="/usr/bin/heroku"        # Heroku toolbelt
alias vagrant="/usr/bin/vagrant" # Vagrant binary
alias vg="vagrant"               # Vagrant short
alias tv="bundle exec travis"    # Travis CI CLI (gem)

# Vim
alias vim="/usr/local/bin/vim"
alias vi="vim"
alias Vi="vim ."

# Docker
alias dockerc="docker-compose"
alias dockerm="docker-machine"

# Postgresql
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias pgrestart="pgstop && pgstart"

# Elasticsearch
alias esstart="elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"

# Rubygems
alias chg="chgems ."
alias bundle="chgems . bundle"
alias be="bundle exec"
alias ber="be rails"
alias bek="be rake"

# Git
alias ggup="chgems . git up"
alias gcr="gc --reedit-message=HEAD"
alias gcar="gca --reedit-message=HEAD"

# CakePHP
alias cakeconsole13="../cake/console/cake" # 1.3 console
alias cakeconsole="./Console/cake"         # 2.x console

# Clipboard
alias pbc="pbcopy"
alias pbp="pbpaste"

# Launch Python based HTTP Server
alias serve="python -m SimpleHTTPServer"

# Copy SSH pubkey to clipboard
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo \"Public key copied to clipboard\""

# Play sound
alias beep="afplay /System/Library/Sounds/Ping.aiff -v 10"
