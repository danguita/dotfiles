# shell
export SHELL=/usr/local/bin/zsh

# term
export TERM="screen-256color"

# editor
export EDITOR=vim
export VIM_FILES="$HOME/.vim"

# locale
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# python
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

# nodejs
export NODE_PATH="/usr/local/lib/node"

# Go
export GOPATH="$HOME/.go"

# ack
export ACK_OPTIONS="--pager=less --type-add php=.ctp --type-add js=.coffee" # CakePHP and CoffeeScript templates

# Java
export JAVA_HOME="$(/usr/libexec/java_home)"

# Amazon EC2 API/AMI tools
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export EC2_URL='https://ec2.eu-west-1.amazonaws.com' # Set default region (eu-west / Ireland)

# Docker
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
