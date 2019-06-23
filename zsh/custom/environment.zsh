# shell
export SHELL=${SHELL:-"/usr/local/bin/zsh"}

# term
export TERM="screen-256color"

# editor
export EDITOR="nvim"
export VIM_FILES="$HOME/.vim"

# locale
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Go
export GOPATH=${GOPATH:-"$HOME/.go"}

# Dev Docker machine
[ -d "$HOME/.docker/machine/machines/dev" ] &&
  export DOCKER_TLS_VERIFY="1" &&
  export DOCKER_HOST="tcp://192.168.99.102:2376" &&
  export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/dev" &&
  export DOCKER_MACHINE_NAME="dev"
