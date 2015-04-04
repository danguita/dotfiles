# References:
#
# https://github.com/ryanb/dotfiles
# https://github.com/holman/dotfiles
# https://github.com/eparreno/dotfiles

require 'rake'

desc "Install dotfiles and related libraries"
task install: %w(dotfiles:install shell:install vim:install)

desc "Update dotfiles and related libraries"
task update: %w(dotfiles:update shell:update vim:update)

task default: :update

namespace :dotfiles do
  desc "Install dotfiles"
  task :install do
    install_dotfiles
  end

  desc "Update dotfiles"
  task :update do
    update_dotfiles
  end
end

namespace :vim do
  desc "Install Janus and vim plugins"
  task :install do
    install_janus
    install_vim_plugins
  end

  desc "Update Janus and vim plugins"
  task :update do
    update_janus
    update_vim_plugins
  end
end

namespace :shell do
  desc "Install Oh-My-Zsh and change default shell"
  task :install do
    install_oh_my_zsh
    switch_to_zsh
  end

  desc "Update Oh-My-Zsh"
  task :update do
    update_oh_my_zsh
  end
end

# -- Task methods --------------------------------------------------------------

def install_dotfiles
  say "Installing dotfiles"

  overwrite_all = false
  backup_all    = false

  excluded_files = %w(Rakefile README.md \
                      zsh vim gem script screenshots fonts bin iterm2 \
                      keyremap4macbook)

  dotfiles = Dir.glob('*') - excluded_files

  dotfiles.each do |dotfile|
    overwrite   = false
    backup      = false
    target_name = dotfile_target(dotfile)
    target      = File.join(ENV['HOME'], target_name)

    if File.exists?(target) || File.symlink?(target)
      unless overwrite_all || backup_all
        say "File already exists: #{target}, what do you want to do? " \
        "[s]kip [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all ", :prompt

        case STDIN.gets.chomp
        when 'o' then overwrite     = true
        when 'b' then backup        = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all    = true
        when 's' then next
        end
      end

      backup_file(target) if backup || backup_all
    end

    link_file(dotfile, target)
  end
end

def update_dotfiles
  say "Updating dotfiles"

  dotfiles_dir  = ENV['DOTFILES']
  update_action = 'git pull origin master'

  if File.exists?(dotfiles_dir)
    system %{cd "#{dotfiles_dir}" && #{update_action}}
  end
end

# ZSH framework
# https://github.com/robbyrussell/oh-my-zsh
def install_oh_my_zsh
  if File.exists?(File.join(ENV['HOME'], ".oh-my-zsh"))
    say "Found ~/.oh-my-zsh"
  else
    say "Install oh-my-zsh? [ynq] ", :prompt

    case STDIN.gets.chomp
    when 'y'
      say "Installing oh-my-zsh"
      system %{git clone https://github.com/robbyrussell/oh-my-zsh.git \
              $HOME/.oh-my-zsh}
    when 'q'
      exit
    else
      say "Skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def update_oh_my_zsh
  say "Updating Oh-My-Zsh"

  zsh_dir       = ENV['ZSH']
  update_action = 'git pull origin master'

  if zsh_dir
    system %{cd "#{zsh_dir}" && #{update_action}} if File.exists?(zsh_dir)
  else
    say "$ZSH not found", :error
  end
end

# Vim distribution and plugins
# https://github.com/carlhuda/janus
def install_janus
  say "Install Janus? [ynq] ", :prompt

  case STDIN.gets.chomp
  when 'y'
    say "Installing Janus"

    vim_dir = File.join(ENV['HOME'], ".vim")
    backup_file(vim_dir) if File.exists?(vim_dir)

    system %{git clone https://github.com/carlhuda/janus.git "$HOME/.vim"}
    system %{cd "$HOME/.vim" && rake}
    system %{export VIM_FILES="#{vim_dir}"}
  when 'q'
    exit
  else
    say "Skipping Janus"
  end
end

# $DOTFILES/janus submodules
def install_vim_plugins
  say "Install Vim plugins? [ynq] ", :prompt

  case STDIN.gets.chomp
  when 'y'
    sync_vim_plugins
  when 'q'
    exit
  else
    say "Skipping Vim plugins"
  end
end

# $DOTFILES/janus submodules
def update_vim_plugins
  say "Updating Vim plugins"

  sync_vim_plugins
end

def update_janus
  say "Updating Janus"

  vim_dir       = ENV['VIM_FILES']
  update_action = 'rake default'

  if vim_dir
    system %{cd "#{vim_dir}" && #{update_action}} if File.exists?(vim_dir)
  else
    say "$VIM_FILES not found", :error
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    say "Using zsh"
  else
    say "Switch to zsh? (recommended) [ynq] ", :prompt
    case STDIN.gets.chomp
    when 'y'
      say "Switching to zsh"
      system "chsh -s `which zsh`"
    when 'q'
      exit
    else
      say "Skipping zsh"
    end
  end
end

# -- Helper methods ------------------------------------------------------------

# Default dotfile filename format
def dotfile_format(dotfile)
  ['.', dotfile].join
end

# Specific filename mappings
def dotfile_target_map
  {
    dotcss: '.css',
    dotjs: '.js'
  }
end

# Dotfile to target filename translation
def dotfile_target(dotfile)
  dotfile_target_map[dotfile.to_sym] || dotfile_format(dotfile)
end

def link_file(file, target)
  say "Linking #{file}"

  system %{ln -sf "$PWD/#{file}" "#{target}"}
end

def backup_file(file, remove = true)
  backup_filename = "#{file}.old"
  say "Backing up .#{file} as #{backup_filename}"

  system %{cp -rf "#{file}" "#{backup_filename}"}
  system %{rm -rf "#{file}"} if remove
end

def sync_vim_plugins
  say "Sync submodules"
  system %{git submodule sync}

  say "Update submodules"
  system %{git submodule update --init}
end

def say(text, type = :status)
  say_format =
    case type
    when :status then "\e[32m==> %s\e[0m\n"
    when :prompt then "\e[33m>>> %s\e[0m\n"
    when :error  then "\e[31m!!! %s\e[0m\n"
    else "%s"
    end

  printf(say_format, text)
end
