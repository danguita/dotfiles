# References:
#
# https://github.com/ryanb/dotfiles
# https://github.com/holman/dotfiles
# https://github.com/eparreno/dotfiles

require 'rake'

desc "Install dotfiles and related libraries"
task :install => %w(dotfiles:install shell:install vim:install)

desc "Update dotfiles and related libraries"
task :update => %w(dotfiles:update shell:update vim:update)

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

task :default => :update

# -- Task methods --------------------------------------------------------------

def install_dotfiles
  prompt "Installing dotfiles"

  overwrite_all = false
  backup_all    = false

  dotfiles = Dir.glob('*') - %w(Rakefile README.md \
                                zsh vim script screenshots fonts bin iterm2)

  dotfiles.each do |dotfile|
    overwrite   = false
    backup      = false
    target_name = dotfile_target(dotfile)
    target      = File.join(ENV['HOME'], target_name)

    if File.exists?(target) || File.symlink?(target)
      unless overwrite_all || backup_all
        prompt "File already exists: #{target}, what do you want to do? " \
        "[s]kip [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all ", :action

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
  prompt "Updating dotfiles"

  dotfiles_dir  = Dir.pwd
  update_action = 'git pull origin master'

  system %{cd "#{dotfiles_dir}" && #{update_action}} if File.exists?(dotfiles_dir)
end

# ZSH framework
# https://github.com/robbyrussell/oh-my-zsh
def install_oh_my_zsh
  if File.exists?(File.join(ENV['HOME'], ".oh-my-zsh"))
    prompt "Found ~/.oh-my-zsh"
  else
    prompt "Install oh-my-zsh? [ynq] ", :action

    case STDIN.gets.chomp
    when 'y'
      prompt "Installing oh-my-zsh"
      system %{git clone https://github.com/robbyrussell/oh-my-zsh.git \
              $HOME/.oh-my-zsh}
    when 'q'
      exit
    else
      prompt "Skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def update_oh_my_zsh
  prompt "Updating Oh-My-Zsh"

  zsh_dir       = ENV['ZSH']
  update_action = 'git pull origin master'

  if zsh_dir
    system %{cd "#{zsh_dir}" && #{update_action}} if File.exists?(zsh_dir)
  else
    prompt "$ZSH not found", :error
  end
end

# Vim distribution and plugins
# https://github.com/carlhuda/janus
def install_janus
  prompt "Install Janus? [ynq] ", :action

  case STDIN.gets.chomp
  when 'y'
    prompt "Installing Janus"

    vim_dir = File.join(ENV['HOME'], ".vim")
    backup_file(vim_dir) if File.exists?(vim_dir)

    system %{git clone https://github.com/carlhuda/janus.git "$HOME/.vim"}
    system %{cd "$HOME/.vim" && rake}
    system %{export VIM_FILES="#{vim_dir}"}
  when 'q'
    exit
  else
    prompt "Skipping Janus"
  end
end

# $HOME/.janus plugins
def install_vim_plugins
  prompt "Install Vim plugins? [ynq] ", :action

  case STDIN.gets.chomp
  when 'y'
    plugin_dir         = File.join(ENV['HOME'], '.janus')
    plugin_archive     = File.join(Dir.pwd, 'script', 'janus', 'plugin-archive')
    plugin_archive_del = ','

    # Create ~/.janus if not exists
    Dir.mkdir(plugin_dir) unless File.exists?(plugin_dir)

    # Parse plugin archive
    File.open(plugin_archive, 'r').each_line do |plugin_definition|
      name, repo = plugin_definition.split plugin_archive_del
      name, repo = name.strip, repo.strip

      target = File.join(plugin_dir, name)

      if File.exists? target
        prompt "Plugin #{name} already installed"
      else
        prompt "Installing plugin: #{name} (#{repo})"
        system %{git clone "#{repo}" "#{target}"}
      end
    end
  when 'q'
    exit
  else
    prompt "Skipping Vim plugins"
  end
end

def update_janus
  prompt "Updating Janus"

  vim_dir       = ENV['VIM_FILES']
  update_action = 'rake default'

  if vim_dir
    system %{cd "#{vim_dir}" && #{update_action}} if File.exists?(vim_dir)
  else
    prompt "$VIM_FILES not found", :error
  end
end

def update_vim_plugins
  prompt "Updating Vim plugins"

  scripts_dir = File.join(Dir.pwd, 'script')
  scripts     = []

  scripts << File.join(scripts_dir, 'janus', 'update-plugins.sh')
  scripts << File.join(scripts_dir, 'janus', 'update-plugin-archive.sh')

  scripts.each do |script|
    prompt "Running #{script}"
    system(script) if File.exists?(script)
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    prompt "Using zsh"
  else
    prompt "Switch to zsh? (recommended) [ynq] ", :action
    case STDIN.gets.chomp
    when 'y'
      prompt "Switching to zsh"
      system "chsh -s `which zsh`"
    when 'q'
      exit
    else
      prompt "Skipping zsh"
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
    'dotcss' => '.css',
    'dotjs'  => '.js'
  }
end

# Dotfile to target filename translation
def dotfile_target(dotfile)
  dotfile_target_map[dotfile] || dotfile_format(dotfile)
end

def link_file(file, target)
  prompt "Linking #{file}"

  system %{ln -sf "$PWD/#{file}" "#{target}"}
end

def backup_file(file, remove = true)
  backup_filename = "#{file}.old"
  prompt "Backing up .#{file} as #{backup_filename}"

  system %{cp -rf "#{file}" "#{backup_filename}"}
  system %{rm -rf "#{file}"} if remove
end

def prompt(text = nil, type = :status)
  prefix = case type
           when :status then '-->'
           when :action then '>>>'
           when :error  then '!!!'
           end

  puts [prefix, text].join(' ')
end
