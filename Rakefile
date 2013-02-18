# References:
#
# https://github.com/ryanb/dotfiles
# https://github.com/holman/dotfiles
# https://github.com/eparreno/dotfiles

require 'rake'

desc "Install dotfiles and related libraries"
task :install do

  # Install libraries and specific software
  install_oh_my_zsh
  switch_to_zsh
  install_janus

  # Install dotfiles
  dotfiles = Dir.glob('*').select { |f| File.file?(f) } - %w(Rakefile README.md)

  overwrite_all = false
  backup_all    = false

  dotfiles.each do |dotfile|
    overwrite = false
    backup    = false
    target    = File.join(ENV['HOME'], ".#{dotfile}")

    if File.exists?(target) || File.symlink?(target)
      unless overwrite_all || backup_all
        prompt "File already exists: #{target}, what do you want to do? [s]kip, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all ", :action
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

desc "Install vim plugins"
task :install_vim_plugins do
  install_vim_plugins
end

desc "Update vim plugins"
task :update_vim_plugins do
  update_vim_plugins
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
      system %{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      prompt "Skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

# Vim distribution and plugins
# https://github.com/carlhuda/janus
def install_janus
  prompt "Install Janus? [ynq] ", :action
  case STDIN.gets.chomp
  when 'y'
    backup_file("$HOME/.vim") if File.exists?(File.join(ENV['HOME'], ".vim"))

    prompt "Installing Janus"
    system %{git clone https://github.com/carlhuda/janus.git "$HOME/.vim"}
    system %{cd "$HOME/.vim" && rake}

    prompt "Installing plugins"
    install_vim_plugins
  when 'q'
    exit
  else
    prompt "Skipping Janus"
  end
end

def install_vim_plugins
  plugin_archive = File.join(Dir.pwd, 'script', 'janus', 'plugin-archive')
  plugin_archive_delimiter = ','
  plugin_dir = File.join(ENV['HOME'], '.janus')

  # Create ~/.janus if not exists
  Dir.mkdir(plugin_dir) unless File.exists?(plugin_dir)

  # Parse plugin archive
  File.open(plugin_archive, 'r').each_line do |plugin_definition|
    name, repo = plugin_definition.split plugin_archive_delimiter
    name, repo = name.strip, repo.strip

    target = File.join(plugin_dir, name)

    if File.exists? target
      prompt "Plugin #{name} already installed"
    else
      prompt "Installing plugin: #{name} (#{repo})"
      system %{git clone "#{repo}" "#{target}"}
    end
  end
end

def update_vim_plugins
  scripts_dir = File.join(Dir.pwd, 'script')
  scripts = []

  scripts << File.join(scripts_dir, 'janus', 'update-plugins.sh')
  scripts << File.join(scripts_dir, 'janus', 'update-plugin-archive.sh')

  scripts.each do |script|
    prompt "Launching #{script}"
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

def link_file(file, target)
  prompt "Linking .#{file}"
  system %{ln -sf "$PWD/#{file}" "#{target}"}
end

def backup_file(file)
  backup_filename = "#{file}.old"

  prompt "Backing up .#{file} as #{backup_filename}"
  system %{cp -rf "#{file}" "#{backup_filename}"}
end

def prompt(text = nil, type = :status)
  case type
  when :status then prefix = '-->'
  when :action then prefix = '!!!'
  end

  puts [prefix, text].join(' ')
end
