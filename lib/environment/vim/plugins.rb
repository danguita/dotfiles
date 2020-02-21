# frozen_string_literal: true

module Environment
  module Vim
    class Plugins
      include Environment::Utils

      def install
        say 'Installing Vim plugins'

        system "#{ENV.fetch('EDITOR', 'vim')} +PlugInstall +qa"
      end

      def update
        say 'Updating Vim plugins'

        system "#{ENV.fetch('EDITOR', 'vim')} +PlugUpdate +qa"
      end
    end
  end
end
