# @danguita's dotfiles

These are some of the dotfiles I need everyday. Note that each depends on a library or a specific software:

### Vim
`.vimrc.after`, `.vimrc.before`, `.gvimrc.after`

These are not regular Vim files, they depend on [Janus Vim distribution](https://github.com/carlhuda/janus), which provides a master `.vimrc` file and tons of auto-managed plugins.

* `janus-plugins` contains all additional vim plugins that are loaded within Janus. It is auto-generated using a command [ike this](https://gist.github.com/2436641).

### Zsh
`.zshrc`

I use [ZSH](http://www.zsh.org/) as my default shell. This config file is pretty brief because [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) manages most of the config and plugins.

### GNU screen & tmux
`.screenrc`, `.tmux.conf`

There's nothing to say, these are the most well-known terminal multiplexers. I was using screen for years but I'm currently switching to tmux + [tmuxinator](https://github.com/aziz/tmuxinator).

### Mutt
`.muttrc`

There's a config template for the [Mutt](http://www.mutt.org/) E-mail
client.

My own parameters have been removed from this file so feel free to set yours up
the same way.

### /script
* `osx.sh`: Script for auto-setting lots of system preferences in Mac OS X.
  Forked from [this gist](https://gist.github.com/2260182). 

### /bin
Binaries path at $HOME, only for user purposes. You might like to add it
to your system $PATH.

* `battery`: Thanks to [richoH](https://github.com/richoH) ([source](https://github.com/richoH/dotfiles/blob/master/bin/battery)). Used in [tmux](https://github.com/danguita/dotfiles/blob/master/tmux.conf) status bar.
* `adium-unread`: Thanks to [lukaszkorecki](https://github.com/lukaszkorecki) ([source](https://github.com/lukaszkorecki/DotFiles/blob/master/bins/Adium.scpt)). Used in [tmux](https://github.com/danguita/dotfiles/blob/master/tmux.conf) status bar.

### Other files
* `.rvmrc` defines [Ruby Version Manager](http://beginrescueend.com/) path
* `.gitignore` sets the default ignored files in a git repo
* `.gemrc` contains system-wide settings for [rubygems](http://rubygems.org/)

## License
For config files?! Feel free to use any of them.
