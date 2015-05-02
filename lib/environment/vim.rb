require_relative 'utils.rb'

module Environment
  class Vim
    UPDATE_COMMAND = 'rake default'

    def install
      prompt "Install Janus? [ynq]"

      case STDIN.gets.chomp
      when 'y'
        say "Installing Janus"

        backup_file(vim_path) if File.exists?(vim_path)

        system %{git clone https://github.com/carlhuda/janus.git "$HOME/.vim"}
        system %{cd "$HOME/.vim" && rake}
        system %{export VIM_FILES="#{vim_path}"}
      when 'q'
        exit
      else
        say "Skipping Janus"
      end
    end

    def update
      say "Updating Janus"

      if vim_path && File.exists?(vim_path)
        system %{cd "#{vim_path}" && #{UPDATE_COMMAND}}
      else
        say "VIM_FILES not found", :error
      end
    end

    private

    def vim_path
      ENV.fetch('VIM_FILES') { File.join(ENV.fetch('HOME'), '.vim') }
    end
  end
end
