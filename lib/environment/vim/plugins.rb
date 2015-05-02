require_relative '../utils.rb'

module Environment
  class Vim::Plugins
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
      say "Sync submodules"
      system %{git submodule sync}

      say "Update submodules"
      system %{git submodule update --init}
    end
  end
end
