# frozen_string_literal: true

module Environment
  module Utils
    def say(text, type = :status)
      say_format =
        case type
        when :status then "\e[32m==> %s\e[0m\n"
        when :error  then "\e[31m!!! %s\e[0m\n"
        else '%s'
        end

      printf(say_format, text)
    end

    def prompt(text)
      printf("\e[33m>>> %<text>s\e[0m: ", text: text)
    end

    def link_file(file, target)
      say "Linking #{file}"

      if File.exist?(target) && !File.symlink?(target)
        say "File #{file} already exists. Symlink cannot be created.", :error
        return true
      end

      system %(ln -sfn "$PWD/#{file}" "#{target}")
    end

    def backup_file(file, remove = true)
      backup_filename = "#{file}.old"
      say "Backing up .#{file} as #{backup_filename}"

      system %(cp -rf "#{file}" "#{backup_filename}")
      system %(rm -rf "#{file}") if remove
    end
  end
end
