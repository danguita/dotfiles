module Environment
  module Utils
    def say(text, type = :status)
      say_format =
        case type
        when :status then "\e[32m==> %s\e[0m\n"
        when :error  then "\e[31m!!! %s\e[0m\n"
        else "%s"
        end

      printf(say_format, text)
    end

    def prompt(text)
      printf("\e[33m>>> %s\e[0m: ", text)
    end

    def link_file(file, target)
      say "Linking #{file}"

      system %{ln -sf "$PWD/#{file}" "#{target}"}
    end

    def backup_file(file, remove = true)
      backup_filename = "#{file}.old"
      say "Backing up .#{file} as #{backup_filename}"

      system %{cp -rf "#{file}" "#{backup_filename}"}
      system %{rm -rf "#{file}"} if remove
    end
  end
end
