module Environment
  class Vim::Plugins
    include Environment::Utils

    def install
      say "Installing Vim plugins"

      sync_vim_plugins
    end

    def update
      say "Updating Vim plugins"

      sync_vim_plugins
    end

    private

    def sync_vim_plugins
      system "vim +PlugUpdate +qa"
    end
  end
end
