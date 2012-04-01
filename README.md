# @danguita's dotfiles

These are some of the dotfiles I need everyday. Note that each depends on a library or a specific software:

### Vim
`.vimrc.after`, `.vimrc.before`, `.gvimrc.after`

These are not regular Vim files, they depend on [Janus Vim distribution](https://github.com/carlhuda/janus), which provides a master `.vimrc` file and tons of auto-managed plugins.

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

### Other files
* `.rvmrc` defines [Ruby Version Manager](http://beginrescueend.com/) path
* `.gitignore` sets the default ignored files in a git repo
* `.gemrc` contains system-wide settings for [rubygems](http://rubygems.org/)

## License
For config files?! Feel free to use any of them.
