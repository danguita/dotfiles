# common
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias o='open'
alias O='open .'

# vim
alias v='vim'
alias V='vim .'
alias altvim='~/Applications/MacVim.app/Contents/MacOS/Vim' # replace built-in vim by MacVim's compiled version w/ ruby support

# sed
alias sed='gsed' # replace built-in sed (BSD) by GNU sed

# tmux
alias tmux='tmux -u2' # explicit UTF-8 and 256-color support
alias t='tmux'

# git
alias gx='gitx'

# heroku
alias h='heroku' # gem
alias ht='/usr/bin/heroku' # toolbelt binary

# postgresql
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pgrestart='pgstop && pgstart'

# cakephp
alias cakeconsole13='../cake/console/cake' # 1.3 console
alias cakeconsole='./Console/cake' # 2.x console

# clipboard
alias pbc='pbcopy'
alias pbp='pbpaste'

# misc
alias serve='python -m SimpleHTTPServer'
