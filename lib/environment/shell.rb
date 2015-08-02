module Environment
  class Shell
    include Environment::Utils

    attr_reader :path

    def initialize(options = {})
      @path = options.fetch('path') do
        File.join(ENV.fetch('HOME'), '.oh-my-zsh')
      end
    end

    def install
      if File.exists?(path)
        say "Found ~/.oh-my-zsh"
      else
        prompt "Install oh-my-zsh? [ynq]"

        case STDIN.gets.chomp
        when 'y'
          say "Installing oh-my-zsh"
          system %{git clone https://github.com/robbyrussell/oh-my-zsh.git #{path}}
        when 'q'
          exit
        else
          say "Skipping oh-my-zsh, you will need to change ~/.zshrc"
        end
      end
    end

    def update
      say "Updating Oh-My-Zsh"

      zsh_path = ENV['ZSH']
      update_action = 'git pull origin master'

      if zsh_path && File.exists?(zsh_path)
        system %{cd "#{zsh_path}" && #{update_action}}
      else
        say "$ZSH not found", :error
      end
    end

    def setup
      if ENV['SHELL'] =~ /zsh/
        say "Using zsh"
      else
        prompt "Switch to zsh? (recommended) [ynq]"

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
  end
end
