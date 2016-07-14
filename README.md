# David Anguita's dotfiles

## What's here

Here's my UNIX environment. I'm also maintaining a repo about [Setting up your shiny OS X for software development](https://github.com/danguita/osx-for-developers).

## Components

#### Vim

`.vimrc`

Here goes my favourite editor's settings and plugins, managed by [Vim-plug](https://github.com/junegunn/vim-plug).

#### Zsh

`.zshrc`, `zsh/custom/*`

I use [Zsh](http://www.zsh.org/) as my default shell. This config file is pretty brief because [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) manages most of the config and plugins.

My local config, aliases, functions and environment are located in `$ZSH_CUSTOM` (`$DOTFILES/zsh/custom`).

#### Tmux & GNU Screen

`.tmux.conf`, `.screenrc`

There's nothing to say, these are the most well-known terminal multiplexers. I was using GNU Screen for years but I switched to Tmux + [tmuxinator](https://github.com/aziz/tmuxinator) and I'm really enjoying it.

My Tmux setup is powered by tmuxinator templates like these (probably outdated):
* [tmuxinator template for Rails projects](https://gist.github.com/3023433) (gist)
* [tmuxinator template for CakePHP projects](https://gist.github.com/3033284) (gist)

A Tmux + tmuxinator session looks like this in a regular Rails project:

![tmux statusbar](https://raw.github.com/danguita/dotfiles/master/screenshots/tmux-statusbar.jpg)

#### Slate

`.slate`

[Slate](https://github.com/jigish/slate) is an extremely configurable window management application for OSX.

I have defined some key bindings for support my daily workflow, app switching and window tiling. It's definitely a must have productivity tool.

#### /script

* `osx-system.sh`: Script for setting some defaults in OS X. Forked from [this gist](https://gist.github.com/2260182).

#### Other files

* `.ackrc` for [Ack](http://beyondgrep.com/) text finder
* `.tigrc` for [Tig](http://jonas.nitro.dk/tig/) git client
* `.pentadactylrc` for [Pentadactyl](http://5digits.org/pentadactyl/) [Firefox add-on](https://addons.mozilla.org/es/firefox/addon/pentadactyl/)

## Installation

    mkdir ~/work
    git clone https://github.com/danguita/dotfiles.git ~/work/dotfiles
    cd ~/work/dotfiles
    rake install

### All tasks: Install & Update

    rake dotfiles:install  # Install dotfiles
    rake dotfiles:update   # Update dotfiles
    rake install           # Install dotfiles and related libraries
    rake shell:install     # Install Oh-My-Zsh and change default shell
    rake shell:update      # Update Oh-My-Zsh
    rake update            # Update dotfiles, vim and shell libraries
    rake vim:install       # Install Vim plugins
    rake vim:update        # Update Vim plugins

## Feedback please

Feel free to use and [contribute](https://github.com/danguita/dotfiles/issues)!

