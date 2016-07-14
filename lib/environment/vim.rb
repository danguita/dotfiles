module Environment
  class Vim
    include Environment::Utils

    attr_reader :path

    def initialize(options = {})
      @path = options.fetch('path') do
        ENV.fetch('VIM_FILES') { File.join(ENV.fetch('HOME'), '.vim') }
      end
    end

    def install
      prompt "Install Vim-plug? [ynq]"

      case STDIN.gets.chomp
      when 'y'
        say "Installing Vim-plug"

        backup_file(path) if File.exists?(path)

        system %{export VIM_FILES="#{path}"}
        system %{mkdir -p #{path}/{_temp,_backup}}
        system %{curl -fLo #{path}/autoload/plug.vim --create-dirs \
                 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim}
      when 'q'
        exit
      else
        say "Skipping Vim-plug"
      end
    end

    def update
      say "Upgrading Vim-plug and plugins"

      if path && File.exists?(path)
        system %{vim -c ':PlugUpgrade | qa!'}
      else
        say "VIM_FILES not found", :error
      end
    end
  end
end
