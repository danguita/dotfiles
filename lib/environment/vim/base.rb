# frozen_string_literal: true

module Environment
  module Vim
    class Base
      include Environment::Utils

      attr_reader :path

      def initialize(options = {})
        @path = options.fetch('path') do
          ENV.fetch('VIM_FILES') { File.join(ENV.fetch('HOME'), '.vim') }
        end
      end

      def install
        say 'Installing Vim-plug'

        backup_file(path) if File.exist?(path)

        system %(export VIM_FILES="#{path}")
        system %(mkdir -p #{path}/_temp)
        system %(mkdir -p #{path}/_backup)
        system %(curl -fLo #{path}/autoload/plug.vim --create-dirs \
                 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
      end

      def update
        say 'Upgrading Vim-plug'

        if path && File.exist?(path)
          system "#{ENV.fetch('EDITOR', 'vim')} +PlugUpgrade +qa"
        else
          say 'VIM_FILES not found', :error
        end
      end
    end
  end
end