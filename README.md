# David Anguita dotfiles

## Features

### Vim

`.vimrc.after`, `.vimrc.before`, `.gvimrc.after`

These are not regular Vim files, they depend on [Janus Vim
distribution](https://github.com/carlhuda/janus), which provides a master `.vimrc` file and tons of managed plugins.

* `script/janus/plugin-archive` has all additional vim plugins that are loaded within Janus.
It is auto-generated using [this script](https://github.com/danguita/dotfiles/blob/master/script/janus/update-plugin-archive.sh).
I update these additional plugins by running [this script](https://github.com/danguita/dotfiles/blob/master/script/janus/update-plugins.sh).

### Zsh

`.zshrc`, `zsh/custom/*`

I use [Zsh](http://www.zsh.org/) as my default shell. This config file is pretty brief because [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) manages most of the config and plugins.

My local config, aliases, functions and env variables are located at `$ZSH_CUSTOM` (`$DOTFILES/zsh/custom`).

### Tmux & GNU Screen

`.tmux.conf`, `.screenrc`

There's nothing to say, these are the most well-known terminal multiplexers. I was using GNU Screen for years but I switched to Tmux + [tmuxinator](https://github.com/aziz/tmuxinator) and I'm really enjoying it.

My Tmux setup is powered by tmuxinator templates like these:
* [tmuxinator template for Rails projects](https://gist.github.com/3023433) (gist)
* [tmuxinator template for CakePHP projects](https://gist.github.com/3033284) (gist)

A Tmux + tmuxinator session looks like this (Rails project):

![tmux
statusbar](https://raw.github.com/danguita/dotfiles/master/screenshots/tmux-statusbar.jpg)

### Slate

`.slate`

[Slate](https://github.com/jigish/slate) is an extremely configurable window management application for OSX.

I have defined some key bindings for support my daily workflow, app switching and window tiling. It's definitely a must have productivity tool.

### Mutt

`.muttrc`

There's a config template for the [Mutt](http://www.mutt.org/) E-mail client.

My own parameters have been removed from this file so feel free to set yours up the same way.

### /script

* `osx.sh`: Script for auto-setting lots of system preferences in Mac OS X. Forked from [this gist](https://gist.github.com/2260182). 

### /bin

Binaries path at $HOME, only for user purposes. You might like to add it to your system $PATH.

* `battery`: Thanks to [richoH](https://github.com/richoH) ([source](https://github.com/richoH/dotfiles/blob/master/bin/battery)). Used in [tmux](https://github.com/danguita/dotfiles/blob/master/tmux.conf) status bar.
* `adium-unread.applescript`: Thanks to [lukaszkorecki](https://github.com/lukaszkorecki) ([source](https://github.com/lukaszkorecki/DotFiles/blob/master/bins/Adium.scpt)). Used in [tmux](https://github.com/danguita/dotfiles/blob/master/tmux.conf) status bar.
* `spotify.applescript`: Thanks to [elliottkember](https://github.com/elliottkember)'s [gist](https://gist.github.com/1884925). Used in [tmux](https://github.com/danguita/dotfiles/blob/master/tmux.conf) status bar.
* `itunes.applescript`: Used in [tmux](https://github.com/danguita/dotfiles/blob/master/tmux.conf) status bar.
* `basic-cpu-and-memory.tmux`: Original script from [zaiste](https://github.com/zaiste/tmuxified/blob/master/scripts/basic-cpu-and-memory.tmux). Used in [tmux](https://github.com/danguita/dotfiles/blob/master/tmux.conf) status bar.

### Other files

* `.rvmrc` sets the [Ruby Version Manager](http://beginrescueend.com/) path
* `.gitignore` sets the default ignored files in a git repo
* `.gemrc` contains system-wide settings for [rubygems](http://rubygems.org/)
* `.vimperatorrc` sets some preferences for [Vimperator](http://www.vimperator.org/vimperator) [Firefox add-on](https://addons.mozilla.org/en-US/firefox/addon/vimperator/)

## Installation

    git clone git://github.com/danguita/dotfiles.git ~/work/dotfiles
    cd ~/work/dotfiles
    rake install

### All tasks

    rake dotfiles:install  # Install dotfiles
    rake dotfiles:update   # Update dotfiles
    rake install           # Install dotfiles and related libraries
    rake shell:install     # Install Oh-My-Zsh and change default shell
    rake shell:update      # Update Oh-My-Zsh
    rake update            # Update dotfiles, vim and shell libraries
    rake vim:install       # Install Janus and vim plugins
    rake vim:update        # Update Janus and vim plugins

## License

For config files?! Feel free to use any of them.
