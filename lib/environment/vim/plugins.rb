module Environment
  class Vim::Plugins
    include Environment::Utils

    def install
      prompt "Install Vim plugins? [ynq]"

      case STDIN.gets.chomp
      when 'y'
        sync_vim_plugins
      when 'q'
        exit
      else
        say "Skipping Vim plugins"
      end
    end

    def update
      say "Updating Vim plugins"

      sync_vim_plugins
    end

    private

    def sync_vim_plugins
      system %{vim -c ':PlugUpdate | qa!'}
    end
  end
end
