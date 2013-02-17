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

def link_file(file, target)
  prompt "Linking .#{file}"
  system %{ln -sf "$PWD/#{file}" "#{target}"}
end

def backup_file(file)
  backup_file = "#{file}.old"

  prompt "Backing up .#{file} as #{backup_file}"
  system %{cp -rf "#{file}" "#{backup_file}"}
end

# ZSH framework
# https://github.com/robbyrussell/oh-my-zsh
def install_oh_my_zsh
  if File.exists?(File.join(ENV['HOME'], ".oh-my-zsh"))
    prompt "found ~/.oh-my-zsh"
  else
    prompt "install oh-my-zsh? [ynq] ", :action
    case STDIN.gets.chomp
    when 'y'
      prompt "Installing oh-my-zsh"
      system %{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      prompt "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

# Vim distribution
# https://github.com/carlhuda/janus
def install_janus
  prompt "install Janus? [ynq] ", :action
  case STDIN.gets.chomp
  when 'y'
    backup_file("$HOME/.vim") if File.exists?(File.join(ENV['HOME'], ".vim"))

    prompt "installing Janus"
    system %{git clone https://github.com/carlhuda/janus.git "$HOME/.vim"}
    system %{cd "$HOME/.vim" && rake}
  when 'q'
    exit
  else
    prompt "skipping Janus"
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    prompt "using zsh"
  else
    prompt "switch to zsh? (recommended) [ynq] ", :action
    case STDIN.gets.chomp
    when 'y'
      prompt "switching to zsh"
      system "chsh -s `which zsh`"
    when 'q'
      exit
    else
      prompt "skipping zsh"
    end
  end
end

def prompt(text = nil, type = :status)
  case type
  when :status then prefix = '-->'
  when :action then prefix = '!!!'
  end

  puts [prefix, text].join(' ')
end
