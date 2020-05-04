# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'rake'
require 'environment'

desc 'Install dotfiles and related libraries'
task install: %w[dotfiles:install vim:install]

desc 'Update dotfiles and related libraries'
task update: %w[dotfiles:update vim:update]

task default: :update

namespace :dotfiles do
  desc 'Install dotfiles'
  task :install do
    Environment::Dotfiles.new(path: ENV['DOTFILES']).install
  end

  desc 'Update dotfiles'
  task :update do
    Environment::Dotfiles.new(path: ENV['DOTFILES']).update
  end

  desc 'Clean up dotfiles'
  task :cleanup do
    Environment::Dotfiles.new(path: ENV['DOTFILES']).cleanup
  end
end

namespace :vim do
  desc 'Install Vim plugins'
  task :install do
    Environment::Vim::Base.new.install
    Environment::Vim::Plugins.new.install
  end

  desc 'Update Vim plugins'
  task :update do
    Environment::Vim::Base.new.update
    Environment::Vim::Plugins.new.update
  end
end
