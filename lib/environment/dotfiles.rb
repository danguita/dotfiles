# frozen_string_literal: true

module Environment
  class Dotfiles
    include Environment::Utils

    attr_reader :path

    UPDATE_COMMAND = 'git pull origin master'

    def initialize(options = {})
      @path = options.fetch('path') do
        File.join(ENV.fetch('HOME'), 'workspace', 'dotfiles')
      end
    end

    def install
      say 'Installing dotfiles'

      overwrite_all = false
      backup_all    = false

      dotfiles.each do |dotfile|
        _overwrite = false
        backup     = false
        target     = dotfile_target_for(dotfile)

        if File.exist?(target) || File.symlink?(target)
          unless overwrite_all || backup_all
            prompt "File already exists: #{target}, what do you want to do? " \
              '[s]kip [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all'

            case STDIN.gets.chomp
            when 'o' then _overwrite    = true
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

    def update
      say 'Updating dotfiles'

      if File.exist?(path)
        system %(cd "#{path}" && #{UPDATE_COMMAND})
      else
        say 'DOTFILES does not exist', :error
      end
    end

    def cleanup
      say 'Removing symlinks'

      targets.each do |target|
        File.delete(target) if File.symlink?(target)
      end
    end

    private

    def dotfiles
      manifest.keys
    end

    def targets
      manifest.values
    end

    def dotfile_target_for(file)
      manifest[file]
    end

    def manifest
      @manifest ||= File.readlines('.dotfilesmanifest')
                        .map(&:chomp)
                        .map { |item| item.gsub('$HOME', ENV['HOME']) }
                        .map { |item| item.split('|') }
                        .to_h
    end
  end
end
